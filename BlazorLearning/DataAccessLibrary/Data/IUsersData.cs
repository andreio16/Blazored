using DataAccessLibrary.Models;

namespace DataAccessLibrary.Data
{
    public interface IUsersData
    {
        Task<UserModel> AuthenticateUser(string email, string password);
    }
}