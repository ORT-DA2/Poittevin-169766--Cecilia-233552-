﻿

using System;
using System.Collections.Generic;

namespace MSP.BetterCalm.BusinessLogic
{
    public interface IRepository<T>
    {
        void Add(T objectToAdd);

        void Delete(T objectToDelete);

        T Find(Predicate<T> condition);

        List<T> Get();

        void Set(List<T> objectToAdd);

        T Update(T OldObject, T UpdatedObject);
    }
}