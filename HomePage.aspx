
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="web_cl2vf.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Doctor's House</title>
    <link rel="stylesheet" href="HomePage.css" />
</head>
<body>
    
    <form id="form1" runat="server">
    
        <header>
            <nav id="nav-head">
                <img src="https://ximg.es/200/ccc/000" />
                </nav>
        </header>

        <main>
            <section class="hero">
                <div class="hero-text">
                    <h1>Doctor's House</h1>
                    <h2>Your health, our priority.</h2>
                    <p>
                        Welcome to Doctor's House, your trusted healthcare centre.
                        We provide professional medical care focused on your health,
                        comfort and well-being.
                    </p>
                    <asp:Button ID="Button2" runat="server" Text="Access your account" class="btn-main" />
                </div>

                <div class="hero-image">
                    <img src="https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=900" />
                </div>
            </section>

            <section class="services">
                <h2>Our services</h2>
                <p class="section-description">
                    We offer a wide range of healthcare services to take care of you.
                </p>

                <div class="services-container">
                    <div class="service-card">
                        <div class="service-icon">✚</div>
                        <h3>General Medicine</h3>
                        <p>Professional medical consultations and personalised care.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">♡</div>
                        <h3>Patient Care</h3>
                        <p>We focus on your well-being with continuous medical support.</p>
                    </div>

                    <div class="service-card">
                        <div class="service-icon">✚</div>
                        <h3>Medical Records</h3>
                        <p>Secure access to your medical information and appointments.</p>
                    </div>
                </div>
            </section>

            <section class="about">
                <div class="about-image">
                    <img src="https://images.unsplash.com/photo-1551076805-e1869033e561?w=900" />
                </div>

                <div class="about-text">
                    <h2>About our centre</h2>
                    <p>
                        At Doctor's House, we believe that everyone deserves
                        quality healthcare. Our team of professionals is
                        committed to providing reliable, accessible and
                        personalised medical attention.
                    </p>
                    <p>
                        Our goal is to make healthcare easier and more
                        comfortable for every patient.
                    </p>
                </div>
            </section>
        </main>

        <footer>
            <div class="footer-content">
                <h2>Doctor's House</h2>
                <p>Your health, our priority.</p>
                <p>Contact: info@doctorshouse.com</p>
                <p>© 2026 Doctor's House. All rights reserved.</p>
            </div>
        </footer>

    </form>

</body>
</html>
