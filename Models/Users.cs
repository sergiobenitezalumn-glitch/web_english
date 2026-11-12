using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace web_cl2vf.Models
{
    public class User
    {
        
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Name { get; set; }

        public User(int id, string username, string password, string role, string name)
        {
            Id = id;
            Username = username;
            Password = password;
            Role = role;
            Name = name;
        }
    }
}