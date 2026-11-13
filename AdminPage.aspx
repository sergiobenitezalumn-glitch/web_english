<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="web_cl2vf.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administrator - Doctor's House</title>

    <link href="Content/AdminPage.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>

<body>

    <form id="form1" runat="server">

        <!-- HEADER -->
        <header>
            <nav id="nav-head">

                <div class="logo">
                    <a href="Hero">
                        <img src="https://ximg.es/200/ccc/000" alt="Logo" />
                    </a>
                        <span>Doctor's House</span>
                </div>

                <div class="admin-info">
                    <span>Administrator</span>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-login" OnClick="btnLogout_Click" />
                </div>

            </nav>
        </header>

        <main class="admin-container">

            <!-- PAGE TITLE -->
            <section class="admin-title">
                <h1>Administrator Panel</h1>
                <p>Manage doctors and patients registered in the healthcare centre.</p>
            </section>


            <!-- DOCTORS SECTION -->
            <section class="management-section">

                <div class="section-header">
                    <div>
                        <h2>Doctors Management</h2>
                        <p>View and manage registered doctors.</p>
                    </div>
                </div>

                <!-- ADD / EDIT DOCTOR -->
                <div class="form-card">

                    <h3>Add / Edit Doctor</h3>

                    <div class="form-grid">

                        <div class="form-group">
                            <asp:Label ID="lblDoctorName" runat="server"
                                Text="Full Name" AssociatedControlID="txtDoctorName" />

                            <asp:TextBox ID="txtDoctorName" runat="server"
                                CssClass="form-input" placeholder="Enter full name" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblDoctorID" runat="server"
                                Text="Identification Number" AssociatedControlID="txtDoctorID" />

                            <asp:TextBox ID="txtDoctorID" runat="server"
                                CssClass="form-input" placeholder="Enter ID" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblDoctorMobile" runat="server"
                                Text="Mobile" AssociatedControlID="txtDoctorMobile" />

                            <asp:TextBox ID="txtDoctorMobile" runat="server"
                                CssClass="form-input" TextMode="Phone"
                                placeholder="Enter mobile number" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblDoctorUsername" runat="server"
                                Text="Username" AssociatedControlID="txtDoctorUsername" />

                            <asp:TextBox ID="txtDoctorUsername" runat="server"
                                CssClass="form-input" placeholder="Enter username" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblDoctorPassword" runat="server"
                                Text="Password" AssociatedControlID="txtDoctorPassword" />

                            <asp:TextBox ID="txtDoctorPassword" runat="server"
                                CssClass="form-input" TextMode="Password"
                                placeholder="Enter password" />
                        </div>

                    </div>

                    <div class="form-buttons">

                        <asp:Button ID="btnAddDoctor" runat="server"
                            Text="Save Doctor" CssClass="btn-main" OnClick="btnAddDoctor_Click" />

                        <asp:Button ID="btnCancelDoctor" runat="server"
                            Text="Clear" CssClass="btn-secondary"
                            CausesValidation="false" />

                    </div>

                </div>

                <!-- DOCTORS TABLE -->
                <div class="table-card">

                    <h3>Registered Doctors</h3>

                    <asp:GridView ID="gvDoctors" runat="server" CssClass="data-table" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="No doctors registered." GridLines="None" OnRowCommand="gvDoctors_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="Name"
                                HeaderText="Name" />

                            <asp:BoundField DataField="IDNumber"
                                HeaderText="ID" />

                            <asp:BoundField DataField="Mobile"
                                HeaderText="Mobile" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    
                                    <asp:Button ID="btnEditDoctor" runat="server"
                                        Text="Edit" CssClass="btn-edit"
                                        CommandName="EditDoctor"
                                        CommandArgument='<%# Eval("Id") %>' />

                                    <asp:Button ID="btnDeleteDoctor" runat="server"
                                        Text="Delete" CssClass="btn-delete"
                                        CommandName="DeleteDoctor"
                                        CommandArgument='<%# Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </section>


            <!-- PATIENTS SECTION -->
            <section class="management-section">

                <div class="section-header">
                    <div>
                        <h2>Patients Management</h2>
                        <p>View and manage registered patients.</p>
                    </div>
                </div>

                <!-- ADD / EDIT PATIENT -->
                <div class="form-card">

                    <h3>Add / Edit Patient</h3>

                    <div class="form-grid">

                        <div class="form-group">
                            <asp:Label ID="lblPatientName" runat="server"
                                Text="Full Name" AssociatedControlID="txtPatientName" />

                            <asp:TextBox ID="txtPatientName" runat="server"
                                CssClass="form-input" placeholder="Enter full name" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientID" runat="server"
                                Text="Identification Number" AssociatedControlID="txtPatientID" />

                            <asp:TextBox ID="txtPatientID" runat="server"
                                CssClass="form-input" placeholder="Enter ID" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientDOB" runat="server"
                                Text="Date of Birth" AssociatedControlID="txtPatientDOB" />

                            <asp:TextBox ID="txtPatientDOB" runat="server"
                                CssClass="form-input" TextMode="Date" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientAddress" runat="server"
                                Text="Address" AssociatedControlID="txtPatientAddress" />

                            <asp:TextBox ID="txtPatientAddress" runat="server"
                                CssClass="form-input" placeholder="Enter address" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientMobile" runat="server"
                                Text="Mobile" AssociatedControlID="txtPatientMobile" />

                            <asp:TextBox ID="txtPatientMobile" runat="server"
                                CssClass="form-input" TextMode="Phone"
                                placeholder="Enter mobile number" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientDoctor" runat="server"
                                Text="Assigned Doctor" AssociatedControlID="ddlPatientDoctor" />

                            <asp:DropDownList ID="ddlPatientDoctor" runat="server"
                                CssClass="form-input">

                                <asp:ListItem Text="Select a doctor" Value="" />

                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientUsername" runat="server"
                                Text="Username" AssociatedControlID="txtPatientUsername" />

                            <asp:TextBox ID="txtPatientUsername" runat="server"
                                CssClass="form-input" placeholder="Enter username" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblPatientPassword" runat="server"
                                Text="Password" AssociatedControlID="txtPatientPassword" />

                            <asp:TextBox ID="txtPatientPassword" runat="server"
                                CssClass="form-input" TextMode="Password"
                                placeholder="Enter password" />
                        </div>

                    </div>

                    <div class="form-buttons">

                        <asp:Button ID="btnAddPatient" runat="server"
                            Text="Save Patient" CssClass="btn-main" OnClick="btnAddPatient_Click" />

                        <asp:Button ID="btnCancelPatient" runat="server"
                            Text="Clear" CssClass="btn-secondary"
                            CausesValidation="false" />

                    </div>

                </div>

                <!-- PATIENTS TABLE -->
                <div class="table-card">

                    <h3>Registered Patients</h3>

                    <asp:GridView ID="gvPatients" runat="server" CssClass="data-table" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="No patients registered." GridLines="None" OnRowCommand="gvPatients_RowCommand">

                        <Columns>

                            <asp:BoundField DataField="Name"
                                HeaderText="Name" />

                            <asp:BoundField DataField="IDNumber"
                                HeaderText="ID" />

                            <asp:BoundField DataField="DOB"
                                HeaderText="Date of Birth" />

                            <asp:BoundField DataField="Address"
                                HeaderText="Address" />

                            <asp:BoundField DataField="Mobile"
                                HeaderText="Mobile" />

                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    
                                    <asp:Button ID="btnEditPatient" runat="server"
                                        Text="Edit" CssClass="btn-edit"
                                        CommandName="EditPatient"
                                        CommandArgument='<%# Eval("Id") %>' />

                                    <asp:Button ID="btnDeletePatient" runat="server"
                                        Text="Delete" CssClass="btn-delete"
                                        CommandName="DeletePatient"
                                        CommandArgument='<%# Eval("Id") %>' />

                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </section>

        </main>


        <!-- FOOTER -->
        <footer>
            <div class="footer-content">
                <h2>Doctor's House</h2>
                <p>Administrator Panel</p>
                <p>© 2026 Doctor's House. All rights reserved.</p>
            </div>
        </footer>

    </form>

</body>
</html>