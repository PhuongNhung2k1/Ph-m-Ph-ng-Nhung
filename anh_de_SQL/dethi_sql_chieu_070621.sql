use master
create database QLSach_thi 
use	QLSach_thi
create table tacgia(
matg nchar(10) not null primary key,
tentg nvarchar(20),
soluongco int
)
create table NXB(
manxb nchar(10) not null primary key,
tennxb nvarchar(20),
soluongco int
)
create table sach(
masach nchar(10) not null primary key,
tensach nvarchar(10),
manxb nchar(10),
matg nchar(10),
namxb int,
soluong int,
dongia money,
constraint fk_sach_NXB foreign key(manxb) references NXB(manxb),
constraint fk_sach_tacgia foreign key(matg) references tacgia(matg)
)

insert into tacgia values('TG1',N'Nguyên Hồng',200)
insert into tacgia values('TG2',N'Thạch Lam',150)
insert into tacgia values('TG3',N'Nguyễn Du',220)
insert into tacgia values('TG4',N'Nguyễn Trãi',200)

insert into NXB values('NXB1',N'trẻ',120)
insert into NXB values('NXB2',N'Kim Đồng',160)
insert into NXB values('NXB3',N'xanh',190)
insert into NXB values('NXB4',N'Sóng Xuân',140)
insert into NXB values('NXB5',N'Đời sống',150)

insert into sach values('S01',N'truyện','NXB1','TG4',2001,140,20000)
insert into sach values('S02',N'thơ mới','NXB2','TG2',2000,110,15000)
insert into sach values('S03',N'kiều','NXB3','TG3',1999,120,25000)
insert into sach values('S04',N'đứa trẻ','NXB4','TG1',1985,130,25000)

--test
select * from sach
select * from NXB 
select * from tacgia
--cau2

create proc cau2(@ms nchar(10), @ts nvarchar(20), @tennxb nvarchar(20), @mtg nchar(10),@namxb int, @sl int, @dg money)
as
begin
	if(not exists(select manxb from NXB where tennxb = @tennxb))
		begin
			print(N' ten NXB khong ton tai')
		end
	else
	begin
			declare @manxb nchar(10)
			select @manxb = manxb from NXB
			insert into sach values(@ms, @ts, @manxb, @mtg,@namxb , @sl, @dg)
	end
end

--test
--th khong dung
exec cau2 'S01',N'truyện ','NXB11','TG4',2001,140,20000
--th dung
exec cau2 'S011',N'truyện moi ',N'Kim Đồng','TG3',2020,120,22000
select * from sach

--cau3
create function cau3(@tentg nvarchar(20))
returns int
as
begin
	declare @tongtien int
	select @tongtien = sum(soluong*dongia) from sach inner join tacgia on sach.matg = tacgia.matg
	where tentg = @tentg
	return @tongtien
end

--test
select dbo.cau3(N'Thạch Lam') as 'TienBan'
select dbo.cau3(N'Nguyên Hồng') as 'TienBan'
select dbo.cau3(N'Nguyễn Du') as 'TienBan'
select dbo.cau3(N'Nguyễn Trãi') as 'TienBan'
--cau4
alter trigger cau4
on sach
for insert 
as
begin
	declare @soluongb int
	select @soluongb = soluong from inserted
	declare @manxb nchar(10)
	select @manxb = NXB.manxb from NXB inner join inserted on inserted.manxb = NXB.manxb
	if(not exists(select @manxb from NXB))
		begin
			raiserror ('Mã nxb chưa có mặt trong bảng nhaxb',16,1)
			rollback transaction 
		end
	else 
		update NXB set soluongco = soluongco - @soluongb where manxb = @manxb 
end

--test

select * from sach
select * from NXB
insert into sach values('S014',N'đứa trẻ','NXB4','TG1',1985,130,25000)
select * from sach
select * from NXB
insert into sach values('S015',N'đứa trẻ 2','NXB0','TG2',1985,130,25000)