﻿using System;
using System.Collections.Generic;

#nullable disable

namespace Flipkart.API.Models
{
    public partial class Inventory
    {
        public int InventoryId { get; set; }
        public int? ProductId { get; set; }
        public int UnitInStock { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool? IsActive { get; set; }

        public virtual Product Product { get; set; }
    }
}
