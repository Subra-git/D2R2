namespace Profiles.Infrastructure
{
    public static class GlobalSettingsFactory
    {
        public static IGlobalSettings FromConfig()
        {
            return new WebConfigGlobalSettings();
        }
    }
}
