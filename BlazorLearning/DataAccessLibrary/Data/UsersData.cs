using DataAccessLibrary.Models;

using System.Runtime.Intrinsics.Arm;
using System.Security.Cryptography;
using System.Text;

namespace DataAccessLibrary.Data
{
    public class UsersData : IUsersData
    {
        private readonly ISqlDataAccess _db;

        public UsersData()
        {
        }

        public UsersData(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<UserModel> AuthenticateUser(string email, string password)
        {
            var hashedPassword = GetHashFromRowPassword(password);
            string sql = "SELECT * FROM [dbo].[User] WHERE email = @email AND passwordHash = @hashedPassword";

            return _db.LoadFirstOrDefault<UserModel, dynamic>(sql, new { email = email, hashedPassword = hashedPassword });
        }

        private Byte[] GetHashFromRowPassword(string password)
        {
            using (SHA512 sha512 = SHA512.Create())
            {
                Byte[] inputBytes = Encoding.Default.GetBytes(password);
                return sha512.ComputeHash(inputBytes);
            }
        }
    }
}
