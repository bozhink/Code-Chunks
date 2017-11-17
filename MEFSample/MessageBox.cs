using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.Composition;

namespace MEFSample
{
    public class MessageBox
    {
        [Export]
        public string MyMessage
        {
            get
            {
                return DateTime.Now.ToString("yyyyMMddhhmmssfff");
            }
        }
    }
}
