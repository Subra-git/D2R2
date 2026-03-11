namespace Profiles.Infrastructure
{
    public interface IGlobalSettings
    {
        string FromEmailAddress { get; }

        string FromEmailDisplayName { get; }
    }
}
