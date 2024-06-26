--Sayfa sayýsý 400 den büyü olan kitaplar--
select * from Kitaplar where sayfa_sayisi>400 

--H hafi ile baþlayan kitaplar--
select * from Kitaplar where kitap_adi like 'H%'

--Kadýn olan üyeler--
select * from Uyeler where cinsiyet = 'kadýn'

--Erkek üyelerin adý soy adý ve e postasýný yaz--
select Uyeler.uye_adi,Uyeler.uye_soyadi,Uyeler.e_posta from Uyeler where cinsiyet = 'erkek'

--Adres no su 1 olan üyelerin isimleri--
select Uyeler.uye_adi,Uyeler.uye_soyadi from Uyeler where adres_no = 1

--Üye numarasý 11 olan kiþi hangi kitabý emanet almýþtýr?--
select * from Uyeler u inner join Emanet e on u.uye_no = e.uye_no where u.uye_no = 11

--Ankarada oturan üyelerin bilgileri--
select u.uye_adi,u.uye_soyadi,u.cinsiyet,u.telefon,u.e_posta,a.ilce,a.mahalle from Uyeler u inner join Adresler a on u.adres_no = a.adres_no where a.sehir = 'Ankara'

--14 numaralý üyenin bilgileri ve hangi kütüphaneye gittiði (tüm bilgileri)--
select * from Uyeler u join Emanet e on u.uye_no = e.uye_no join Kutuphane k on e.kutuphane_no = k.kutuphane_no where u.uye_no = 14

--Telefon numarasý 1 ile biten üyeler--
select * from Uyeler where telefon like '%1'

--Soy adý y ile baþlayan kiþilerin adres bilgileri--
select * from Uyeler u inner join Adresler a on u.adres_no = a.adres_no where u.uye_soyadi like 'Y%'

--Kütüphanede olan toplam kitap sayýsý--
SELECT COUNT(*) AS toplam_kitap_sayisi FROM Kitaplar;

--Kitaplarý alfabetik sýralama--
SELECT * FROM Kitaplar ORDER BY kitap_adi ASC;

--Kütüphanede olan kitaplar kaç yýl önce yayýnlanmýþtýr?--
SELECT kitap_adi, DATEDIFF(YEAR, yayin_tarihi, GETDATE()) AS yil_once
FROM Kitaplar;

--5 tane yazar listele--
Select top 5 * from yazarlar



