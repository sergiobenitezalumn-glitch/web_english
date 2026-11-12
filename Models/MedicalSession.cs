using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_cl2vf.Models
{
    public class MedicalSession
    {
        public int SessionId { get; set; }
        public int DoctorId { get; set; }
        public int PatientId { get; set; }
        public string AppointmentDate { get; set; }
        public string Diagnosis { get; set; }
        public string Treatment { get; set; }

        public MedicalSession(int doctorId, int patientId, string date, string diagnosis, string treatment)
        {
            DoctorId = doctorId;
            PatientId = patientId;
            AppointmentDate = date;
            Diagnosis = diagnosis;
            Treatment = treatment;
        }
    }
}