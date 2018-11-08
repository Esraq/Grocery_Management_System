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
    public partial class product_view : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                this.LoadCatagoryName();
                }
            
            this.LoadProducts();
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            double price = Convert.ToDouble(ProductPriceTextBox.Text);
            int quantity = Convert.ToInt32(ProductQuantityTextBox.Text);
            int catId = Convert.ToInt32(DropDownList1.SelectedItem.Value);
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "INSERT INTO Products (name, price, quantity, catagory_id) VALUES ('" + ProductNameTextBox.Text + "'," + price + " , " + quantity + ", " + catId + ")";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            int r = cmd.ExecuteNonQuery();
            con.Close();
            this.LoadProducts();
        }
        private void LoadProducts() { 
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT Products.name as 'Product Name', price, quantity, Catagories.name as 'Catagory' FROM Products, Catagories where Products.catagory_id=Catagories.catagory_id";
            //string sql = "select * from Products, Catagories where Products.catagory_id=Catagories.catagory_id";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ProductsGridView.DataSource = reader;
            ProductsGridView.DataBind();
            con.Close();
        }

        private void LoadCatagoryName()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT * FROM Catagories";

            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            DropDownList1.DataSource = reader;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "catagory_id";
            DropDownList1.DataBind();
            con.Close();
            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "delete from Products where name='" + DeleteTextBox.Text + "'";
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            int r=cmd.ExecuteNonQuery();
            con.Close();
            this.LoadProducts();
            this.LoadCatagoryName();
            if (r > 0)
            {
                this.Label1.Text = "Deleted Successfully";
            }
            else {
                this.Label1.Text = "Product of this name not found";
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql ="SELECT Products.name as 'Product Name', price, quantity, Catagories.name as 'Catagory' FROM Products, Catagories where Products.catagory_id=Catagories.catagory_id and Products.name LIKE '%" + SearchTextBox.Text + "%'";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            SearchGridView.DataSource = reader;
            SearchGridView.DataBind();
            con.Close();
        }

        protected void SpecialFunctionButton_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            string sql = "SELECT Products.name as 'Product Name', price, quantity, Catagories.name as 'Catagory' FROM Products, Catagories where Products.catagory_id=Catagories.catagory_id and quantity < 11";
            SqlConnection con = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            ProductsGridView.DataSource = reader;
            ProductsGridView.DataBind();
            con.Close();
        }
    }
}