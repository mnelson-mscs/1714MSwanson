//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _1714mswanson2h
{
    using System;
    using System.Collections.Generic;
    
    public partial class Follows
    {
        public int Id { get; set; }
        public System.DateTime FollowingSince { get; set; }
        public string Following_PersonId { get; set; }
    
        public virtual Person Person { get; set; }
    }
}