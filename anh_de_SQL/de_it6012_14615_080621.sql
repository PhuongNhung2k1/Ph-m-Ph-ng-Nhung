use master
create database de_IT6012_14615
use de_IT6012_14615

create table BN(
mabn nchar(10) not null primary key,
tenbn nvarchar(20),
gioitinh nchar(10),
sodt nchar(10),
email nvarchar(20)
)
create table khoa(
makhoa nchar(10) not null primary key,
tenkhoa nvarchar(20),
diachi nvarchar(20),
tienngay int,
tongbn int
)

create table hoadon(
sohd nchar(10) not null primary key,
mabn nchar(10),
makhoa nchar(10),
songay int,
constraint fk_hoadon_khoa foreign key(makhoa) references khoa(makhoa),
constraint fk_hoadon_Bn foreign key(mabn) references BN(mabn)
)

insert into BN values('BN01',N'Nguyễn Văn A',N'Nam','091245728',N'nguyenA@gmail.com')
insert into BN values('BN02',N'Nguyễn Văn B',N'Nam','094345728',N'nguyenB@gmail.com')
insert into BN values('BN03',N'Nguyễn Văn C',N'Nam','092245728',N'nguyenC@gmail.com')

insert into khoa values('K01',N'Tim',N'Hà Nội',120000,110)
insert into khoa values('K02',N'Phổi',N'Thanh Hóa',100000,120)
insert into khoa values('K03',N'Mạch',N'Hải Dương',110000,150)

insert into hoadon values('HD01','BN02','K03',15)
insert into hoadon values('HD02','BN01','K03',12)
insert into hoadon values('HD03','BN03','K01',11)
insert into hoadon values('HD04','BN01','K02',14)
insert into hoadon values('HD05','BN02','K02',13)

--test
select * from BN
select * from khoa
select * from hoadon

--cau2
create function cau2(@mbn nchar(10))
returns int
as
begin
	declare @tongtien int
	select @tongtien = sum(songay*tienngay) from hoadon 
									inner join khoa on khoa.makhoa = hoadon.makhoa
									inner join BN on BN.mabn = hoadon.mabn
	where BN.mabn = @mbn
	return @tongtien
end

--test
select dbo.cau2('BN01') as 'Tien tra'
select dbo.cau2('BN02') as 'Tien tra'
select dbo.cau2('BN03') as 'Tien tra'

--cau3

create proc cau3(@shd nchar(10),@mabn nchar(10),@tkhoa nvarchar(20),@ngaynamvien int)
as
begin
	if(not exists(select * from khoa where tenkhoa = @tkhoa))
		begin
			print('ten khoa khong on tai')
		end
	else
	begin
		declare @makhoa nchar(10)
		select @makhoa = makhoa from khoa where tenkhoa =@tkhoa
		insert into hoadon values(@shd,@mabn ,@makhoa,@ngaynamvien)
	end
end

--test vi có 3 bn thoi
exec cau3 'HD06','BN02',N'Phổi',10
select * from khoa
select * from hoadon
--cau4

alter trigger cau4 
on hoadon
for insert 
as
begin
	declare @makhoamoi nchar(10)
	select @makhoamoi = makhoa from inserted
	declare @makhoacu nchar(10) 
	select @makhoacu = makhoa from khoa
	update khoa set tongbn = tongbn +1 where makhoa = @makhoamoi
	update khoa set tongbn = tongbn - 1 where makhoa = @makhoacu
end

--test
--th dung
select * from hoadon
select * from khoa
insert into hoadon values('HD07','BN01','K03',10)
select * from hoadon
select * from khoa
insert into hoadon values('HD08','BN01','K01',10)

insert into hoadon values('HD09','BN01','K02',10)

insert into hoadon values('HD10','BN02','K03',10)
--------------------d.a gui
create trigger cau4 
on HD
for insert 
as
begin
     declare @MaKhoa nchar(20)
	 select @MaKhoa = MaKhoa from Khoa
	 begin
	     update Khoa set TongBenhNhan = TongBenhNhan - 1 where @MaKhoa = MaKhoa
	end
end
-----
select *from HD
select *from Khoa
insert into HD values ('HD7','BN3','K2',10)
select *from HD
select *from Khoa