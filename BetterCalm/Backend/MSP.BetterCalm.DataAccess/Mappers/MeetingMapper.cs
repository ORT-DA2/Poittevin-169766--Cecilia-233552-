using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using MSP.BetterCalm.DataAccess.DtoObjects;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.DataAccess.Mappers
{
    public class MeetingMapper: IMapper<Meeting, MeetingDto>
    {
        public MeetingDto DomainToDto(Meeting obj, ContextDb context)
        {
            PatientMapper patientMapper = new PatientMapper();
            PsychologistMapper psychologistMapper = new PsychologistMapper();
           
            PatientDto patientDto = context.Patients.Find(obj.Patient.Id);
            if (patientDto is null)
                patientDto = patientMapper.DomainToDto(obj.Patient, context);
            else
                context.Entry(patientDto).State = EntityState.Modified;
            PsychologistDto psychologistDto = context.Psychologists.Find(obj.Psychologist.PsychologistId);
            if (psychologistDto is null)
                psychologistDto = psychologistMapper.DomainToDto(obj.Psychologist, context);
            else
                context.Entry(psychologistDto).State = EntityState.Modified;
            
            return new MeetingDto()
            {
                DateTime = obj.DateTime,
                Patient = patientDto,
                Psychologist = psychologistDto,
                Cost = obj.Cost,
                Address = obj.Address,
                Duration = obj.Duration
            };
        }

        private Patient DtoToDomainPatientWithoutMeetings(PatientDto patientDto)
        {
            if (!(patientDto is null)){
                return new Patient()
                {
                    Name = patientDto.Name,
                    LastName = patientDto.LastName,
                    BirthDay = patientDto.BirthDay,
                    Cellphone = patientDto.Cellphone,
                    Id = patientDto.PatientDtoId
                };
            }
            return null;
        }
        
        private Psychologist DtoToDomainpPsychologistWithoutMeetings(PsychologistDto psyDto)
        {
            if(!(psyDto is null)){
                List<Problematic> problematics = new List<Problematic>();
                if (!(psyDto.Problematics is null))
                {
                    foreach (PsychologistProblematicDto psychologistProblematicDto in psyDto.Problematics)
                    {
                        problematics.Add(new Problematic()
                        {
                            Id = psychologistProblematicDto.Problematic.ProblematicDtoId,
                            Name = psychologistProblematicDto.Problematic.Name
                        });
                    }
                }
                return new Psychologist()
                {
                    Name = psyDto.Name,
                    LastName = psyDto.LastName,
                    PsychologistId = psyDto.PsychologistDtoId,
                    Address = psyDto.Address,
                    Problematics = problematics,
                    CreationDate = psyDto.CreationDate,
                };
            }
            return null;
        }

        public Meeting DtoToDomain(MeetingDto obj, ContextDb context)
        {
            context.Entry(obj).Reference("Patient").Load();
            context.Entry(obj).Reference("Psychologist").Load();
            return new Meeting()
            {
                DateTime = obj.DateTime,
                Address = obj.Address,
                Cost = obj.Cost,
                Duration = obj.Duration,
                Patient = DtoToDomainPatientWithoutMeetings(obj.Patient),
                Psychologist = DtoToDomainpPsychologistWithoutMeetings(obj.Psychologist)
            };
        }

        public Meeting GetById(ContextDb context, int id)
        {
            throw new System.NotImplementedException();
        }

        public MeetingDto UpdateDtoObject(MeetingDto objToUpdate, Meeting updatedObject, ContextDb context)
        {
            objToUpdate.Address = updatedObject.Address;
            objToUpdate.Cost = updatedObject.Cost;
            objToUpdate.Duration = updatedObject.Duration;
            return objToUpdate;
        }
    }
}