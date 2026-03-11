using System.Configuration;

namespace Profiles.Infrastructure
{
    public class WebConfigGlobalSettings : IGlobalSettings
    {
        public string FromEmailAddress
        {
            get { return ConfigurationManager.AppSettings["EmailFromAddress"]; }
        }

        public string FromEmailDisplayName
        {
            get { return ConfigurationManager.AppSettings["EmailFromDisplayName"]; }
        }
    }
}
