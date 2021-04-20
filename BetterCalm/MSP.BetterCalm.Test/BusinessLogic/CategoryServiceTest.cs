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
    public class CategoryServiceTest
    {
        private Mock<ManagerCategoryRepository> repoMock;
        private Mock<IRepository<Category>> categoriesMock;
        private CategoryService _service;

        [TestInitialize]
        public void TestFixtureSetup()
        {
            repoMock = new Mock<ManagerCategoryRepository>();
            categoriesMock = new Mock<IRepository<Category>>();
            repoMock.Object.Categories = categoriesMock.Object;
            _service = new CategoryService(repoMock.Object);
        }
        
        
        [TestMethod]
        public void FindCategoryByName()
        {
            Category category1 = new Category { Name = "Yoga"};
            categoriesMock.Setup(
                x => x.Find(It.IsAny<Predicate<Category>>())
            ).Returns(category1);
            Category category3 = _service.GetCategoryByName("Yoga");
            Assert.AreEqual(category1, category3);
        }

        [TestMethod]
        [ExpectedException(typeof(ValueNotFound), "")]
        public void FindCategoryByNameNull()
        {
            categoriesMock.Setup(
                x => x.Find(It.IsAny<Predicate<Category>>())
            ).Throws( new ValueNotFound());
            _service.GetCategoryByName("Musica");
        }

        [TestMethod]
        public void GetCategories()
        {
            Category category = new Category { Name = "dormir" };
            List<Category> categories = new List<Category>
            {
                category
            };
            categoriesMock.Setup(
                x => x.Get()
            ).Returns(categories);
            List<Category> categories2 = _service.GetCategories();
            CollectionAssert.AreEqual(categories, categories2);
        }


    }
}