--Sayfa say�s� 400 den b�y� olan kitaplar--
select * from Kitaplar where sayfa_sayisi>400 

--H hafi ile ba�layan kitaplar--
select * from Kitaplar where kitap_adi like 'H%'

--Kad�n olan �yeler--
select * from Uyeler where cinsiyet = 'kad�n'

--Erkek �yelerin ad� soy ad� ve e postas�n� yaz--
select Uyeler.uye_adi,Uyeler.uye_soyadi,Uyeler.e_posta from Uyeler where cinsiyet = 'erkek'

--Adres no su 1 olan �yelerin isimleri--
select Uyeler.uye_adi,Uyeler.uye_soyadi from Uyeler where adres_no = 1

--�ye numaras� 11 olan ki�i hangi kitab� emanet alm��t�r?--
select * from Uyeler u inner join Emanet e on u.uye_no = e.uye_no where u.uye_no = 11

--Ankarada oturan �yelerin bilgileri--
select u.uye_adi,u.uye_soyadi,u.cinsiyet,u.telefon,u.e_posta,a.ilce,a.mahalle from Uyeler u inner join Adresler a on u.adres_no = a.adres_no where a.sehir = 'Ankara'

--14 numaral� �yenin bilgileri ve hangi k�t�phaneye gitti�i (t�m bilgileri)--
select * from Uyeler u join Emanet e on u.uye_no = e.uye_no join Kutuphane k on e.kutuphane_no = k.kutuphane_no where u.uye_no = 14

--Telefon numaras� 1 ile biten �yeler--
select * from Uyeler where telefon like '%1'

--Soy ad� y ile ba�layan ki�ilerin adres bilgileri--
select * from Uyeler u inner join Adresler a on u.adres_no = a.adres_no where u.uye_soyadi like 'Y%'

--K�t�phanede olan toplam kitap say�s�--
SELECT COUNT(*) AS toplam_kitap_sayisi FROM Kitaplar;

--Kitaplar� alfabetik s�ralama--
SELECT * FROM Kitaplar ORDER BY kitap_adi ASC;

--K�t�phanede olan kitaplar ka� y�l �nce yay�nlanm��t�r?--
SELECT kitap_adi, DATEDIFF(YEAR, yayin_tarihi, GETDATE()) AS yil_once
FROM Kitaplar;

--5 tane yazar listele--
Select top 5 * from yazarlar



