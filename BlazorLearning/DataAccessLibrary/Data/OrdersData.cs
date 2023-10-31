using DataAccessLibrary.Models;

namespace DataAccessLibrary.Data
{
    public class OrdersData : IOrdersData
    {
        private readonly ISqlDataAccess _db;

        public OrdersData(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<List<OrderModel>> GetAllOrders()
        {
            string sql = "SELECT * FROM [dbo].[Order]";
            return _db.LoadData<OrderModel, dynamic>(sql, new { });
        }

        public Task<List<OrderModel>> GetOrdersByUserId(int userId)
        {
            string sql = "SELECT * FROM [dbo].[Order] WHERE userId = @userId";
            return _db.LoadData<OrderModel, dynamic>(sql, new {userId = userId });
        }

        public Task InsertOrder(OrderModel order)
        {
            string sql = "INSERT INTO [dbo].[Order] (userID, deliveryNote, totalPrice, orderDate, isAccepted, isPacked, isCourierAssigned, isPickedUp, arrivedsuccessfully)" +
                         "VALUES (@UserId, @DeliveryNote, @TotalPrice, @OrderDate, @IsAccepted, @IsPacked, @IsCourierAssigned, @IsPickedUp, @ArrivedSuccessfully);";
            return _db.SaveData(sql, order);
        }
    }
}
