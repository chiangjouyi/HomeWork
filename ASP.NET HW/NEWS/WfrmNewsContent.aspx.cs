using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASP.NET_HW.NEWS
{
    public partial class WfrmNewsContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["nid"];
            
            SqlDataSource sds = new SqlDataSource();
            sds.ConnectionString = @"Data Source=.;Initial Catalog=dbASP.NET HW;Integrated Security=True";
            sds.SelectCommand = "SELECT * FROM tNews WHERE nID=@Key ";
            sds.SelectParameters.Add("Key", id);
            DataView dv = sds.Select(DataSourceSelectArguments.Empty) as DataView;         
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            string id = Request.QueryString["nid"];
            e.Values["mDate"] = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            e.Values["mNewsID"] = id;
        }
    }
}