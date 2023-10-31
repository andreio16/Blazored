namespace DataAccessLibrary.Models
{
    public class OrderModel
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string? DeliveryNote { get; set; }
        public string? OrderDate { get; set; }
        public double TotalPrice { get; set; }
        public bool IsAccepted { get; set; }
        public bool IsPacked { get; set; }
        public bool IsCourierAssigned { get; set; }
        public bool IsPickedUp { get; set; }
        public bool ArrivedSuccessfully { get; set; }
    }
}
