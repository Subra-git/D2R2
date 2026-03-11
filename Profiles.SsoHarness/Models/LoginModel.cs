using System.ComponentModel.DataAnnotations;

namespace Profiles.SsoHarness.Models
{
    public class LoginModel
    {
        [Required]
        [MaxLength(50)]
        [Display(Name = "SSO User Token Id")]
        public string SsoUserTokenId { get; set; }
    }
}