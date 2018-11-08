using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace grocery_management
{
    public partial class catagory_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.LoadCatagoryName();
                this.LoadCatagoryNameForUpdate();
            }
            this.LoadCatagory();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "INSERT INTO Catagories (name) VALUES  ('" + CatagoryTextBox.Text + "')";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();
            this.LoadCatagory();
            this.LoadCatagoryName();
            this.LoadCatagoryNameForUpdate();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "delete from Catagories where name='"+DeleteCatagoryDropDownList.SelectedItem+"'";
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            this.LoadCatagory();
            this.LoadCatagoryName();
            this.LoadCatagoryNameForUpdate();
        }
        private void LoadCatagory()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

            string sql = "SELECT * FROM Catagories";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            CatagoryGridView.DataSource = reader;
            CatagoryGridView.DataBind();
            con.Close();
        }
        private void LoadCatagoryName() {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT * FROM Catagories";

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DeleteCatagoryDropDownList.DataSource = reader;
            DeleteCatagoryDropDownList.DataTextField = "name";
            DeleteCatagoryDropDownList.DataValueField = "catagory_id";
            DeleteCatagoryDropDownList.DataBind();

            UpdateDropDownList.DataSource = reader;
            UpdateDropDownList.DataTextField = "name";
            UpdateDropDownList.DataValueField = "catagory_id";
            UpdateDropDownList.DataBind();
            con.Close();
        }

        protected void ShowCatagoriesButton_Click(object sender, EventArgs e)
        {
            this.LoadCatagory();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT * FROM Catagories WHERE name LIKE '%" + SearchCatagoryTextBox.Text + "%'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            SearchGridView.DataSource = reader;
            SearchGridView.DataBind();
            con.Close();
            
        }
        private void LoadCatagoryNameForUpdate()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT * FROM Catagories";

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            UpdateDropDownList.DataSource = reader;
            UpdateDropDownList.DataTextField = "name";
            UpdateDropDownList.DataValueField = "catagory_id";
            UpdateDropDownList.DataBind();
            con.Close();
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "update Catagories set name='"+UpdateTextBox.Text+"' where catagory_id="+UpdateDropDownList.SelectedValue;
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            SearchGridView.DataSource = reader;
            SearchGridView.DataBind();
            con.Close();
            this.LoadCatagory();
            this.LoadCatagoryNameForUpdate();
            this.LoadCatagoryName();
        }

    }
}