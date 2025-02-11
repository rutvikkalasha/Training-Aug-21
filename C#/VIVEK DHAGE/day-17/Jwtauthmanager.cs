﻿using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace Day17_1
{
    public class Jwtauthmanager : IJwtauthmanager
    {

        private readonly IDictionary<string, string> users = new Dictionary<string, string>
        { {"test1","pass1" },{"test2","pass2" } };

        private readonly string key;

        public Jwtauthmanager(string key) {
            this.key = key;
        }
        public string Authenticate(string username, string password)
        {
            if (users.Any(u=>u.Key == username && u.Value == password)) 
            {
                return null;
            }

            var tokenHandler = new JwtSecurityTokenHandler();
            var tokenKey = Encoding.ASCII.GetBytes(key);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                new Claim(ClaimTypes.Name, username)
                 }),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(tokenKey),
                SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
