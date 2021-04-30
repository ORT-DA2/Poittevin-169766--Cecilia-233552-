﻿using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MSP.BetterCalm.BusinessLogic;
using MSP.BetterCalm.BusinessLogic.Exceptions;
using MSP.BetterCalm.DataAccess;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.Test
{
    [TestClass]
    public class AudioServiceTest
    {
        private Mock<ManagerAudioRepository> repoMock;
        private Mock<IRepository<Audio>> AudiosMock;
        private AudioService _audioService;
        private ContextDB context = new ContextDB();

        [TestInitialize]
        public void TestFixtureSetup()
        {
            repoMock = new Mock<ManagerAudioRepository>();
            AudiosMock = new Mock<IRepository<Audio>>();
            repoMock.Object.Audios =  AudiosMock.Object;
            _audioService = new AudioService(repoMock.Object);
        }

        [TestMethod]
        public void FindAudioByName()
        {
            Audio Audio1 = new Audio() {Name = "Stand by me"};
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Returns(Audio1);
            List<Audio> Audios = new List<Audio>() {Audio1};
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            List<Audio> Audios3 = _audioService.GetAudiosByName("Stand by me");
            CollectionAssert.AreEqual(Audios, Audios3);
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioByName()
        {
            Audio Audio1 = new Audio() {Name = "Stand by me"};
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Returns(Audio1);
            List<Audio> Audios = new List<Audio>() {Audio1};
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            _audioService.GetAudiosByName("LetITBE");
        }
        
        [TestMethod]
        public void FindAudioByAuthor()
        {
            Audio Audio1 = new Audio() {Name = "Stand by me", AuthorName = "John Lennon"};
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Returns(Audio1);
            List<Audio> Audios = new List<Audio>() {Audio1};
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            List<Audio> Audios3 = _audioService.GetAudiosByAuthor("John Lennon");
            CollectionAssert.AreEqual(Audios, Audios3);
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioByAuthor()
        {
            Audio Audio1 = new Audio() {Name = "Stand by me", AuthorName = "John Lennon"};
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Returns(Audio1);
            List<Audio> Audios = new List<Audio>() {Audio1};
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
           _audioService.GetAudiosByAuthor("Ringo Starr");
        }

        [TestMethod]
        public void FindAudioByAuthorAndName()
        {
            Audio Audio1 = new Audio() {Name = "Stand by me", AuthorName = "John Lennon"};
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Returns(Audio1);
            Audio Audio3 = _audioService.GetAudioByNameAndAuthor("Stand by me","John Lennon");
            Assert.AreEqual(Audio1, Audio3);
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioByAuthorAndName()
        {
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Throws(new KeyNotFoundException());
            _audioService.GetAudioByNameAndAuthor("Stand by me","Ringo Starr");
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioDiffAuthor()
        {
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Throws(new KeyNotFoundException());
            _audioService.GetAudioByNameAndAuthor("Let it be","John Lennon");
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioDiffName()
        {
            AudiosMock.Setup(x => x.Find(It.IsAny<Predicate<Audio>>())).Throws(new KeyNotFoundException());
            _audioService.GetAudioByNameAndAuthor("Stand by me","Ringo Starr");
        }
        
        [TestMethod]
        public void GetAudios()
        {
            Category category = new Category()
            {
                Name = "Dormir"
            };
            Audio audio = new Audio()
            {
                Categories = new List<Category>()
                {
                    category
                },
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            List<Audio> Audios1 = new List<Audio> {audio};
            AudiosMock.Setup(x => x.Get()).Returns(Audios1);
            List<Audio> Audios2 = _audioService.GetAudios();
            CollectionAssert.AreEqual(Audios1, Audios2);
        }

        [TestMethod]
        [ExpectedException(typeof(AlreadyExistThisAudio), "")]
        public void SetAudios()
        {    
            Audio audio = new Audio()
            {
                Id=4,
                Name = "Let it be",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.FindById(3)).Throws(new AlreadyExistThisAudio());
            _audioService.AddAudio(audio);
        }

        [TestMethod]
        [ExpectedException(typeof(InvalidNameLength), "")]
        public void SetAudiosInvalidName()
        {
            Audio audio = new Audio() {Name = ""};
            List<Audio> Audios1 = new List<Audio> {audio};
            AudiosMock.Setup(x => x.Set(Audios1));
        }

        [TestMethod]
        [ExpectedException(typeof(AlreadyExistThisAudio), "")]
        public void SetAudioRepeted()
        {    
            Audio audio = new Audio() {Name = "Let it be"};
            List<Audio> Audios1 = new List<Audio> {audio};
            AudiosMock.Setup(x => x.Set(Audios1));
            _audioService.AddAudio(audio);
            _audioService.AddAudio(audio);
        }

       
        [TestMethod]
        public void FindAudioByCategoryName()
        {
            Category category = new Category() {Name = "Dormir"};
            Audio Audio1 = new Audio()
            {
                Categories = new List<Category>()
                {
                    category
                },
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            List<Audio> Audios = new List<Audio>() {Audio1, Audio1, Audio1, Audio1};
            AudiosMock.Setup(x => x.Set(Audios));
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            List<Audio> Audio3 = _audioService.GetAudiosByCategoryName("Dormir");
            CollectionAssert.AreEqual(Audios, Audio3);
        }
        
        [TestMethod]
        [ExpectedException(typeof(KeyNotFoundException), "")]
        public void NoFindAudioByCategoryName()
        {
            Audio Audio1 = new Audio()
            {
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me"
            };
            List<Audio> Audios = new List<Audio>() {Audio1, Audio1, Audio1, Audio1};
            AudiosMock.Setup(x => x.Set(Audios));
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            _audioService.GetAudiosByCategoryName("Musica");
        }
        
      [TestMethod]
        public void DeleteAudio()
        {
            Audio Audio1 = new Audio()
            {
                Id = 1,
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            Audio Audio2 = new Audio()
            {
                Id = 1,
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Let it be",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            List<Audio> Audios = new List<Audio>(){Audio1,Audio2};
            AudiosMock.Setup(x => x.Delete(Audio1));
            AudiosMock.Setup(x => x.Get()).Returns(Audios);
            AudiosMock.Setup(x => x.Set(Audios));
            _audioService.DeleteAudio(Audio1.Id);
            List<Audio> AudioPostDelete = _audioService.GetAudios();
            CollectionAssert.AreEqual(AudioPostDelete, Audios);
        }

        [TestMethod]
        [ExpectedException(typeof(AlreadyExistThisAudio), "")]
        public void NoSetAudio()
        {
            Audio Audio1 = new Audio()
            {
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.Add(Audio1)).Throws(new AlreadyExistThisAudio());
            _audioService.AddAudio(Audio1);
        }
        
        [TestMethod]
        [ExpectedException(typeof(InvalidNameLength), "")]
        public void NoSetAudioInvalidName()
        {
            Audio Audio1 = new Audio()
            {
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.Add(Audio1)).Throws(new InvalidNameLength());
            _audioService.AddAudio(Audio1);
        }
        
        [TestMethod]
        [ExpectedException(typeof(ObjectWasNotDeleted), "")]
        public void NoDeleteAudio()
        {
            Audio Audio1 = new Audio()
            {
                Id=3,
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.FindById(Audio1.Id)).Throws(new ObjectWasNotDeleted());
            _audioService.DeleteAudio(Audio1.Id);
        }

        [TestMethod]
        public void UpdateAudioTest()
        {  
            Audio audio = new Audio()
            {
                Id=2,
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            List<Audio> Audios1 = new List<Audio> {audio};
            AudiosMock.Setup(x => x.Update(audio,audio));
            AudiosMock.Setup(x => x.Get()).Returns(Audios1);
            _audioService.UpdateAudioById(2,audio);
            List<Audio> Audios2 = _audioService.GetAudios();
            CollectionAssert.AreEqual(Audios1, Audios2);
        }
        
        [TestMethod]
        [ExpectedException(typeof(ObjectWasNotUpdated), "")]
        public void NoUpdateAudioTest()
        {  
            Audio audio = new Audio()
            {
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Let it be",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.FindById(7)).Throws(new ObjectWasNotUpdated());
            _audioService.UpdateAudioById(7,audio);
        }
        
        [TestMethod]
        public void GetAudioByIDTest()
        {  
            Audio audio = new Audio()
            {
                Id=2,
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Stand by me",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            List<Audio> Audios1 = new List<Audio> {audio};
            AudiosMock.Setup(x => x.FindById(2)).Returns(audio);
            AudiosMock.Setup(x => x.Get()).Returns(Audios1);
            _audioService.GetAudioById(2);
            List<Audio> Audios2 = _audioService.GetAudios();
            CollectionAssert.AreEqual(Audios1, Audios2);
        }
        
        [TestMethod]
        [ExpectedException(typeof(NotFoundId), "")]
        public void NoGetAudioByIDTest()
        {   
            Audio audio = new Audio()
            {
                Categories = new List<Category>() {new Category() {Name = "Dormir"}},
                Name = "Let it e",
                AuthorName = "John Lennon",
                Duration = 12,
                UrlAudio = "",
                UrlImage = ""
            };
            AudiosMock.Setup(x => x.FindById(3)).Throws(new NotFoundId());
            _audioService.GetAudioById(3);
        }
    }
}