using System;
using System.Collections.Generic;
using System.Linq;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.BusinessLogic.Managers;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.BusinessLogic.Services
{
    public class PatientService : IPatientService
    {
        private ManagerPatientRepository patientRepository;
        private ManagerProblematicRepository problematicRepository;
        private ManagerPsychologistRepository psychologistRepository;
        private ManagerMeetingRepository meetingRepository;
        private ManagerVoucherRepository voucherRepository;
        public PatientService(
            ManagerPatientRepository vRepository, 
            ManagerPsychologistRepository vPsyRepo,
            ManagerMeetingRepository vMeetingRepo,
            ManagerVoucherRepository vVoucherRepo
        )
        {
            patientRepository = vRepository;
            psychologistRepository = vPsyRepo;
            meetingRepository = vMeetingRepo;
            voucherRepository = vVoucherRepo;
        }

        public List<Patient> GetPatients()
        {
            return patientRepository.Patients.Get();
        }
        
        public Patient GetPatientsById(int patientId)
        {
            try
            {

                return patientRepository.Patients.Find(x => x.Id == patientId);
            }
            catch (KeyNotFoundException)
            {
                throw new NotFoundPatient();
            }
        }


        public Patient SetPatient(Patient patient)
        {
            return patientRepository.Patients.Add(patient);
        }

        private void CreateOrUpdateVoucher(Patient patient)
        {
            try
            {
                Voucher voucher = voucherRepository.Vouchers.Find(
                    x => (x.Status == Status.NotReady ||
                          x.Status == Status.Pending)  &&
                         x.Patient.Id == patient.Id
                );
                voucher.MeetingsAmount += 1;
                voucherRepository.Vouchers.Update(voucher, voucher);
            }
            catch (KeyNotFoundException)
            {
                voucherRepository.Vouchers.Add(
                    new Voucher()
                    {
                        Patient = patient
                    }
                );
            }
        }

        public Meeting ScheduleNewMeeting(Patient patient, Problematic problematic, double duration)
        {
            if (patient.Id != 0)
            {
                patient = patientRepository.Patients.Find(x => x.Id == patient.Id);
            }
            try
            {
                List<Psychologist> psychologists = psychologistRepository.Psychologists.Get();
                if (psychologists is null)
                    throw new NotFoundPsychologist();
                psychologists = psychologists.FindAll(x => 
                    x.Problematics != null && 
                    x.Problematics.Exists(x=> x.IsSameProblematicName(problematic.Name) || 
                                              x.Id == problematic.Id));
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
                address = CreateAddress(patient, psychologist);
                
                Meeting meeting = new Meeting()
                {
                    Address = address,
                    DateTime = date,
                    Patient = patient,
                    Psychologist = psychologist,
                    Duration = duration
                };
                meetingRepository.Meetings.Add(meeting);
                CreateOrUpdateVoucher(patient);
                return meeting;
            }
            catch (InvalidOperationException)
            {
                throw new AlreadyMeetingException();
            }
            catch (KeyNotFoundException)
            {
                throw new NotFoundPsychologist();
            }
        }

        private static string CreateAddress(Patient patient, Psychologist psychologist)
        {
            string address;
            if (psychologist.WorksOnline)
                address = $"https://bettercalm.com.uy/{psychologist.PsychologistId}_{patient.Id}/{Guid.NewGuid().ToString()}";
            else
                address = psychologist.Address;
            return address;
        }

        public void DeletePatientById(int patientId)
        {
            
            Patient patient = GetPatientsById(patientId);
            patientRepository.Patients.Delete(patient);

        }

        public Patient UpdatePatient(Patient newPatient, int patientId)
        {
            Patient oldPatient = GetPatientsById(patientId);
            return patientRepository.Patients.Update(oldPatient, newPatient);
        }
    }
}