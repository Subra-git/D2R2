using System;

namespace Profiles.DataModels.Views
{
    public class ReviewEmailUser
    {
        public Guid Id { get; set; }

        public string UserName { get; set; }

        public string EmailAddress { get; set; }

        public string FullName { get; set; }
    }
}
