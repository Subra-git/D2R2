using NPoco;

namespace Profiles.DataAccess.NPoco
{
    public class DatabaseInitializer : IDatabaseInitializer
    {
        public IDatabase Instance
        {
            get
            {
                return new Database("ProfilesDatabase");
            }
        }
    }
}
