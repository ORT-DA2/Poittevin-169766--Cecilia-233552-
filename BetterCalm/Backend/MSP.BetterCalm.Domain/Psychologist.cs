using System;
using System.Collections.Generic;
using System.Linq;
using MSP.BetterCalm.BusinessLogic.Exceptions;

namespace MSP.BetterCalm.Domain
{
    public class Psychologist: User
    {
        public int PsychologistId { get; set; }
        public string Address { get; set; }
        public bool WorksOnline { get; set; }

        public Rates Rate { get; set; }

        private List<Problematic> problematics;
        public List<Problematic> Problematics{ get=>problematics; set => SetProblematics(value); }
        public List<Meeting> Meetings{ get; set; }
        public DateTime CreationDate { get; set;}

        public Psychologist()
        {
            Meetings = new List<Meeting>();
        }

        public void SetProblematics(List<Problematic> vProblematics)
        {
            if (vProblematics is null || vProblematics.Count != 3)
                throw new InvalidAmountOfProblematicsError();
            problematics = vProblematics;
        }
        protected bool Equals(Psychologist other)
        {
            bool hasSameADdress = Address == other.Address;
            bool hasSameCreationDate = CreationDate == other.CreationDate;
            bool hasSameName = Name == other.Name;
            bool hasSameLastName = LastName == other.LastName;
            bool hasSameProblematic = Problematics.OrderBy(
                x => x.Id).SequenceEqual(
                other.Problematics.OrderBy(
                    x => x.Id));
            return hasSameADdress &&
                   hasSameCreationDate &&
                   hasSameName &&
                   hasSameLastName &&
                   hasSameProblematic;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != this.GetType()) return false;
            return Equals((Psychologist) obj);
        }

        public override int GetHashCode()
        {
            return (Address != null ? Address.GetHashCode() : 0);
        }


        public DateTime GetDayForNextMeetingOnWeek(DateTime weekDay)
        {
            int daysBeforeSaturday = (int) DayOfWeek.Saturday - (int) weekDay.DayOfWeek;
            // If it's Saturday or Sunday, I start the weekday on Monday 
            if (daysBeforeSaturday == 0 || daysBeforeSaturday == 6)
            {
                weekDay = weekDay.AddDays(8 - (int) weekDay.DayOfWeek);
                daysBeforeSaturday = 5;
            }
            for (int i = 0; i < daysBeforeSaturday; i++)
            {
                weekDay = weekDay.AddDays(i == 0 ? 0 : 1);
                IEnumerable<Meeting> meetings =
                    Meetings.Where(
                        x => x.DateTime.DayOfYear == weekDay.DayOfYear && x.DateTime.Year == weekDay.Year
                    );
                if (meetings.Count() < 5)
                    return weekDay;
            }
            //At this point, the day should be a Friday, I Add 3 days to start on Monday adn then look again.
            weekDay = weekDay.AddDays(3);
            return GetDayForNextMeetingOnWeek(weekDay);
        }
    }
}