
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DoctorPage.aspx.cs" Inherits="web_cl2vf.DoctorPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Doctor's House - Doctor</title>

    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/DoctorPage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- HEADER -->
        <header>
            <nav id="nav-head">

                <div class="logo">
                    <a href="Hero.aspx">
                        <img src="https://ximg.es/200/ccc/000" alt="Logo" />
                    </a>
                        <span>Doctor's House</span>
                </div>

                <div class="admin-info">
                    <span>Doctor </span>
                    <asp:Button ID="btnLogout" runat="server"
                        Text="Log out" CssClass="btn-login" OnClick="btnLogout_Click" />
                </div>

            </nav>
        </header>

        <main class="doctor-container">

            <div class="doctor-info">
                <h1 class="doctor-title">Doctor Dashboard</h1>
                <p>Manage your patients and their medical records.</p>
            </div>

            <!-- MEDICAL RECORDS -->
            <section class="management-section">

                <div class="section-header">
                    <h2>Medical Records</h2>
                    <p>View and manage your patients' medical sessions.</p>
                </div>

                <!-- FORM -->
                <div class="form-card">
                    <h3>Add / Edit Medical Record</h3>

                    <div class="form-grid">

                        <div class="form-group">
                            <label>Patient</label>
                            <asp:DropDownList ID="ddlPatient" runat="server"
                                CssClass="form-input">
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <label>Appointment Date</label>
                            <asp:TextBox ID="txtAppointmentDate" runat="server"
                                TextMode="Date" CssClass="form-input">
                            </asp:TextBox>
                        </div>

                        <div class="form-group full-width">
                            <label>Diagnosis</label>
                            <asp:TextBox ID="txtDiagnosis" runat="server"
                                TextMode="MultiLine" Rows="3"
                                CssClass="form-input">
                            </asp:TextBox>
                        </div>

                        <div class="form-group full-width">
                            <label>Treatment</label>
                            <asp:TextBox ID="txtTreatment" runat="server"
                                TextMode="MultiLine" Rows="3"
                                CssClass="form-input">
                            </asp:TextBox>
                        </div>

                    </div>

                    <div class="form-buttons">
                        <asp:Button ID="btnSaveRecord" runat="server"
                            Text="Save Record" CssClass="btn-main" />

                        <asp:Button ID="btnCancelRecord" runat="server"
                            Text="Cancel" CssClass="btn-secondary" />
                    </div>
                </div>

                <!-- TABLE -->
                <div class="table-card">
                    <h3>My Patients' Medical Records</h3>

                    <asp:GridView ID="gvMedicalRecords" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="data-table"
                        GridLines="None">

                        <Columns>

                            <asp:BoundField DataField="SessionId"
                                HeaderText="Session ID" />

                            <asp:BoundField DataField="PatientName"
                                HeaderText="Patient" />

                            <asp:BoundField DataField="AppointmentDate"
                                HeaderText="Appointment Date"
                                DataFormatString="{0:dd/MM/yyyy}" />

                            <asp:BoundField DataField="Diagnosis"
                                HeaderText="Diagnosis" />

                            <asp:BoundField DataField="Treatment"
                                HeaderText="Treatment" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server"
                                        Text="Edit"
                                        CommandName="EditRecord"
                                        CommandArgument='<%# Eval("SessionId") %>'
                                        CssClass="btn-edit">
                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete" runat="server"
                                        Text="Delete"
                                        CommandName="DeleteRecord"
                                        CommandArgument='<%# Eval("SessionId") %>'
                                        CssClass="btn-delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');">
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>
                </div>

            </section>

        </main>

        <footer>
            <p>© 2026 Doctor's House. All rights reserved.</p>
        </footer>

    </form>
</body>
</html>
