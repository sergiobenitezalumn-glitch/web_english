<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientPage.aspx.cs" Inherits="web_cl2vf.PatientPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Doctor's House - Patient</title>

    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/PatientPage.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- HEADER -->
        <header id="nav-head">
            <div class="logo">DOCTOR'S HOUSE</div>
            <asp:Button ID="btnLogout" runat="server"
                Text="Log out" CssClass="btn-login" />
        </header>

        <main class="patient-container">

            <div class="patient-info">
                <h1 class="patient-title">
                    Welcome, <asp:Label ID="lblWelcome" runat="server" />
                </h1>
                <p>Here you can check your personal information and your medical records.</p>
            </div>

            <!-- PERSONAL INFORMATION -->
            <section class="management-section">

                <div class="section-header">
                    <h2>Personal Information</h2>
                    <p>This information is read-only.</p>
                </div>

                <div class="info-card">
                    <div class="info-grid">

                        <div class="info-item">
                            <span class="info-label">Name</span>
                            <asp:Label ID="lblName" runat="server" CssClass="info-value" />
                        </div>

                        <div class="info-item">
                            <span class="info-label">ID Number</span>
                            <asp:Label ID="lblIdNumber" runat="server" CssClass="info-value" />
                        </div>

                        <div class="info-item">
                            <span class="info-label">Date of Birth</span>
                            <asp:Label ID="lblDob" runat="server" CssClass="info-value" />
                        </div>

                        <div class="info-item">
                            <span class="info-label">Mobile</span>
                            <asp:Label ID="lblMobile" runat="server" CssClass="info-value" />
                        </div>

                        <div class="info-item">
                            <span class="info-label">Address</span>
                            <asp:Label ID="lblAddress" runat="server" CssClass="info-value" />
                        </div>

                        <div class="info-item">
                            <span class="info-label">Your Doctor</span>
                            <asp:Label ID="lblDoctor" runat="server" CssClass="info-value" />
                        </div>

                    </div>
                </div>

            </section>

            <!-- MEDICAL RECORDS -->
            <section class="management-section">

                <div class="section-header">
                    <h2>Medical Records</h2>
                    <p>History of your medical sessions.</p>
                </div>

                <div class="table-card">
                    <h3>My Medical Records</h3>

                    <asp:GridView ID="gvMedicalRecords" runat="server"
                        AutoGenerateColumns="False"
                        CssClass="data-table"
                        GridLines="None"
                        EmptyDataText="You do not have any medical records yet.">

                        <Columns>

                            <asp:BoundField DataField="AppointmentDate"
                                HeaderText="Appointment Date"
                                DataFormatString="{0:dd/MM/yyyy}" />

                            <asp:BoundField DataField="DoctorName"
                                HeaderText="Doctor" />

                            <asp:BoundField DataField="Diagnosis"
                                HeaderText="Diagnosis" />

                            <asp:BoundField DataField="Treatment"
                                HeaderText="Treatment" />

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
