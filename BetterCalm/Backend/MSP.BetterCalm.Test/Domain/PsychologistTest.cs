using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.Test
{
    [TestClass]
    public class PsychologistTest
    {

        [TestMethod]
        public void GetSetAddress()
        {
            Psychologist psychologist = new Psychologist
            {
                Address = "House 1234"
            };
            Assert.AreEqual("House 1234", psychologist.Address);
        }
        
        [TestMethod]
        public void GetSetName()
        {
            Psychologist psychologist = new Psychologist
            {
                Name = "Pedro"
            };
            Assert.AreEqual("Pedro", psychologist.Name);
        }
        
        [TestMethod]
        public void GetSetRate()
        {
            Psychologist psychologist = new Psychologist
            {
                Rate = Rates.Deluex
            };
            Assert.AreEqual(Rates.Deluex, psychologist.Rate);
        }
        
        [TestMethod]
        public void GetSetLastName()
        {
            Psychologist psychologist = new Psychologist
            {
                LastName = "Rodriguez"
            };
            Assert.AreEqual("Rodriguez", psychologist.LastName);
        }
        
        [TestMethod]
        public void GetSetCreationTime()
        {
            Psychologist psychologist = new Psychologist
            {
                CreationDate = new DateTime(1990,1,1)
            };
            Assert.AreEqual(new DateTime(1990,1,1), psychologist.CreationDate);
        }
        
        [TestMethod]
        public void GetSetWorksOnline()
        {
            Psychologist psychologist = new Psychologist
            {
                WorksOnline = true
            };
            Assert.IsTrue(psychologist.WorksOnline);
        }
        
        [TestMethod]
        public void GetSetProblematics()
        {
            List<Problematic> problematics = new List<Problematic>()
            {
                new Problematic(){Name= "Test1"},
                new Problematic(){Name= "Test2"},
                new Problematic(){Name= "Test3"}
            };
            Psychologist psychologist = new Psychologist()
            {
                Problematics = problematics
            };
            CollectionAssert.AreEqual(psychologist.Problematics, problematics);
        }
        
        [TestMethod]
        [ExpectedException(typeof(InvalidAmountOfProblematicsError), "")]
        public void GetSetInvalidAmountProblematics()
        {
            List<Problematic> problematics = new List<Problematic>()
            {
                new Problematic(){Name= "Test1"},
                new Problematic(){Name= "Test2"},
                new Problematic(){Name= "Test3"},
                new Problematic(){Name= "Test4"}
            };
            Psychologist psychologist = new Psychologist()
            {
                Problematics = problematics
            };
            CollectionAssert.AreEqual(psychologist.Problematics, problematics);
        }
        
        [TestMethod]
        public void GetSetMeetings()
        {
            List<Meeting> meetings = new List<Meeting>()
            {
                new Meeting(){Patient = new Patient(){Name = "Patient1"}},
                new Meeting(){Patient = new Patient(){Name = "Patient2"}}
            };
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            CollectionAssert.AreEqual(psychologist.Meetings, meetings);
        }

        [TestMethod]
        public void NextMeetingDayOnWeekWithTimeOnWednesday()
        {
            
            List<Meeting> meetings = new List<Meeting>()
            {
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)}
            };
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            DateTime wednesdayDateTime = new DateTime(1993, 7, 14);
            DateTime? nextMeetingDayOnWeek = psychologist.GetDayForNextMeetingOnWeek(new DateTime(1993, 7, 14));
            Assert.AreEqual(nextMeetingDayOnWeek, wednesdayDateTime);
        }
        
        [TestMethod]
        public void NextMeetingDayOnWeekWithTimeOnThursday()
        {
            
            List<Meeting> meetings = new List<Meeting>()
            {
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)}
            };
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            DateTime wendsDayDateTime = new DateTime(1993, 7, 15);
            DateTime? nextMeetingDayOnWeek = psychologist.GetDayForNextMeetingOnWeek(new DateTime(1993, 7, 15));
            Assert.AreEqual(nextMeetingDayOnWeek, wendsDayDateTime);
        }
        
        [TestMethod]
        public void NextMeetingDayOnWeekWithTimeOnFriday()
        {
            
            List<Meeting> meetings = new List<Meeting>()
            {
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)},
                new Meeting(){DateTime = new DateTime(1993,7,15)},
            };
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            DateTime wendsDayDateTime = new DateTime(1993, 7, 16);
            DateTime? nextMeetingDayOnWeek = psychologist.GetDayForNextMeetingOnWeek(new DateTime(1993, 7, 15));
            Assert.AreEqual(nextMeetingDayOnWeek, wendsDayDateTime);
        }
        
        [TestMethod]
        public void NextMeetingDayOnWeekWithoutFreeTime()
        {
            List<Meeting> meetings = new List<Meeting>()
            {
                new Meeting(){DateTime = new DateTime(1993,7,16)},
                new Meeting(){DateTime = new DateTime(1993,7,16)},
                new Meeting(){DateTime = new DateTime(1993,7,16)},
                new Meeting(){DateTime = new DateTime(1993,7,16)},
                new Meeting(){DateTime = new DateTime(1993,7,16)},
            };
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            DateTime nextMeetingDayOnWeek = psychologist.GetDayForNextMeetingOnWeek(
                new DateTime(1993, 7, 16));

            DateTime expectedMeetingDayOnWeek = new DateTime(1993,7,19);
            Assert.AreEqual(expectedMeetingDayOnWeek, nextMeetingDayOnWeek);
        }
        
        [TestMethod]
        public void NextMeetingDayOnWeekWithoutFreeOn2Weeks()
        {
            List<Meeting> meetings = new List<Meeting>();

            for (int i = 0; i < 14; i++)
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
            
            Psychologist psychologist = new Psychologist()
            {
                Meetings = meetings
            };
            DateTime nextMeetingDayOnWeek = psychologist.GetDayForNextMeetingOnWeek(
                new DateTime(1993, 7, 19));

            DateTime expectedMeetingDayOnWeek = new DateTime(1993,8,2);
            Assert.AreEqual(expectedMeetingDayOnWeek, nextMeetingDayOnWeek);
        }

        [TestMethod]
        public void HashCodeAddressTest()
        {
            Psychologist psychologist = new Psychologist
            {
                Address = "House 1234"
            };
            Assert.AreEqual(psychologist.GetHashCode(), psychologist.GetHashCode());
        }
        
        [TestMethod]
        public void HashCodeTest()
        {
            Psychologist psychologist = new Psychologist { };
            Assert.AreEqual(0, psychologist.GetHashCode());
        }

        [TestMethod]
        public void EqualsNull()
        {
            Psychologist psychologist = new Psychologist
            {
                Address = "House 1234"
            };
            Assert.IsFalse( psychologist.Equals(null));
        }
        
        [TestMethod]
        public void EqualsDiffType()
        {
            Psychologist psychologist = new Psychologist
            {
                Address = "House 1234"
            };
            Assert.IsFalse( psychologist.Equals(new Content()));
        }
        
        [TestMethod]
        public void EqualsTest()
        {
            Psychologist psychologist = new Psychologist
            {
                Address = "House 1234"
            };
            Assert.IsTrue( psychologist.Equals(psychologist));
        }
    }
}