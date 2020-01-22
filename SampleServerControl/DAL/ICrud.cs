using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SampleServerControl.DAL
{
    public interface ICrud<T>
    {
        IEnumerable<T> GetAll();
        T GetByID(string id);
        void Insert(T obj);
        void Update(T obj);
        void Delete(string id);
    }
}