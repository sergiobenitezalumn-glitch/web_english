using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SQLite;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_cl2vf
{
    public partial class DoctorPage : System.Web.UI.Page
    {
        private const string ConnStr = @"Data Source=|DataDirectory|\DrHouseBBDD.db;Version=3;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserRole"] == null || Session["UserRole"].ToString() != "Doctor")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadPatientsDropDown();
                LoadMedicalRecords();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void LoadPatientsDropDown()
        {
            string query = "SELECT Id, Name FROM Users WHERE Role = 'Patient' ORDER BY Name";

            using (SQLiteConnection conn = new SQLiteConnection(ConnStr))
            using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
            {
                DataTable dt = new DataTable();
                new SQLiteDataAdapter(cmd).Fill(dt);

                ddlPatient.DataSource = dt;
                ddlPatient.DataTextField = "Name";
                ddlPatient.DataValueField = "Id";
                ddlPatient.DataBind();

                ddlPatient.Items.Insert(0, new ListItem("-- Seleccione paciente --", ""));
            }
        }

        protected void LoadMedicalRecords()
        {
            int doctorId = Convert.ToInt32(Session["UserId"]);

            string query = @"SELECT ms.SessionId,
                                    u.Name AS PatientName,
                                    strftime('%d/%m/%Y', ms.AppointmentDate) AS AppointmentDate,
                                    ms.Diagnosis,
                                    ms.Treatment
                             FROM MedicalSessions ms
                             INNER JOIN Users u ON u.Id = ms.PatientId
                             WHERE ms.DoctorId = @doctorId
                             ORDER BY ms.AppointmentDate DESC";

            using (SQLiteConnection conn = new SQLiteConnection(ConnStr))
            using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@doctorId", doctorId);

                DataTable dt = new DataTable();
                new SQLiteDataAdapter(cmd).Fill(dt);

                gvMedicalRecords.DataSource = dt;
                gvMedicalRecords.DataBind();
            }
        }

        protected void btnSaveRecord_Click(object sender, EventArgs e)
        {
            if (ddlPatient.SelectedValue == "" || txtAppointmentDate.Text == "")
            {
                return;
            }

            int doctorId = Convert.ToInt32(Session["UserId"]);
            int patientId = Convert.ToInt32(ddlPatient.SelectedValue);

            string query = @"INSERT INTO MedicalSessions
                                (DoctorId, PatientId, AppointmentDate, Diagnosis, Treatment)
                             VALUES
                                (@doctorId, @patientId, @date, @diagnosis, @treatment)";

            using (SQLiteConnection conn = new SQLiteConnection(ConnStr))
            using (SQLiteCommand cmd = new SQLiteCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@doctorId", doctorId);
                cmd.Parameters.AddWithValue("@patientId", patientId);
                cmd.Parameters.AddWithValue("@date", txtAppointmentDate.Text);
                cmd.Parameters.AddWithValue("@diagnosis", txtDiagnosis.Text);
                cmd.Parameters.AddWithValue("@treatment", txtTreatment.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            ddlPatient.SelectedIndex = 0;
            txtAppointmentDate.Text = "";
            txtDiagnosis.Text = "";
            txtTreatment.Text = "";

            LoadMedicalRecords();
        }
    }
}   