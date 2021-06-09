use master
create database de14597_moithi
use de14597_moithi

create table GV(
magv nchar(10) not null primary key,
tengv nvarchar(20)
)
create table lop(
malop nchar(10) not null primary key,
tenlop nvarchar(20),
phong nchar(10),
sisi int,
magv nchar(10),
constraint  fk_lop_gv foreign key(magv) references GV(magv)
)
create table sinhvien(
masv nchar(10) not null primary key,
tensv nvarchar(20),
gioitinh nchar(10),
quequan nvarchar(20),
malop nchar(10),
constraint fk_lop_sinhvien foreign key(malop) references lop(malop)
)
--b
insert into GV values('GV1',N'Thế Hùng')
insert into GV values('GV2',N'Thanh Hòa')
insert into GV values('GV3',N'Lan Hương')

insert into lop values('l01',N'httt',504,69,'GV2') 
insert into lop values('l02',N'cntt',503,70,'GV1') 
insert into lop values('l03',N'khmt',501,72,'GV3') 

insert into sinhvien values('sv1',N'Lê Ngọc A',N'Nam',N'Hà Nội','l01')
insert into sinhvien values('sv2',N'Lê Ngọc B',N'Nam',N'Thanh Hóa','l03')
insert into sinhvien values('sv3',N'Lê Ngọc C',N'Nữ',N'Nam Định','l02')
insert into sinhvien values('sv4',N'Lê Ngọc D',N'Nam',N'Hà Nội','l02')
insert into sinhvien values('sv5',N'Lê Ngọc E',N'Nữ',N'Vĩnh Phúc','l01')

--
select * from GV
select * from lop
select * from sinhvien
--cau2
create function cau2(@tlop nvarchar(20), @tgv nvarchar(20))
returns @bang table(
								masv nchar(10),
								tensv nvarchar(20),
								gioitinh nchar(10),
								quequan nvarchar(20),
								malop nchar(10)
								)
as
begin
					insert into @bang	
					select masv, tensv, gioitinh, quequan,lop.malop
					from sinhvien inner join lop on lop.malop = sinhvien.malop
											inner join GV on GV.magv = lop.magv
					where tenlop = @tlop and tengv = @tgv
		return
end
--test
select * from cau2 ('cntt',N'Thế Hùng')
select * from cau2 ('httt',N'Thanh Hòa')
select * from cau2 ('khmt',N'Lan Hương')

--cau3

create proc cau3(@msv nchar(10), @tsv nvarchar(20),@gt nchar(10),@qq nvarchar(20),@tlop nvarchar(20))
as
begin
				if(not exists(select * from lop where tenlop = @tlop))
					begin
						print('ten lop khong ton tai')
					end
				else
				begin 
					declare @malop nchar(10)
					select @malop = malop from lop where tenlop = @tlop
					insert into sinhvien values(@msv, @tsv ,@gt ,@qq,@malop )
				end
end
--test
--th sai
exec cau3 'sv2','sv Moi',N'Nữ',N'Vĩnh Lộc','httt2'
--th dung
exec cau3 'sv6',N'sv Moi',N'Nữ',N'Vĩnh Lộc','httt'
select * from sinhvien

--cau4 
-------------------------------TH CHEN 
create trigger cau4
on sinhvien
for insert
as
begin
	declare @ss int
	select @ss = sisi from lop
	declare @malop nchar(10)
	select @malop = lop.malop from inserted inner join lop on lop.malop = inserted.malop
	update lop set sisi =sisi +1 where malop = @malop
end

--test
select * from sinhvien
select * from lop
insert into sinhvien values( 'sv7',N'sv Moi2',N'Nữ',N'Vĩnh Lộc','l02')
select * from sinhvien
select * from lop

insert into sinhvien values( 'sv8',N'sv Moi2',N'Nữ',N'Vĩnh Lộc','l05')
------------------------------------------TH up date

create trigger cau4
on sinhvien
for update
as
begin
	declare @mlcu nchar(10)
	select @mlcu = malop from deleted
	declare @mlmoi nchar(10)
	select @mlmoi = malop from inserted
	update lop set sisi = sisi + 1 where malop = @mlmoi
	update lop set sisi = sisi -1 where malop = @mlcu
end

--test
select * from sinhvien
select * from lop
update sinhvien set malop = 'l03' where masv = 'sv3'
select * from sinhvien
select * from lop