USE [master]
GO
/****** Object:  Database [Kutuphane]    Script Date: 2.06.2023 13:21:19 ******/
CREATE DATABASE [Kutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kutuphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\Kutuphane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Kutuphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\SQL SERVER\MSSQL16.MSSQLSERVER\MSSQL\DATA\Kutuphane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kutuphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kutuphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kutuphane] SET RECOVERY FULL 
GO
ALTER DATABASE [Kutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [Kutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kutuphane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Kutuphane] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kutuphane', N'ON'
GO
ALTER DATABASE [Kutuphane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Kutuphane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Kutuphane]
GO
/****** Object:  Table [dbo].[Adresler]    Script Date: 2.06.2023 13:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adresler](
	[adres_no] [int] IDENTITY(1,1) NOT NULL,
	[ilce] [varchar](255) NULL,
	[mahalle] [varchar](255) NULL,
	[bina_no] [int] NULL,
	[sehir] [varchar](255) NULL,
	[posta_kodu] [int] NULL,
	[ulke] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[adres_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emanet]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emanet](
	[emanet_no] [int] IDENTITY(1,1) NOT NULL,
	[isbn] [int] NULL,
	[uye_no] [int] NULL,
	[kutuphane_no] [int] NULL,
	[emanet_tarihi] [datetime] NULL,
	[teslim_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[emanet_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[kategori_no] [int] IDENTITY(1,1) NOT NULL,
	[kategori_adi] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[kategori_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[isbn] [int] NOT NULL,
	[kitap_adi] [varchar](255) NULL,
	[yayin_tarihi] [datetime] NULL,
	[sayfa_sayisi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kutuphane]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kutuphane](
	[kutuphane_no] [int] IDENTITY(1,1) NOT NULL,
	[kutuphane_ismi] [varchar](255) NULL,
	[aciklama] [varchar](255) NULL,
	[adres_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[kutuphane_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[uye_no] [int] IDENTITY(1,1) NOT NULL,
	[uye_adi] [nvarchar](255) NULL,
	[uye_soyadi] [nvarchar](255) NULL,
	[cinsiyet] [nvarchar](255) NULL,
	[telefon] [varchar](20) NULL,
	[e_posta] [nvarchar](255) NULL,
	[adres_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uye_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 2.06.2023 13:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[yazar_no] [int] IDENTITY(1,1) NOT NULL,
	[yazar_adi] [varchar](255) NULL,
	[yazar_soyadi] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[yazar_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adresler] ON 

INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (1, N'Kızılay', N'Cumhuriyet', 5, N'Ankara', 6420, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (2, N'Mamak', N'Altınevler', 8, N'Ankara', 6350, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (3, N'Beşiktaş', N'Akatlar', 14, N'İstanbul', 34330, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (4, N'Kadıköy', N'Moda', 3, N'İstanbul', 34744, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (5, N'Bornova', N'Barbaros', 21, N'İzmir', 35030, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (6, N'Karşıyaka', N'Atakent', 7, N'İzmir', 35590, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (7, N'Sürmene', N'Üzümlü', 15, N'Trabzon', 61600, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (8, N'Osmangazi', N'Akpınar', 4, N'Bursa', 16160, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (9, N'Lara', N'Yeşilköy', 26, N'Antalya', 7230, N'Türkiye')
INSERT [dbo].[Adresler] ([adres_no], [ilce], [mahalle], [bina_no], [sehir], [posta_kodu], [ulke]) VALUES (10, N'Gölcük', N'Denizevler', 18, N'Kocaeli', 41650, N'Türkiye')
SET IDENTITY_INSERT [dbo].[Adresler] OFF
GO
SET IDENTITY_INSERT [dbo].[Emanet] ON 

INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (1, 1, 3, 3, CAST(N'2009-12-10T00:00:00.000' AS DateTime), CAST(N'2009-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (2, 2, 3, 2, CAST(N'2019-12-11T00:00:00.000' AS DateTime), CAST(N'2023-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (3, 3, 8, 1, CAST(N'2009-10-22T00:00:00.000' AS DateTime), CAST(N'2009-10-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (4, 4, 11, 2, CAST(N'2010-12-10T00:00:00.000' AS DateTime), CAST(N'2010-12-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (5, 5, 14, 4, CAST(N'2011-12-10T00:00:00.000' AS DateTime), CAST(N'2011-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (6, 6, 8, 1, CAST(N'2020-10-10T00:00:00.000' AS DateTime), CAST(N'2020-10-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (7, 7, 9, 4, CAST(N'2015-09-19T00:00:00.000' AS DateTime), CAST(N'2015-09-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (8, 8, 10, 3, CAST(N'2008-05-01T00:00:00.000' AS DateTime), CAST(N'2008-05-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (9, 9, 3, 2, CAST(N'2019-12-10T00:00:00.000' AS DateTime), CAST(N'2020-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Emanet] ([emanet_no], [isbn], [uye_no], [kutuphane_no], [emanet_tarihi], [teslim_tarihi]) VALUES (10, 10, 11, 1, CAST(N'2010-12-10T00:00:00.000' AS DateTime), CAST(N'2010-12-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Emanet] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (1, N'Bilgisayar')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (2, N'Klasik')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (3, N'Fantastik')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (4, N'Edebiyat')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (5, N'Matematik')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (6, N'Psikoloji')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (7, N'Tarih')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (8, N'Türk Roman')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (9, N'Bilim')
INSERT [dbo].[Kategoriler] ([kategori_no], [kategori_adi]) VALUES (10, N'Diğer')
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (1, N'C# Programlama', CAST(N'2011-07-01T00:00:00.000' AS DateTime), 470)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (2, N'Analitik Geometri', CAST(N'2002-09-02T00:00:00.000' AS DateTime), 155)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (3, N'Yazım Kuralları', CAST(N'2019-05-05T00:00:00.000' AS DateTime), 220)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (4, N'Kişisel Gelişim', CAST(N'2019-05-06T00:00:00.000' AS DateTime), 395)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (5, N'Muhasebe', CAST(N'2013-03-03T00:00:00.000' AS DateTime), 360)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (6, N'Tarihimi Öğreniyorum', CAST(N'2009-07-07T00:00:00.000' AS DateTime), 450)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (7, N'Yaban', CAST(N'1932-06-06T00:00:00.000' AS DateTime), 214)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (8, N'Zamanın Kısa Tarihi', CAST(N'1988-01-01T00:00:00.000' AS DateTime), 255)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (9, N'Java Dili', CAST(N'2012-12-12T00:00:00.000' AS DateTime), 587)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (10, N'Harry Potter ve Felsefe Taşı', CAST(N'2001-09-04T00:00:00.000' AS DateTime), 272)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (11, N'Harry Potter ve Sırlar Odası', CAST(N'2001-09-05T00:00:00.000' AS DateTime), 314)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (12, N'Harry Potter ve Azkaban Tutsağı', CAST(N'2001-09-08T00:00:00.000' AS DateTime), 395)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (13, N'Harry Potter ve Ateş Kadehi', CAST(N'2001-09-11T00:00:00.000' AS DateTime), 660)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (14, N'Harry Potter ve Zümrüdüanka', CAST(N'2003-09-09T00:00:00.000' AS DateTime), 975)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (15, N'Harry Potter ve Melez Prens', CAST(N'2005-09-10T00:00:00.000' AS DateTime), 594)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (16, N'Harry Potter ve Ölüm Yadigarları', CAST(N'2005-09-10T00:00:00.000' AS DateTime), 690)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (17, N'Yüzüklerin Efendisi Yüzük Kardeşliği', CAST(N'2001-09-02T00:00:00.000' AS DateTime), 496)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (18, N'Yüzüklerin Efendisi İki Kule', CAST(N'2002-09-02T00:00:00.000' AS DateTime), 432)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (19, N'Yüzüklerin Efendisi Kralın Dönüşü', CAST(N'2003-09-02T00:00:00.000' AS DateTime), 428)
INSERT [dbo].[Kitaplar] ([isbn], [kitap_adi], [yayin_tarihi], [sayfa_sayisi]) VALUES (20, N'İnsan Ne ile Yaşar', CAST(N'1885-09-02T00:00:00.000' AS DateTime), 112)
GO
SET IDENTITY_INSERT [dbo].[Kutuphane] ON 

INSERT [dbo].[Kutuphane] ([kutuphane_no], [kutuphane_ismi], [aciklama], [adres_no]) VALUES (1, N'Merkez', N'Merkez Kütüphane', 1)
INSERT [dbo].[Kutuphane] ([kutuphane_no], [kutuphane_ismi], [aciklama], [adres_no]) VALUES (2, N'Beşiktaş', N'Kartal Kütüphane', 3)
INSERT [dbo].[Kutuphane] ([kutuphane_no], [kutuphane_ismi], [aciklama], [adres_no]) VALUES (3, N'Bursa', N'Osmangazi Kütüphane', 4)
INSERT [dbo].[Kutuphane] ([kutuphane_no], [kutuphane_ismi], [aciklama], [adres_no]) VALUES (4, N'İzmir', N'Konak Kütüphane', 7)
SET IDENTITY_INSERT [dbo].[Kutuphane] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (1, N'Ayşe', N'Yılmaz', N'kadın', N'5321478569', N'ayse.yilmaz@hotmail.com', 6)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (2, N'Mehmet', N'Öztürk', N'erkek', N'5446912783', N'mehmet.ozturk@hotmail.com', 1)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (3, N'Zeynep', N'Kaya', N'kadın', N'5027364821', N'zeynep.kaya@outlook.com', 3)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (4, N'Ahmet', N'Demir', N'erkek', N'5562309481', N'ahmet.demir@outlook.com', 7)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (5, N'Esra', N'Şahin', N'kadın', N'5286734915', N'esra.sahin@hotmail.com', 1)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (6, N'Ali', N'Aksoy', N'erkek', N'5198243657', N'ali.aksoy@gmail.com', 2)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (7, N'Fatma', N'Yıldız', N'kadın', N'5349671028', N'fatma.yildiz@hotmail.com', 7)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (8, N'İbrahim', N'Arslan', N'erkek', N'5617439280', N'ibrahim.arslan@gmail.com', 0)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (9, N'Derya', N'Çelik', N'kadın', N'5774628903', N'derya.celik@hotmail.com', 0)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (10, N'Hasan', N'Aydın', N'erkek', N'5942137506', N'hasan.aydin@hotmail.com', 1)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (11, N'Ayşegül', N'Gündüz', N'kadın', N'5663291847', N'aysegul.gunduz@outlook.com', 2)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (12, N'Mustafa', N'Kocaman', N'erkek', N'5812739546', N'mustafa.kocaman@hotmail.com', 8)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (13, N'Elif', N'Avcı', N'kadın', N'5489267130', N'elif.avci@outlook.com', 4)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (14, N'Yusuf', N'Özdemir', N'erkek', N'5326174098', N'yusuf.ozdemir@gmail.com', 9)
INSERT [dbo].[Uyeler] ([uye_no], [uye_adi], [uye_soyadi], [cinsiyet], [telefon], [e_posta], [adres_no]) VALUES (15, N'Seda', N'Özkan', N'kadın', N'5631409872', N'seda.ozkan@gmail.com', 5)
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (1, N'Deniz', N'Yılmaz')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (2, N'Ayşe', N'Kaya')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (3, N'Mehmet', N'Öztürk')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (4, N'Elif', N'Çelik')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (5, N'Ali', N'Arslan')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (6, N'Zeynep', N'Demir')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (7, N'Yakup Kadri', N'Karaosmanoğlu')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (8, N'Stephen', N'Hawking')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (9, N'Ahmet', N'Şahin')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (10, N'J.K.', N'Rowling')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (11, N'J.R.R.', N'Tolkien')
INSERT [dbo].[Yazarlar] ([yazar_no], [yazar_adi], [yazar_soyadi]) VALUES (12, N'Lev Mikolayeviç', N'Tolstoy')
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
ALTER TABLE [dbo].[Emanet]  WITH CHECK ADD  CONSTRAINT [FK_Emanet_Kitaplar] FOREIGN KEY([isbn])
REFERENCES [dbo].[Kitaplar] ([isbn])
GO
ALTER TABLE [dbo].[Emanet] CHECK CONSTRAINT [FK_Emanet_Kitaplar]
GO
ALTER TABLE [dbo].[Emanet]  WITH CHECK ADD  CONSTRAINT [FK_Emanet_Kutuphane] FOREIGN KEY([kutuphane_no])
REFERENCES [dbo].[Kutuphane] ([kutuphane_no])
GO
ALTER TABLE [dbo].[Emanet] CHECK CONSTRAINT [FK_Emanet_Kutuphane]
GO
ALTER TABLE [dbo].[Emanet]  WITH CHECK ADD  CONSTRAINT [FK_Emanet_Uyeler] FOREIGN KEY([uye_no])
REFERENCES [dbo].[Uyeler] ([uye_no])
GO
ALTER TABLE [dbo].[Emanet] CHECK CONSTRAINT [FK_Emanet_Uyeler]
GO
ALTER TABLE [dbo].[Kategoriler]  WITH CHECK ADD  CONSTRAINT [FK_Kategoriler_Yazarlar] FOREIGN KEY([kategori_no])
REFERENCES [dbo].[Yazarlar] ([yazar_no])
GO
ALTER TABLE [dbo].[Kategoriler] CHECK CONSTRAINT [FK_Kategoriler_Yazarlar]
GO
ALTER TABLE [dbo].[Kutuphane]  WITH CHECK ADD  CONSTRAINT [FK_Kutuphane_Adresler] FOREIGN KEY([adres_no])
REFERENCES [dbo].[Adresler] ([adres_no])
GO
ALTER TABLE [dbo].[Kutuphane] CHECK CONSTRAINT [FK_Kutuphane_Adresler]
GO
USE [master]
GO
ALTER DATABASE [Kutuphane] SET  READ_WRITE 
GO
