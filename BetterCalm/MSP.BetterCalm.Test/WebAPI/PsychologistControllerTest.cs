using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using MSP.BetterCalm.BusinessLogic;
using MSP.BetterCalm.Domain;
using MSP.BetterCalm.WebAPI.Controllers;

namespace MSP.BetterCalm.Test.WebAPI
{
    [TestClass]
    public class PsychologistControllerTest
    {
        private Mock<IPsychologistService> mockPsychologistService;
        private PsychologistController psychologistController ;
        private List<Psychologist> psychologists;
        private Psychologist psychologist;
        
        [TestInitialize]
        public void InitializeTest()
        {
            mockPsychologistService = new Mock<IPsychologistService>(MockBehavior.Strict);
            psychologistController = new PsychologistController(mockPsychologistService.Object);
            psychologists = new List<Psychologist>();
            psychologist = new Psychologist()
            {
                Name = "Psyco1"
            };
            psychologists.Add(psychologist);
        }

        [TestMethod]
        public void TestGetAllPsychologists()
        {
            mockPsychologistService.Setup(x => x.GetPsychologists()).Returns(psychologists);
            var result = psychologistController.GetAll();
            var okResult = result as OkObjectResult;
            var realPsychologists = okResult.Value;
            Assert.AreEqual(realPsychologists, psychologists);
        }
    }
}