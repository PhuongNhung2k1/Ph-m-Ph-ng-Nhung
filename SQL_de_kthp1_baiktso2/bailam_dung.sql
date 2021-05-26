use master
use sql_bai2_de_lop_khoa

insert into khoa values('K1', N'Công Nghệ Thông Tin', '12/12/1999'),
						('K2', N'Kế toán', '12/12/1999'),
						('K3', N'Ngoại Ngữ', '12/12/1999')
insert into lop values('KTPM', N'Kỹ Thuật Phần Mềm', 2, 'K1'),
					  ('KT1', N'Kế toán 1', 2, 'K2'),
					  ('N1', N'Tiếng Nhật cơ bản', 1, 'K3')
insert into sinhvien values('SV1', N'Lê Lý Thị Lan', '01/01/2000', 'KT1'),
							('SV2', N'Nguyễn Bá Nguyên', '10/02/2000', 'KTPM'),
							('SV3', N'Cao Đại La', '10/14/2000', 'KT1'),
							('SV4', N'Ngô Văn Sang', '08/09/2000', 'N1'),
							('SV5', N'Đào Thiên Ý', '07/16/2000', 'KTPM')
create function cau2(@tlop nvarchar(20), @tk nvarchar(20))
returns @bang table(
								masv nchar(10),
								hoten nvarchar(20),
								tuoi int
                                 )
as
begin
	insert into @bang		
							select masv , hoten, year(getdate())- year(ngaysinh) as tuoi
							from sinhvien inner join lop on sinhvien.malop = lop.malop
													inner join khoa on lop.makhoa = khoa.makhoa
							where tenkhoa = @tk and tenlop = @tlop
	return 
end
--test
select * from sinhvien
select * from khoa
select * from lop
---
select * from cau2('HTTT','CNTT')
--cau 3

create proc cau3(@tk nvarchar(20), @x int)
as
begin
		if(not exists(select * from lop where siso >@x and makhoa 
		in (select makhoa from khoa where tenkhoa = @tk)))
			begin
				print (N' ko ton tai danh sach')
			end
		else 
			begin
				select malop, tenlop ,siso from lop inner join khoa on khoa.makhoa = lop.makhoa
				where siso >@x and khoa.makhoa in (select makhoa from khoa where tenkhoa = @tk)
			end
end
--test
--th dung
exec cau3 N'Kế Toán ',1
--th sai
exec cau3 N'công nghệ thông tin ',10
--cau4
alter trigger cau4
on sinhvien
for delete
as
begin
	declare @msv nchar(10)
	declare @malop nchar(10)
	select @msv = masv from deleted
	select @malop from lop inner join deleted on lop.malop =deleted.malop
	if(not exists(select @msv from deleted))
		begin 
			raiserror(N' SV ko ton tai',16,1)
			rollback transaction
		end
	else
		delete sinhvien where masv = @msv 
		update lop set siso = siso - 1 from deleted  inner join lop on lop.malop = deleted.malop 
		                 
end
--test
select * from sinhvien
select * from lop
select * from khoa
--th dung
delete sinhvien where masv ='SV2' and malop ='KTPM'
--th sai
delete sinhvien where masv ='SV2' and malop ='KT1'

