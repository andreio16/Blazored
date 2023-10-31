using DataAccessLibrary.Models;

namespace DataAccessLibrary.Data
{
    public class ProductsData : IProductsData
    {
        private readonly ISqlDataAccess _db;

        public ProductsData(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<List<ProductModel>> GetProducts()
        {
            string sql = "SELECT * FROM [dbo].[Product]";
            return _db.LoadData<ProductModel, dynamic>(sql, new { });
        }
    }
}
