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
    
    public partial class UsersInOldRoom
    {
        public string userId { get; set; }
        public int oldRoomId { get; set; }
    
        public virtual OldRooms OldRooms { get; set; }
    }
}
