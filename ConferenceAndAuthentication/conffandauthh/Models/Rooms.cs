//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace conffandauthh.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Rooms
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Rooms()
        {
            this.UsersInRoom = new HashSet<UsersInRoom>();
        }
    
        public int roomId { get; set; }
        public string ownerId { get; set; }
        public Nullable<System.DateTime> creationDate { get; set; }
        public string name { get; set; }
        public string roomPassword { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UsersInRoom> UsersInRoom { get; set; }
        public virtual AspNetUsers AspNetUsers { get; set; }
    }
}