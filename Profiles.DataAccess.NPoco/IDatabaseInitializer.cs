using NPoco;

namespace Profiles.DataAccess.NPoco
{
    public interface IDatabaseInitializer
    {
        IDatabase Instance { get; }
    }
}
