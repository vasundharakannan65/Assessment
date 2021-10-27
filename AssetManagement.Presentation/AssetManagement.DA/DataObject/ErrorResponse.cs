using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AssetManagement.DA.DataObject
{
    public class ErrorResponse<T>
    {
        public int Status { get; set; }

        public String Message { get; set; }

        public bool Succeeded { get; set; } = true;

        public T Data { get; set; }
    }
}
