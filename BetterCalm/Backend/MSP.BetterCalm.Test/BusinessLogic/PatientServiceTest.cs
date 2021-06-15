using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MSP.BetterCalm.BusinessLogic;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.BusinessLogic.Managers;
using MSP.BetterCalm.BusinessLogic.Services;
using MSP.BetterCalm.BusinessLogicInterface;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.Test.BusinessLogic
{
    [TestClass]
    public class PatientServiceTest
    {
        private Mock<ManagerPatientRepository> _repoMock;
        private Mock<IRepository<Patient>> _patientMock;
        private PatientService _service;
        
        private Mock<ManagerPsychologistRepository> _psyRepoMock;
        private Mock<IRepository<Psychologist>> _psychologistMock;

        private Mock<IRepository<Meeting>> _meetingMock;
        private Mock<ManagerMeetingRepository> _meetingRepoMock;

        private Patient _patient;
        private List<Problematic> _problematics;
        private Psychologist _psychologist;

        [TestInitialize]
        public void TestFixtureSetup()
        {
            _repoMock = new Mock<ManagerPatientRepository>();
            _patientMock = new Mock<IRepository<Patient>>();
            _repoMock.Object.Patients = _patientMock.Object;
            
            _psyRepoMock = new Mock<ManagerPsychologistRepository>();
            _psychologistMock = new Mock<IRepository<Psychologist>>();
            _psyRepoMock.Object.Psychologists = _psychologistMock.Object;
            
            _meetingRepoMock = new Mock<ManagerMeetingRepository>();
            _meetingMock = new Mock<IRepository<Meeting>>();
            _meetingRepoMock.Object.Meetings = _meetingMock.Object;
            
            _service = new PatientService(_repoMock.Object, _psyRepoMock.Object, _meetingRepoMock.Object);
            
            _patient = new Patient()
            {
                Name = "Patient1"
            };
            _problematics = new List<Problematic>()
            {
                new Problematic() {Name = "Prob1"},
                new Problematic() {Name = "Prob2"},
                new Problematic() {Name = "Prob3"}
            };
            _psychologist = new Psychologist()
            {
                Name = "psychologist1",
                Problematics = _problematics
            };

        }

        [TestMethod]
        public void TestGetAll()
        {
            Patient patient = new Patient()
            {
                Name = "Patient1"
            };
            List<Patient> patients = new List<Patient>
            {
                patient
            };
            _patientMock.Setup(
                x => x.Get()
            ).Returns(patients);
            List<Patient> actualPatients = _service.GetPatients();
            CollectionAssert.AreEqual(patients, actualPatients);
            _patientMock.VerifyAll();
        }
                
        [TestMethod]
        public void TestGetPatientById()
        {
            Patient patient = new Patient()
            {
                Name = "patient1",
                Id = 1
            };
            _patientMock.Setup(
                x => x.Find(It.IsAny<Predicate<Patient>>())
            ).Returns(patient);
            _service.GetPatientsById(patient.Id);
            _patientMock.VerifyAll();
        }
        
        [TestMethod]
        [ExpectedException(typeof(NotFoundPatient))]
        public void TestGetPatientByIdNotFound()
        {

            _patientMock.Setup(
                x => x.Find(It.IsAny<Predicate<Patient>>())
            ).Throws(new KeyNotFoundException());
            _service.GetPatientsById(1);
        }
        
        [TestMethod]
        public void TestAddPatient()
        {
            Patient patient = new Patient()
            {
                Name = "Patient1"
            };
            _patientMock.Setup(
                x => x.Add(patient)
            );
            _service.SetPatient(patient);
            _patientMock.VerifyAll();
        }

        private List<Meeting> GetMeetingsForDays(int amountDays)
        {
            List<Meeting> meetings = new List<Meeting>();

            for (int i = 0; i < amountDays; i++)
            {
                List<Meeting> fullDayMeetings = new List<Meeting>()
                {
                    new Meeting(){DateTime = new DateTime(1993,7,19).AddDays(i)},
                    new Meeting(){DateTime = new DateTime(1993,7,19).AddDays(i)},
                    new Meeting(){DateTime = new DateTime(1993,7,19).AddDays(i)},
                    new Meeting(){DateTime = new DateTime(1993,7,19).AddDays(i)},
                    new Meeting(){DateTime = new DateTime(1993,7,19).AddDays(i)},
                };
                meetings.AddRange(fullDayMeetings);
            }

            return meetings;
        }
        
        [TestMethod]
        public void TestScheduleNewMeetingOnNextWeek()
        {
            Psychologist busyPsychologist = new Psychologist()
            {
                Name = "BusyPerson",
                Meetings = GetMeetingsForDays(1),
                Problematics = _problematics
            };
            DateTime nextDayMeeting = busyPsychologist.GetDayForNextMeetingOnWeek(DateTime.Today);
            Meeting expectedMeeting = new Meeting()
            {
                DateTime =nextDayMeeting,
                Patient = _patient,
                Psychologist = busyPsychologist
            };
            _psychologistMock.Setup(
                x => 
                    x.Get()
            ).Returns(new List<Psychologist>(){busyPsychologist});
            Meeting actualMeeting = _service.ScheduleNewMeeting(_patient, _problematics[0]);
            Assert.AreEqual(expectedMeeting, actualMeeting);
            _psychologistMock.VerifyAll();
        }
        
        [TestMethod]
        [ExpectedException(typeof(AlreadyMeetingException))]
        public void TestScheduleNewMeetingAlreadyExistsMeeting()
        {
            Psychologist busyPsychologist = new Psychologist()
            {
                Name = "BusyPerson",
                Meetings = new List<Meeting>()
                {
                    new Meeting()
                    {
                        DateTime = new DateTime(1993, 7, 15),
                        Patient = _patient
                    },
                },
                Problematics = _problematics
            };
            DateTime nextDayMeeting = busyPsychologist.GetDayForNextMeetingOnWeek(DateTime.Today);
            Meeting expectedMeeting = new Meeting()
            {
                DateTime =nextDayMeeting,
                Patient = _patient,
                Psychologist = busyPsychologist
            };
            _psychologistMock.Setup(
                x => 
                    x.Get()
            ).Returns(new List<Psychologist>(){busyPsychologist});
            _meetingMock.Setup(
                x => x.Add(expectedMeeting)
            ).Throws(new InvalidOperationException());
            _service.ScheduleNewMeeting(_patient, _problematics[0]);
        }
        
        [TestMethod]
        public void TestScheduleNewMeetingWithOlderPsychology()
        {
            Psychologist newBusyPsychologist = new Psychologist()
            {
                Name = "BusyPerson",
                Meetings = GetMeetingsForDays(1),
                CreationDate = DateTime.Today,
                Problematics = _problematics
            };
            Psychologist oldBusyPsychologist = new Psychologist()
            {
                Name = "BusyPerson",
                Meetings = GetMeetingsForDays(1),
                CreationDate = DateTime.Today.AddDays(-2),
                Problematics = _problematics
            };
            DateTime nextDayMeeting = oldBusyPsychologist.GetDayForNextMeetingOnWeek(DateTime.Today);
            Meeting expectedMeeting = new Meeting()
            {
                DateTime =nextDayMeeting,
                Patient = _patient,
                Psychologist = oldBusyPsychologist
            };
            _psychologistMock.Setup(
                x => 
                    x.Get()
            ).Returns(new List<Psychologist>(){newBusyPsychologist, oldBusyPsychologist});
            Meeting actualMeeting = _service.ScheduleNewMeeting(_patient, _problematics[0]);
            Assert.AreEqual(expectedMeeting, actualMeeting);
            _psychologistMock.VerifyAll();
        }
        
        [TestMethod]
        public void TestScheduleNewMeetingOn2NextWeeks()
        {
            Psychologist busyPsychologist = new Psychologist()
            {
                Name = "BusyPerson",
                Meetings = GetMeetingsForDays(14),
                Problematics = _problematics
            };
            DateTime nextDayMeeting = busyPsychologist.GetDayForNextMeetingOnWeek(DateTime.Today);
            Meeting expectedMeeting = new Meeting()
            {
                DateTime =nextDayMeeting,
                Patient = _patient,
                Psychologist = busyPsychologist
            };
            _psychologistMock.Setup(
                x => 
                    x.Get()
            ).Returns(new List<Psychologist>(){busyPsychologist});
            Meeting actualMeeting = _service.ScheduleNewMeeting(_patient, _problematics[0]);
            Assert.AreEqual(expectedMeeting, actualMeeting);
            _psychologistMock.VerifyAll();
        }
        
        [TestMethod]
        public void TestUpdatePatient()
        {
            Patient oldPatient = new Patient()
            {
                Id = 2,
                Name = "Patient1"
            };
            Patient newPatient = new Patient()
            {
                Id = 2,
                Name = "Patient32"
            };
            _patientMock.Setup(
                x => x.Find(It.IsAny<Predicate<Patient>>())
            ).Returns(oldPatient);
            _patientMock.Setup(
                x => x.Update(oldPatient, newPatient)
            ).Returns(newPatient);
            Patient realUpdated = _service.UpdatePatient(newPatient, oldPatient.Id);
            Assert.AreEqual(newPatient, realUpdated);
            _patientMock.VerifyAll();
        }
        

        [TestMethod]
        public void TestDeletePatient()
        {
            Patient patient = new Patient()
            {
                Name = "patient1",
                Id = 1
            };
            _patientMock.Setup(
                x => x.Delete(patient)
            );
            _patientMock.Setup(
                x => x.Find(It.IsAny<Predicate<Patient>>())
            ).Returns(patient);
            _service.DeletePatientById(patient.Id);
            _patientMock.VerifyAll();
        }
        
        [TestMethod]
        [ExpectedException(typeof(NotFoundPatient))]
        public void TestDeletePatientNotFound()
        {

            _patientMock.Setup(
                x => x.Find(It.IsAny<Predicate<Patient>>())
            ).Throws(new KeyNotFoundException());
            _service.DeletePatientById(1);
        }

    }
}