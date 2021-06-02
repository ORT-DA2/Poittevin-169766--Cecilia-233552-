﻿using System.Collections.Generic;
using MSP.BetterCalm.Domain;

namespace MSP.BetterCalm.BusinessLogic.Services
{
    public interface ICategoryService
    {
        public List<Category> GetCategories();

        public Category GetCategoryByName(string name);

        public Category GetCategoryById(int id);
    }
}