﻿--DROP DATABASE SIEUTHIMINI
--GO

CREATE DATABASE SIEUTHIMINI
GO

USE SIEUTHIMINI
GO

CREATE TABLE QUYEN(
MaQuyen varchar(3) NOT NULL,
VaiTro NVARCHAR(50) NOT NULL,
CONSTRAINT PK_ROLE PRIMARY KEY(MaQuyen),
)
GO

CREATE TABLE CHUCVU(
MaCV VARCHAR(3) NOT NULL,
TenCV NVARCHAR(50) NOT NULL,
CONSTRAINT PK_CHUCVU PRIMARY KEY(MaCV),
)
GO

CREATE TABLE NHANVIEN(
MaNV VARCHAR(5) NOT NULL,
TenNV NVARCHAR(50) NOT NULL,
NgaySinh DATE NOT NULL,
SDT VARCHAR(10) NOT NULL,
DiaChi NVARCHAR(50) NOT NULL,
GioiTinh NVARCHAR(4) NOT NULL,
CCCD VARCHAR(12) NOT NULL,
NgayVaoLam DATE NOT NULL,
MaCV VARCHAR(3) NOT NULL,
TrangThai CHAR(1) NOT NULL,
CONSTRAINT PK_NHANVIEN PRIMARY KEY(MaNV),
CONSTRAINT FK_CHUCVU_NHANVIEN FOREIGN KEY(MaCV) REFERENCES CHUCVU(MaCV),
)
GO

CREATE TABLE TAIKHOAN(
MaNV VARCHAR(5) NOT NULL,
TenDangNhap VARCHAR(10) NOT NULL,
MatKhau VARCHAR(10) NOT NULL,
MaQuyen VARCHAR(3) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_TAIKHOAN PRIMARY KEY(MaNV),
CONSTRAINT FK_NHANVIEN_TAIKHOAN FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
CONSTRAINT FK_QUYEN_TAIKHOAN FOREIGN KEY(MaQuyen) REFERENCES QUYEN(MaQuyen),
)
GO

CREATE TABLE LOAIHANG(
MaLH VARCHAR(5) NOT NULL,
TenLH NVARCHAR(50) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_LOAIHANG PRIMARY KEY(MaLH),
)
GO

CREATE TABLE SANPHAM(
MaSP VARCHAR(5) NOT NULL,
TenSP NVARCHAR(50) NOT NULL,
GiaMua VARCHAR(10) NOT NULL,
GiaBan VARCHAR(10) NOT NULL,
NSX DATE NOT NULL,
HSD DATE NOT NULL,
MaLH VARCHAR(5) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_SANPHAM PRIMARY KEY(MaSP),
CONSTRAINT FK_LOAIHANG_SANPHAM FOREIGN KEY(MaLH) REFERENCES LOAIHANG(MaLH),
)
GO

CREATE TABLE KHO(
MaSP VARCHAR(5) NOT NULL,
SoLuong VARCHAR(10) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_KHO PRIMARY KEY(MaSP),
CONSTRAINT FK_SANPHAM_KHO FOREIGN KEY(MaSP) REFERENCES SANPHAM(MaSP),
)
GO

CREATE TABLE KHACHHANG(
MaKH VARCHAR(5) NOT NULL,
TenKH NVARCHAR(50) NOT NULL,
SDT VARCHAR(10) NOT NULL,
TichDiem VARCHAR(10) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_KHACHHANG PRIMARY KEY(MaKH),
)
GO

CREATE TABLE KHUYENMAI(
MaKM VARCHAR(3) NOT NULL,
MucGiam VARCHAR(3) NOT NULL,
CONSTRAINT PK_KHUYENMAI PRIMARY KEY(MaKM),
)
GO

CREATE TABLE DSHOADON(
MaHD VARCHAR(5) NOT NULL,
MaNV VARCHAR(5) NOT NULL,
MaKH VARCHAR(5) NOT NULL,
TongTien VARCHAR(20) NOT NULL,
TongTienSauKM VARCHAR(20) NOT NULL,
ThoiDiemLap DATE NOT NULL,
MaKM VARCHAR(3) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_DSHOADON PRIMARY KEY(MaHD),
CONSTRAINT FK_NHANVIEN_DSHOADON FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
CONSTRAINT FK_KHACHHANG_DSHOADON FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH),
CONSTRAINT FK_KHUYENMAI_DSHOADON FOREIGN KEY(MaKM) REFERENCES KHUYENMAI(MaKM),
)
GO

CREATE TABLE CHITIETHOADON(
MaHD VARCHAR(5) NOT NULL,
MaSP VARCHAR(5) NOT NULL,
SoLuong VARCHAR(10) NOT NULL,
ThanhTien VARCHAR(20) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_CHITIETHOADON PRIMARY KEY(MaHD,MaSP),
CONSTRAINT FK_DSHOADON_CHITIETHOADON FOREIGN KEY(MaHD) REFERENCES DSHOADON(MaHD),
CONSTRAINT FK_SANPHAM_CHITIETHOADON FOREIGN KEY(MaSP) REFERENCES SANPHAM(MaSP),
)
GO

CREATE TABLE NHACUNGCAP(
MaNCC VARCHAR(5) NOT NULL,
TenNCC NVARCHAR(50) NOT NULL,
DiaChi NVARCHAR(50) NOT NULL,
SDT VARCHAR (10) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_NHACUNGCAP PRIMARY KEY(MaNCC),
)
GO

CREATE TABLE DSPHIEUNHAP(
MaPN VARCHAR(5) NOT NULL,
MaNV VARCHAR(5) NOT NULL,
MaNCC VARCHAR(5) NOT NULL,
TongTien VARCHAR(20) NOT NULL,
NgayNhap DATE NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_DSPHIEUNHAP PRIMARY KEY(MaPN),
CONSTRAINT FK_NHANVVIEN_DSPHIEUNHAP FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV),
CONSTRAINT FK_NHACUNGCAP_DSPHIEUNHAP FOREIGN KEY(MaNCC) REFERENCES NHACUNGCAP(MaNCC),
)
GO

CREATE TABLE CHITIETPHIEUNHAP(
MaPN VARCHAR(5) NOT NULL,
MaSP VARCHAR(5) NOT NULL,
SoLuong VARCHAR(10) NOT NULL,
ThanhTien VARCHAR(20) NOT NULL,
TrangThai VARCHAR(1) NOT NULL,
CONSTRAINT PK_CHITIETPHIEUNHAP PRIMARY KEY(MaPN,MaSP),
CONSTRAINT FK_DSPHIEUNHAP_CHITIETPHIEUNHAP FOREIGN KEY(MaPN) REFERENCES DSPHIEUNHAP(MaPN),
CONSTRAINT FK_SANPHAM_CHITIETPHIEUNHAP FOREIGN KEY(MaSP) REFERENCES SANPHAM(MaSP),
)
GO

INSERT INTO QUYEN(MaQuyen,VaiTro) VALUES ('RL1',N'ADMIN')
INSERT INTO QUYEN(MaQuyen,VaiTro) VALUES ('RL2',N'QUẢN LÝ')
INSERT INTO QUYEN(MaQuyen,VaiTro) VALUES ('RL3',N'NHÂN VIÊN BÁN HÀNG')
INSERT INTO QUYEN(MaQuyen,VaiTro) VALUES ('RL4',N'NHÂN VIÊN KHO')

INSERT INTO CHUCVU(MaCV,TenCV) VALUES ('CV1',N'ADMIN')
INSERT INTO CHUCVU(MaCV,TenCV) VALUES ('CV2',N'QUẢN LÝ')
INSERT INTO CHUCVU(MaCV,TenCV) VALUES ('CV3',N'NHÂN VIÊN BÁN HÀNG')
INSERT INTO CHUCVU(MaCV,TenCV) VALUES ('CV4',N'NHÂN VIÊN KHO')

INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV001',N'Trần Văn A Minh','1998-02-19','0943065953',N'NGUYỄN THÁI BÌNH,TÂN BÌNH','NAM','092203006158','2018-04-20','CV1','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV002',N'Hồ Lâm Trường','1998-02-19','0943065953',N'NGUYỄN THÁI BÌNH,TÂN BÌNH','NAM','092203006158','2018-04-20','CV2','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV003',N'TRẦN KHÔI NGUYÊN','1996-05-28','0943576356',N'HỒNG ĐỨC,TPHCM','NAM','0952456987','2015-04-25','CV4','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV004',N'NGUYỄN PHƯƠNG TRÚC','2000-02-19','0943032453',N'NGUYỄN THÁI BÌNH,BÌNH THẠNH',N'NỮ','092219906158','2018-04-10','CV3','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV005',N'NGUYỄN THỊ XINH','1998-07-19','0943045238',N'HOÀNG SA,TÂN BÌNH','NAM','092203456783','2018-08-20','CV3','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV006',N'PHẠM ANH HUY','1995-01-08','0943523953',N'HỒNG BÀNG,TÂN BÌNH','NAM','087673006158','2018-01-01','CV3','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV007',N'NGUYỄN XUÂN HIÊU','1990-01-20','0133065953',N'NGUYỄN THÁI BÌNH,BÌNH CHÁNH','NAM','092416713422','2018-08-18','CV3','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV008',N'TRẦN QUỐC HÙNG','1998-02-19','0943065411',N'VÕ THỊ SÁU,TÂN BÌNH','NAM','045673006158','2018-04-20','CV4','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV009',N'NGUYỄN THỊ NGỌC HÀ','2001-03-07','0134565953',N'LÊ HỒNG PHONG,THỦ ĐỨC',N'NỮ','011203002258','2022-03-03','CV4','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV010',N'Hồ YẾN TRÂN','1996-02-19','0456728908',N'TRẦN QUANG KHẢI,QUẬN 10',N'NỮ','013452792092','2020-09-17','CV4','1')
INSERT INTO NHANVIEN(MaNV,TenNV,NgaySinh,SDT,DiaChi,GioiTinh,CCCD,NgayVaoLam,MaCV,TrangThai) VALUES('NV011',N'Hồ LÂM PHÁT','1999-02-28','0788065953',N'NGUYỄN THÁI BÌNH,QUẬN 7','NAM','033333002258','2021-04-27','CV3','1')

INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV001','ADMIN','123','RL1','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV002','TRUONGBHX','123','RL2','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV003','NGUYENBHX','123','RL4','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV004','TRUCBHX','123','RL3','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV005','XINHBHX','123','RL3','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV006','HUYBHX','123','RL3','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV007','HIEUBHX','123','RL3','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV008','HUNGBHX','123','RL4','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV009','HABHX','123','RL4','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV010','TRANBHX','123','RL4','1')
INSERT INTO TAIKHOAN(MaNV,TenDangNhap,MatKhau,MaQuyen,TrangThai) VALUES('NV011','PHATBHX','123','RL3','1')

INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH001',N'TRẦN TUẦN KHỞI','0675678656','10','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH002',N'CHU THỊ MY','0998877288','87','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH003',N'ĐÀO NGỌC HOA','0123888989','90','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH004',N'NGÔ TẤN CƯỜNG','0999929988','45','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH005',N'NGUYỄN THÀNH LONG','0916728993','178','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH006',N'BÙI TẤN PHÁT','0234778900','2','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH007',N'HÀ THỊ NGỌC NHI','0123445678','120','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH008',N'ĐÀO THỊ HỒNG HẠNH','0978671652','45','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH009',N'KHỔNG TÚ QUỲNH','0675676525','5','1')
INSERT INTO KHACHHANG(MaKH,TenKH,SDT,TichDiem,TrangThai) VALUES ('KH010',N'KHÔ KIẾN HUY','0272867546','100','1')

INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC001','VINAMILK','Ho Chi Minh City','0123456789','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC002','AquaFresh Beverages','Ho Chi Minh City','0987654321','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC003','GoldenGrain Foods','Hai Phong','0998877665','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC004','Da Nang Delicious Bites','Da Nang','0123456789','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC005','Nha Trang Flavor Fusion','Nha Trang','0123456789','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC006','Can Tho Culinary Creations','Can Tho','0888777665','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC007','Hue Heavenly Eats','Hue','0123456789','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC008','Vung Tau Vortex Beverages','Vung Tau','0999888777','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC009','Quy Nhon Savory Delicacies','Quy Nhon','0123456789','1')
INSERT INTO NHACUNGCAP(MaNCC,TenNCC,DiaChi,SDT,TrangThai) VALUES ('CC010','Vinh Viva Veggies','Vinh','0777666554','1')

INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH001',N'HÀNG TIÊU DÙNG','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH002',N'THỰC PHẨM ĐÔNG LẠNH','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH003',N'MỸ PHẨM','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH004',N'THỰC PHẨM KHÔ','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH005',N'MẶT HÀNG GIA VỊ','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH006',N'THỰC PHẨM TƯƠI','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH007',N'ĐỒ UỐNG','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH008',N'ĐỒ ĂN NHANH','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH009',N'LƯƠNG THỰC','1')
INSERT INTO LoaiHang(MaLH,TenLH,TrangThai) VALUES ('LH010',N'THỰC PHẨM ĐÓNG HỘP','1')

INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP001',N'THỊT XAY','30000','50000','2023-05-22','2023-11-22','LH006','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP002',N'CÁ','10000','20000','2023-05-22','2023-11-22','LH002','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP003',N'TRỨNG','3500','5000','2023-05-22','2023-11-22','LH004','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP004',N'SỮA HỘP','30000','35000','2023-05-22','2023-11-22','LH007','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP005',N'THỊT BÒ TƯƠI','50000','70000','2023-05-22','2023-11-22','LH006','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP006',N'ĐÙI GÀ','34000','50000','2023-05-22','2023-11-22','LH006','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP007',N'THỊT HEO','50000','65000','2023-05-22','2023-11-22','LH006','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP008',N'DẦU ĂN','25000','58000','2023-05-22','2023-11-22','LH005','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP009',N'MÌ GÓI 3 MIỀN','4500','5000','2023-05-22','2023-11-22','LH008','1')
INSERT INTO SANPHAM(MaSP,TenSP,GiaMua,GiaBan,NSX,HSD,MaLH,TrangThai) VALUES('SP010',N'Kem TƯƠI','3000','5000','2023-05-22','2023-11-22','LH008','1')

INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN001','NV001','CC001','120000', '2023-10-05','1')   
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN002','NV002','CC002','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN003','NV003','CC003','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN004','NV004','CC004','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN005','NV005','CC005','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN006','NV006','CC006','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN007','NV007','CC007','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN008','NV008','CC008','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN009','NV009','CC009','120000', '2023-10-05','1')
INSERT INTO DSPHIEUNHAP(MaPN,MaNV,MaNCC,TongTien,NgayNhap,TrangThai) VALUES ('PN010','NV010','CC010','120000', '2023-10-05','1')

INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN001', 'SP001', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN002', 'SP002', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN003', 'SP003', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN004', 'SP004', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN005', 'SP005', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN006', 'SP006', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN007', 'SP007', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN008', 'SP008', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN009', 'SP009', '45', '200000','1')
INSERT INTO CHITIETPHIEUNHAP(MaPN,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('PN010', 'SP010', '45', '200000','1')

INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP001','10','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP002','200','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP003','30','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP004','456','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP005','55','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP006','66','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP007','76','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP008','85','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP009','95','1')
INSERT INTO KHO(MaSP,Soluong,TrangThai) VALUES ('SP010','100','1')

INSERT INTO KHUYENMAI(MaKM,MucGiam) VALUES ('KM1','0')
INSERT INTO KHUYENMAI(MaKM,MucGiam) VALUES ('KM2','10')
INSERT INTO KHUYENMAI(MaKM,MucGiam) VALUES ('KM3','15')
INSERT INTO KHUYENMAI(MaKM,MucGiam) VALUES ('KM4','20')

INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD001','NV001','KH001','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD002','NV002','KH002','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD003','NV003','KH003','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD004','NV004','KH004','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD005','NV005','KH005','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD006','NV006','KH006','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD007','NV007','KH007','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD008','NV008','KH008','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD009','NV009','KH009','90000','90000','2023-09-10','KM1','1')
INSERT INTO DSHOADON(MaHD,MaNV,MaKH,TongTien,TongTienSauKM,ThoiDiemLap,MaKM,TrangThai) VALUES ('HD010','NV010','KH010','90000','90000','2023-09-10','KM1','1')

INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD001','SP001','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD002','SP002','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD003','SP003','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD004','SP004','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD005','SP005','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD006','SP006','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD007','SP007','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD008','SP008','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD009','SP009','3','60000','1')
INSERT INTO CHITIETHOADON(MaHD,MaSP,SoLuong,ThanhTien,TrangThai) VALUES ('HD010','SP010','3','60000','1')
GO
