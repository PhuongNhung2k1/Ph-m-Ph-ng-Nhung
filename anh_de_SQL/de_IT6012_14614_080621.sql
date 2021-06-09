use master
create database QLNhapXuat
use QLNhapXuat

create table sanpham(
masp nchar(10) not null primary key,
tensp nvarchar(20),
mausac nchar(10),
soluong int,
giaban money
)
create table Nhap(
sohdN nchar(10) not null primary key,
masp nchar(10),
soluongN int,
ngayN datetime,
constraint fk_nhap_sanpham foreign key(masp) references sanpham(masp)
)
create table Xuat(
sohdX nchar(10) not null primary key,
masp nchar(10),
soluongX int,
ngayX datetime,
constraint fk_xuat_sanpham foreign key(masp) references sanpham(masp)
)

insert into sanpham values('SP01',N'Sam sung',N'đỏ',140,5000000)
insert into sanpham values('SP02',N'Iphone',N'trắng',170,2000000)
insert into sanpham values('SP03',N'Vivo',N'đen',150,3000000)

insert into nhap values('N01','SP02',200,'02/05/2021')
insert into nhap values('N02','SP01',190,'12/02/2020')
insert into nhap values('N03','SP03',220,'02/09/2020')

insert into Xuat values('X01','SP01',120,'06/06/2021')
insert into Xuat values('X02','SP03',100,'10/10/2021')


---test
select * from sanpham
select * from Nhap
select * from Xuat

--cau2
create function cau2(@tsp nvarchar(20))
returns int
as
begin
	declare @tongtien int
	select @tongtien = sum(soluongN * giaban) from Nhap inner join sanpham on sanpham.masp = Nhap.masp
	where @tsp = sanpham.tensp
	return @tongtien
end

--test
select dbo.cau2('Sam sung')

--cau3
create proc cau3(@msp nchar(10), @tsp nvarchar(20),@ms nchar(10),@sl int, @gb money,@tv int output)
as
begin
	if(not exists(select * from sanpham where tensp = @tsp))
		begin
			print('ten sp khong ton tai')
			set @tv =0
		end
	else
		begin
		insert into sanpham values(@msp, @tsp ,@ms,@sl, @gb )
		set @tv = 1
		end
end

--test
--th sai
declare @loi int
exec cau3 'SP01',N'Sam sung2',N'đỏ',100,7000000, @loi  output
select @loi
--=th dung
declare @loi int
exec cau3 'SP04',N'Sam sung',N'đỏ',100,7000000, @loi  output
select @loi
select * from sanpham

--cau4

alter  trigger cau4
on Xuat 
for insert 
as
begin
	declare @slx int
	select @slx = soluongX from inserted 
	declare @msp nchar(10)
	select @msp = masp from sanpham 
	declare @soluong int
	select @soluong = soluong from sanpham where masp = @msp
	if(@slx > @soluong)
		begin
				raiserror(N' khong du hang',16,1)
				rollback transaction
		end
	else
			begin
				update sanpham set soluong = soluong - @slx 
				where masp = @msp 
			end
end

--test
select * from Xuat
select * from sanpham
insert into Xuat values('X04','SP01',15,'12/10/2021')

select * from Xuat
select * from sanpham

