USE [master]
GO
/****** Object:  Database [LSONSGARDEN]    Script Date: 11/12/2023 10:58:36 AM ******/
CREATE DATABASE [LSONSGARDEN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LSONSGARDEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LSON\MSSQL\DATA\LSONSGARDEN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LSONSGARDEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LSON\MSSQL\DATA\LSONSGARDEN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LSONSGARDEN] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LSONSGARDEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LSONSGARDEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LSONSGARDEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LSONSGARDEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LSONSGARDEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LSONSGARDEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LSONSGARDEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LSONSGARDEN] SET  MULTI_USER 
GO
ALTER DATABASE [LSONSGARDEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LSONSGARDEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LSONSGARDEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LSONSGARDEN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LSONSGARDEN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LSONSGARDEN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LSONSGARDEN] SET QUERY_STORE = ON
GO
ALTER DATABASE [LSONSGARDEN] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LSONSGARDEN]
GO
/****** Object:  Table [dbo].[PlantOverallStatistic]    Script Date: 11/12/2023 10:58:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantOverallStatistic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[amount] [int] NULL,
	[picture] [nvarchar](max) NULL,
	[username] [nvarchar](50) NULL,
	[idPlant] [int] NULL,
	[status] [int] NULL,
	[seller] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantRegister]    Script Date: 11/12/2023 10:58:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantRegister](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[role] [int] NULL,
	[mail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantStatistic]    Script Date: 11/12/2023 10:58:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantStatistic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[idPlant] [int] NULL,
	[quantity] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantWarehouse]    Script Date: 11/12/2023 10:58:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantWarehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NULL,
	[quantity] [real] NULL,
	[type] [bit] NULL,
	[picture] [nvarchar](max) NULL,
	[firstQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PlantOverallStatistic] ON 

INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (10, N'Hoa tulip', 1, 120000, 120000, N'pics/products/loHoaTulip.jpg', N'dausitinhai', 23, 1, N'dausitinhai')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (11, N'Cẩm chướng', 2, 750000, 1500000, N'pics/products/camChuong.jpg', N'lsonie', 6, 1, N'lsonie')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (12, N'Cẩm tú cầu', 1, 60000, 60000, N'pics/products/camTuCau.jpg', N'lsonie', 8, 1, N'lsonie')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (13, N'Hoa đậu ngọt', 1, 180000, 180000, N'pics/products/hoaDauNgot.jpg', N'lsonie', 12, 0, N'dausitinhai')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (20, N'Hương thảo', 1, 95000, 95000, N'pics/products/huongThao.jpg', N'satthudatinh', 20, 0, N'dausitinhai')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (21, N'Trầu bà đế vương', 1, 45000, 45000, N'pics/products/trauBaDeVuong.jpg', N'satthudatinh', 29, 1, N'dausitinhai')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (22, N'Cẩm tú cầu', 3, 60000, 180000, N'pics/products/camTuCau.jpg', N'lsonie', 8, 0, NULL)
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (23, N'Bàng sing', 1, 65000, 65000, N'pics/products/bangSing.jpg', N'lsonie', 5, 1, N'lsonie')
INSERT [dbo].[PlantOverallStatistic] ([id], [name], [quantity], [price], [amount], [picture], [username], [idPlant], [status], [seller]) VALUES (24, N'Cẩm tú cầu', 1, 60000, 60000, N'pics/products/camTuCau.jpg', N'lsonie', 8, 0, NULL)
SET IDENTITY_INSERT [dbo].[PlantOverallStatistic] OFF
GO
INSERT [dbo].[PlantRegister] ([username], [password], [fullname], [gender], [role], [mail]) VALUES (N'dausitinhai', N'123456', N'đấu sĩ tình ái', 1, 2, N'lesoniuem03@gmail.com')
INSERT [dbo].[PlantRegister] ([username], [password], [fullname], [gender], [role], [mail]) VALUES (N'lsonie', N'20052003', N'Le Anh Son', 1, 1, N'oachxalach@gmail.com')
INSERT [dbo].[PlantRegister] ([username], [password], [fullname], [gender], [role], [mail]) VALUES (N'satthudatinh', N'123456', N'sát thủ đa tình', 0, 0, N'SonLAHE170211@fpt.edu.vn')
GO
SET IDENTITY_INSERT [dbo].[PlantStatistic] ON 

INSERT [dbo].[PlantStatistic] ([id], [username], [idPlant], [quantity]) VALUES (14, N'lsonie', 8, 0)
INSERT [dbo].[PlantStatistic] ([id], [username], [idPlant], [quantity]) VALUES (15, N'lsonie', 12, 0)
INSERT [dbo].[PlantStatistic] ([id], [username], [idPlant], [quantity]) VALUES (16, N'satthudatinh', 20, 0)
INSERT [dbo].[PlantStatistic] ([id], [username], [idPlant], [quantity]) VALUES (17, N'satthudatinh', 29, 0)
SET IDENTITY_INSERT [dbo].[PlantStatistic] OFF
GO
SET IDENTITY_INSERT [dbo].[PlantWarehouse] ON 

INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (6, N'Cẩm chướng', 750000, 198, 0, N'pics/products/camChuong.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (7, N'Cẩm nhung', 25000, 200, 1, N'pics/products/camNhung.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (8, N'Cẩm tú cầu', 60000, 194, 1, N'pics/products/camTuCau.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (9, N'Cúc họa mi', 15000, 200, 0, N'pics/products/cucHoaMi.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (10, N'Dương xỉ', 20000, 200, 1, N'pics/products/duongXi.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (11, N'Duyên tùng', 75000, 200, 1, N'pics/products/duyenTung.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (12, N'Hoa đậu ngọt', 180000, 199, 0, N'pics/products/hoaDauNgot.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (13, N'Hoa đồng tiền', 35000, 200, 0, N'pics/products/hoaDongTien.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (14, N'Hoa giấy', 150000, 200, 1, N'pics/products/hoaGiay.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (15, N'Hoa hồng', 45000, 200, 0, N'pics/products/hoaHong.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (16, N'Hoa hướng dương', 10000, 200, 0, N'pics/products/hoaHuongDuong.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (17, N'Hoa loa kèn', 80000, 200, 0, N'pics/products/hoaLoaKen.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (18, N'Hoa nhài', 70000, 200, 1, N'pics/products/hoaNhai.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (19, N'Hoa sứ', 200000, 200, 1, N'pics/products/hoaSu.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (20, N'Hương thảo', 95000, 192, 1, N'pics/products/huongThao.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (21, N'Kim ngân', 75000, 200, 1, N'pics/products/kimNgan.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (22, N'Kim tiền', 60000, 199, 1, N'pics/products/kimTien.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (23, N'Hoa tulip', 120000, 199, 0, N'pics/products/loHoaTulip.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (24, N'Lưỡi hổ', 55000, 200, 1, N'pics/products/luoiHo.jpeg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (25, N'Mẫu đơn', 50000, 200, 0, N'pics/products/mauDon.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (26, N'Móng rồng', 55000, 200, 1, N'pics/products/mongRong.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (27, N'Sen đá', 15000, 200, 1, N'pics/products/senDa.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (28, N'Tiểu trâm', 85000, 200, 1, N'pics/products/tieuTram.jpeg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (29, N'Trầu bà đế vương', 45000, 199, 1, N'pics/products/trauBaDeVuong.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (30, N'Trầu bà lỗ', 40000, 200, 1, N'pics/products/trauBaLo.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (31, N'Trầu bà sữa', 65000, 200, 1, N'pics/products/trauBaSua.jpg', 200)
INSERT [dbo].[PlantWarehouse] ([id], [name], [price], [quantity], [type], [picture], [firstQuantity]) VALUES (32, N'Trúc lộc', 190000, 200, 1, N'pics/products/trucLoc.jpg', 200)
SET IDENTITY_INSERT [dbo].[PlantWarehouse] OFF
GO
ALTER TABLE [dbo].[PlantStatistic]  WITH CHECK ADD  CONSTRAINT [FK_PS_FROM_PR] FOREIGN KEY([username])
REFERENCES [dbo].[PlantRegister] ([username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantStatistic] CHECK CONSTRAINT [FK_PS_FROM_PR]
GO
ALTER TABLE [dbo].[PlantStatistic]  WITH CHECK ADD  CONSTRAINT [FK_PS_FROM_PW] FOREIGN KEY([idPlant])
REFERENCES [dbo].[PlantWarehouse] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantStatistic] CHECK CONSTRAINT [FK_PS_FROM_PW]
GO
USE [master]
GO
ALTER DATABASE [LSONSGARDEN] SET  READ_WRITE 
GO
