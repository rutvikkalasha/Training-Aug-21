﻿using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace CharityAPI.Models
{
    public partial class Organisations
    {
        public Organisations()
        {
            OrganisationData = new HashSet<OrganisationData>();
        }

        public long OrganisationId { get; set; }
        public string UserName { get; set; }
        public string EmailAddress { get; set; }
        public string PasswordHash { get; set; }
        public string MobileNo { get; set; }
        public long? Otp { get; set; }
        public DateTime? OtpCreatedAt { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedAt { get; set; }
        public bool? IsPublished { get; set; }

        public virtual ICollection<OrganisationData> OrganisationData { get; set; }
    }
}
