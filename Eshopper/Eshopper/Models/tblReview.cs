//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class tblReview
    {
        public int PK_iReviewID { get; set; }
        public int FK_iProductID { get; set; }
        public string sName { get; set; }
        public string sEmail { get; set; }
        public Nullable<int> FK_iUesrID { get; set; }
        public string sReview { get; set; }
        public Nullable<System.DateTime> tDatetime { get; set; }
    
        public virtual tblProduct tblProduct { get; set; }
    }
}
