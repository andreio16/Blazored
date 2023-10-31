using Blazored.SessionStorage;

using DataAccessLibrary.Models;

using Microsoft.AspNetCore.Components.Authorization;

using System.Security.Claims;

using static Dapper.SqlMapper;

namespace DeliveryApp.Data
{
    public class CustomAuthenticationStateProvider : AuthenticationStateProvider
    {
        private readonly ISessionStorageService _sessionStorageService;

        public CustomAuthenticationStateProvider(ISessionStorageService sessionStorage)
        {
            _sessionStorageService = sessionStorage;
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            var userEmail = await _sessionStorageService.GetItemAsync<string>("email");
            ClaimsIdentity identity = new ClaimsIdentity();

            if (userEmail != null)
            {
                identity = new ClaimsIdentity(
                   claims: new[] { new Claim(ClaimTypes.Name, userEmail) },
                   authenticationType: "local_auth"
                );
            }

            var user = new ClaimsPrincipal(identity);
            return await Task.FromResult(new AuthenticationState(user));
        }

        public void MarkUserAsAuthenticated(string userEmail)
        {
             var identity = new ClaimsIdentity(
                claims: new[] { new Claim(ClaimTypes.Name, userEmail) },
                authenticationType: "local_auth"
                );

            var user = new ClaimsPrincipal(identity);

            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(user)));
        }

        public void MarkUserAsLoggedOut()
        {
            _sessionStorageService.RemoveItemAsync("uid");
            _sessionStorageService.RemoveItemAsync("email");
            _sessionStorageService.RemoveItemAsync("admin");

            var identity = new ClaimsIdentity();

            var user = new ClaimsPrincipal(identity);

            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(user)));
        }
    }
}
