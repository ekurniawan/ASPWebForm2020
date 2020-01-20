using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleServerControl
{
    public partial class CommandEvent : System.Web.UI.Page
    {
        private List<string> objBarang;
        protected void Page_Load(object sender, EventArgs e)
        {
            objBarang = new List<string> {
                "Coklat","Bunga","Ice Cream"
            };
        }

        protected void Cek_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Sort")
            {
                switch (e.CommandArgument.ToString())
                {
                    case "Asc":
                        objBarang.Sort(SortAsc);
                        break;
                    case "Desc":
                        objBarang.Sort(SortDesc);
                        break;
                }
            }
        }

        protected void Page_PreRender()
        {
            bltBarang.DataSource = objBarang;
            bltBarang.DataBind();
        }

        protected int SortAsc(string x, string y)
        {
            return string.Compare(x, y);
        }

        protected int SortDesc(string x, string y)
        {
            return string.Compare(x, y) * -1;
        }
    }
}