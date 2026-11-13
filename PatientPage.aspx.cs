using System;
using System.Data;
using System.Data.SQLite;
using web_cl2vf.Models;

namespace web_cl2vf
{
    public partial class PatientPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Patient")
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                LoadPersonalData();
                LoadMedicalRecords();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void LoadPersonalData()
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT * FROM Users WHERE Id = @id";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);
            cmd.Parameters.AddWithValue("@id", Session["UserId"].ToString());

            SQLiteDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                int id = Convert.ToInt32(reader["Id"]);
                string username = reader["Username"].ToString();
                string password = reader["Password"].ToString();
                string role = reader["Role"].ToString();
                string name = reader["Name"].ToString();

                User patient = new User(id, username, password, role, name);

                lblWelcome.Text = patient.Name;
                lblName.Text = patient.Name;
                lblIdNumber.Text = reader["IDNumber"].ToString();
                lblDob.Text = reader["DOB"].ToString();
                lblAddress.Text = reader["Address"].ToString();
                lblMobile.Text = reader["Mobile"].ToString();
            }
            reader.Close();

            string docQuery = "SELECT Users.Name FROM Users INNER JOIN MedicalSessions ON Users.Id = MedicalSessions.DoctorId WHERE MedicalSessions.PatientId = @id LIMIT 1";
            SQLiteCommand docCmd = new SQLiteCommand(docQuery, conn);
            docCmd.Parameters.AddWithValue("@id", Session["UserId"].ToString());
            
            object docResult = docCmd.ExecuteScalar();
            if (docResult != null)
            {
                lblDoctor.Text = docResult.ToString();
            }
            else
            {
                lblDoctor.Text = "No doctor assigned yet";
            }

            conn.Close();
        }

        protected void LoadMedicalRecords()
        {
            string connectionString = @"Data Source=|DataDirectory|\Drhousebbdd.db;Version=3;";
            SQLiteConnection conn = new SQLiteConnection(connectionString);
            conn.Open();

            string query = "SELECT m.AppointmentDate, u.Name AS DoctorName, m.Diagnosis, m.Treatment FROM MedicalSessions m INNER JOIN Users u ON m.DoctorId = u.Id WHERE m.PatientId = @patientId";
            SQLiteCommand cmd = new SQLiteCommand(query, conn);
            cmd.Parameters.AddWithValue("@patientId", Session["UserId"].ToString());

            SQLiteDataAdapter adapter = new SQLiteDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            gvMedicalRecords.DataSource = dt;
            gvMedicalRecords.DataBind();

            conn.Close();
        }
    }
}