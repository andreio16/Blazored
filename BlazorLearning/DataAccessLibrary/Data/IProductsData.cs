using DataAccessLibrary.Models;

namespace DataAccessLibrary.Data
{
    public interface IProductsData
    {
        Task<List<ProductModel>> GetProducts();
    }
}