create database Kutuphane
use Kutuphane

create table Uyeler(
	uye_no int identity(1,1) primary key,
	uye_adi nvarchar(255)  ,
	uye_soyadi nvarchar(255) ,
	cinsiyet nvarchar(255) ,
	telefon varchar(20),
	e_posta nvarchar(255),
	adres_no int 
);

create table Emanet(
	emanet_no int  identity(1,1) primary key,
	isbn int,
	uye_no int,
	kutuphane_no int,
	emanet_tarihi datetime,
	teslim_tarihi datetime,
);

create table Yazarlar(
	yazar_no int identity(1,1) primary key,
	yazar_adi varchar(255),
	yazar_soyadi varchar(255)
);

create table Kutuphane(
	kutuphane_no int identity(1,1) primary key,
	kutuphane_ismi varchar(255),
	aciklama varchar(255),
	adres_no int
);

create table Adresler(
	adres_no int identity(1,1) primary key,
	ilce varchar(255),
	mahalle varchar(255),
	bina_no int,
	sehir varchar(255),
	posta_kodu int,
	ulke varchar(255)	
);

create table Kitaplar(
	isbn int primary key,
	kitap_adi varchar(255),
	yayin_tarihi datetime,
	sayfa_sayisi int	
	
);

create table Kategoriler(
	kategori_no int identity(1,1) primary key,
	kategori_adi varchar(255)
);

-- Uyeler tablosu 
ALTER TABLE Uyeler ADD CONSTRAINT FK_Uyeler_Adresler FOREIGN KEY (adres_no) REFERENCES Adresler(adres_no);

-- Emanet tablosu
ALTER TABLE Emanet ADD CONSTRAINT FK_Emanet_Uyeler FOREIGN KEY (uye_no) REFERENCES Uyeler(uye_no);

ALTER TABLE Emanet ADD CONSTRAINT FK_Emanet_Kutuphane FOREIGN KEY (kutuphane_no) REFERENCES Kutuphane(kutuphane_no);

-- Kutuphane tablosu
ALTER TABLE Kutuphane ADD CONSTRAINT FK_Kutuphane_Adresler FOREIGN KEY (adres_no) REFERENCES Adresler(adres_no);

-- Kitaplar tablosu
ALTER TABLE Kitaplar ADD CONSTRAINT FK_Kitaplar_Yazarlar FOREIGN KEY (yazar_no) REFERENCES Yazarlar(yazar_no);

-- Emanet tablosu
ALTER TABLE Emanet ADD CONSTRAINT FK_Emanet_Kitaplar FOREIGN KEY (isbn) REFERENCES Kitaplar(isbn);

-- Kategoriler tablosu
ALTER TABLE Kategoriler ADD CONSTRAINT FK_Kategoriler_Kitaplar FOREIGN KEY (isbn) REFERENCES Kitaplar(isbn);
