CREATE TABLE [dbo].[Product]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [name] VARCHAR(50) NULL, 
    [description] VARCHAR(500) NULL, 
    [price] FLOAT NULL,
	[currency] VARCHAR(10) NULL,
)
INSERT INTO [dbo].[Product] (name,description,price,currency)
VALUES ('DJI Mini 3 PRO Drone',
		'Mini 3 Pro sports a completely new look that is optimized to get more out of every flight. With larger propellers, an aerodynamic body tilt, and a powerful obstacle sensing system, the streamlined design allows for increased flight time and safety.',
		880.99,
		'euro')
		
INSERT INTO [dbo].[Product] (name,description,price,currency)
VALUES ('DJI Inspire 3',
		'Inspire 3 is a professional camera drone that adopts a fluid new design that takes aerodynamics fully into consideration to reduce air resistance.The max dive speed has increased from the 9 m/s of Inspire 2 to 10 m/s, while vertical ascend/descend speed has increased from 6 m/s and 4 m/s to 8 m/s.',
		16490.00,
		'euro')		
			
INSERT INTO [dbo].[Product] (name,description,price,currency)
VALUES ('OSMO Pocket 3',
		'The all-new Pocket 3 features a powerful 1-inch CMOS sensor that puts detail-rich imaging right in the palm of your hand. With a 2-inch rotatable touchscreen and full-pixel fast focusing, go horizontal or vertical for more precise awareness and control. 4K/120fps, three-axis mechanical stabilization, and a host of intelligent features make Pocket 3 ready for any moving moment.',
		580.00,
		'euro')
		
INSERT INTO [dbo].[Product] (name,description,price,currency)
VALUES ('DJI Mavic 3 PRO',
		'The DJI Mavic 3 Series features next-level imaging performance. Mavic 3 Pro''s triple-camera system ushers in a new era of camera drones by housing three sensors and lenses with different focal lengths. Equipped with a Hasselblad camera and dual tele cameras, Mavic 3 Pro is a triple-camera drone that unlocks new shooting perspectives, allowing you to embrace creative freedom further, capture fascinating scenery, explore photographic storytelling, and make cinematic masterpieces.',
		2400.00,
		'euro')
		
		
		

CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [email] VARCHAR(50) NULL, 
    [passwordHash] NVARCHAR(500) NULL, 
    [isAdmin]  BIT,
)
INSERT INTO [dbo].[User] (email, passwordHash, isAdmin)
VALUES('user@user.co', HASHBYTES('SHA2_512', 'user123'), 0)

INSERT INTO [dbo].[User] (email, passwordHash, isAdmin)
VALUES('admin@admin.co', HASHBYTES('SHA2_512', 'admin123'), 1)



CREATE TABLE [dbo].[Order] (
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
    [userId] INT NULL,
	[deliveryNote] NVARCHAR(250) NULL,
    [totalPrice] FLOAT NULL,
    [orderDate] VARCHAR(50) NULL,
	[isAccepted] BIT,
	[isPacked] BIT,
	[isCourierAssigned] BIT,
	[isPickedUp] BIT,
	[arrivedsuccessfully] BIT,
    FOREIGN KEY (userId) REFERENCES [dbo].[User](Id)
);





        test = totalPrice.ToString();
        test = purchaseConfirm.CurrentQuantity.ToString();
        test = purchaseConfirm.CurrentProduct.Name;

 public Dictionary<int, Tuple<ProductModel, int>>? OrderedProducts { get; set; }
 
 
 
 SELECT * FROM [dbo].[User] WHERE email = @email AND passwordHash = @hashedPassword
 
 { email = "user@user.co", passwordHash = "70e9b857aca8d91bc6407f76262723939ea25cdaf74644820afffd28cfdba12d84121fd225a1c7bdac0c7d9116e04a08bde682716e43d24ac31436b8eb8f575a" }
 
 
 
 
 
            using (SHA512 sha512 = SHA512.Create())
            {
                byte[] bytes = Encoding.ASCII.GetBytes(password);
                byte[] hashedBytes = sha512.ComputeHash(bytes);

                StringBuilder builder = new StringBuilder();
                foreach (byte b in hashedBytes)
                {
                    builder.Append(b.ToString("x2"));
                }

                return builder.ToString();
            }
			
			DECLARE @hashedValue VARBINARY(8000) = HASHBYTES('SHA2_512', 'user123')
			SELECT
				CAST(N'' AS XML).value(
					  'xs:base64Binary(xs:hexBinary(sql:column("bin")))'
					, 'VARCHAR(MAX)'
				)   Base64Encoding
			FROM (
				SELECT @hashedValue AS bin
			) AS bin_sql_server_temp;
			
			
			

--alter table dbo.[User]
--alter column [passwordHash] VARBINARY(8000) NULL

--alter table [dbo].[User]
--add [new_column] VARBINARY(MAX) NULL

alter table [dbo].[User]
alter column [passwordHash] NVARCHAR(500) NULL

--update dbo.[User]
--set [new_column] = CONVERT(VARBINARY(MAX),[passwordHash])

--alter table dbo.[User]
--drop column [passwordHash]

alter table dbo.[User]
rename column [new_column] to [passwordHash]

EXEC sp_rename 'User.new_column', 'passwordHash', 'COLUMN';


update [dbo].[User]
set passwordHash = (Select passwordHash from [dbo].[User] where Id=7)
Where Id=9



    public class DataSessionService
    {
        public UserModel? UserInfo { get; set; }
    }
    private async Task LoginUser()
    {
        var user = await UserAccess.AuthenticateUser(sessionUser.Email, sessionUser.Password);
        DataSession.UserInfo = new UserModel()
            {
                Id = user.Id,
                Email = user.Email,
                IsAdmin = user.IsAdmin
            };

        ((CustomAuthenticationStateProvider)AuthenticationStateProvider).MarkUserAsAuthenticated(user.Email);
        NavigationManager.NavigateTo("/");

        await sessionStorage.SetItemAsync("email", user.Email);
        await sessionStorage.SetItemAsync("admin", user.IsAdmin);
    }