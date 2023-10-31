using DataAccessLibrary.Models;

namespace DataAccessLibrary.Data
{
    public interface IOrdersData
    {
        Task<List<OrderModel>> GetAllOrders();
        Task<List<OrderModel>> GetOrdersByUserId(int Id);
        Task InsertOrder(OrderModel order);
    }
}