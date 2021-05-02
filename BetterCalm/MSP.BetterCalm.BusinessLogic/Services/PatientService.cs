using System;
using System.Collections.Generic;
using System.Linq;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.BusinessLogic
{
    public class PatientService : IPatientService
    {
        private ManagerPatientRepository patientRepository;
        private ManagerPsychologistRepository psychologistRepository;
        private ManagerMeetingRepository meetingRepository;

        public PatientService(
            ManagerPatientRepository vRepository, 
            ManagerPsychologistRepository vPsyRepo,
            ManagerMeetingRepository vMeetingRepo
            )
        {
            patientRepository = vRepository;
            psychologistRepository = vPsyRepo;
            meetingRepository = vMeetingRepo;
        }

        public List<Patient> GetPatients()
        {
            return patientRepository.Patients.Get();
        }

        public void SetPatient(Patient patient)
        {
            patientRepository.Patients.Add(patient);
        }

        public Meeting ScheduleNewMeeting(Patient patient, Problematic problematic)
        {
            try
            {
                List<Psychologist> psychologists = psychologistRepository.Psychologists.Get();
                if (psychologists is null)
                    throw new NotFoundPsychologist();
                psychologists = psychologists.FindAll(x => 
                    x.Problematics != null && 
                    x.Problematics.Contains(problematic));
                psychologists = psychologists.OrderBy(
                    x => x.GetDayForNextMeetingOnWeek(DateTime.Today)).ToList();

                if(psychologists.Count == 0)
                    throw new NotFoundPsychologist();
                if (psychologists.Count > 1)
                    psychologists = psychologists.OrderBy(x => x.CreationDate).ToList();
                Psychologist psychologist = psychologists.First();
                
                DateTime auxDate = psychologist.GetDayForNextMeetingOnWeek(DateTime.Now);
                DateTime date = new DateTime(auxDate.Year, auxDate.Month, auxDate.Day, 0, 0, 0);

                string address;
                if (psychologist.WorksOnline)
                    address = $"https://bettercalm.com.uy/{psychologist.PsychologistId}_{patient.PatientId}/{Guid.NewGuid().ToString()}";
                else
                    address = psychologist.Address;
                

                Meeting meeting = new Meeting()
                {
                    Address = address,
                    DateTime = date,
                    Patient = patient,
                    Psychologist = psychologist
                };
                meetingRepository.Meetings.Add(meeting);
                return meeting;
            }
            catch (KeyNotFoundException)
            {
                throw new NotFoundPsychologist();
            }
        }
    }
}