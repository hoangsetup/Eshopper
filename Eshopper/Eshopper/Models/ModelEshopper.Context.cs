﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Eshopper.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class db_EshopperEntities : DbContext
    {
        public db_EshopperEntities()
            : base("name=db_EshopperEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<tblBrand> tblBrands { get; set; }
        public DbSet<tblCategory> tblCategories { get; set; }
        public DbSet<tblCondition> tblConditions { get; set; }
        public DbSet<tblProduct> tblProducts { get; set; }
    }
}