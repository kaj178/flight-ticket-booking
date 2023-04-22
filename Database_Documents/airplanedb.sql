-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3307
-- Thời gian đã tạo: Th3 09, 2023 lúc 05:23 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `airplanedb_1`
--


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aircraft`
--

CREATE TABLE `aircraft` (
  `AcID` int(11) NOT NULL COMMENT 'Trường chứa id của máy bay',
  `AcNumber` varchar(50) NOT NULL COMMENT 'Mã số máy bay',
  `Capacity` int(11) NOT NULL COMMENT 'Số lượng ghế của máy bay',
  `MfdCompany` varchar(100) NOT NULL COMMENT 'Công ty chế tạo',
  `MfdDate` datetime NOT NULL COMMENT 'Ngày chế tạo ',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Máy bay';

--
-- Đang đổ dữ liệu cho bảng `aircraft`
--

INSERT INTO `aircraft` (`AcID`, `AcNumber`, `Capacity`, `MfdCompany`, `MfdDate`, `meta`) VALUES
(1, 'A001', 120, 'Boeing', '2020-01-01 00:00:00', ''),
(2, 'A002', 160, 'Airbus', '2019-05-01 00:00:00', ''),
(3, 'A003', 180, 'Embraer', '2018-10-01 00:00:00', ''),
(4, 'A004', 200, 'Bombardier', '2017-12-01 00:00:00', ''),
(5, 'A005', 150, 'Sukhoi', '2016-06-01 00:00:00', ''),
(6, 'A006', 170, 'Comac', '2015-02-01 00:00:00', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airfare`
--

CREATE TABLE `airfare` (
  `AfID` int(11) NOT NULL COMMENT 'id của vé ',
  `Route` int(11) NOT NULL COMMENT 'thông tin chuyến bay',
  `Fare` float NOT NULL COMMENT 'phí dịch vụ',
  `FSC` float NOT NULL COMMENT 'phụ phí nhiên liệu',
  `meta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Vé bay';

--
-- Đang đổ dữ liệu cho bảng `airfare`
--

INSERT INTO `airfare` (`AfID`, `Route`, `Fare`, `FSC`, `meta`) VALUES
(1, 1, 1000000, 100000, 0),
(2, 2, 1500000, 150000, 0),
(3, 3, 2000000, 200000, 0),
(4, 4, 2500000, 250000, 0),
(5, 5, 3000000, 300000, 0),
(6, 6, 3500000, 350000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `branches`
--

CREATE TABLE `branches` (
  `BrID` int(11) NOT NULL COMMENT 'id của chi nhánh',
  `Center` varchar(20) NOT NULL COMMENT 'tên chi nhánh',
  `Address` varchar(50) NOT NULL COMMENT 'địa chỉ của chi nhánh',
  `State` int(11) NOT NULL,
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Chi nhánh';

--
-- Đang đổ dữ liệu cho bảng `branches`
--

INSERT INTO `branches` (`BrID`, `Center`, `Address`, `State`, `meta`) VALUES
(1, 'Hà Nội', 'Số 1 Đại Cồ Việt', 1, ''),
(2, 'TP.Hồ Chí Minh', 'Số 12 Lý Tự Trọng', 2, ''),
(3, 'Đà Nẵng', 'Số 6 Trần Phú', 3, ''),
(4, 'Hải Phòng', 'Số 25 Lạch Tray', 4, ''),
(5, 'Nha Trang', 'Số 10 Trần Phú', 5, ''),
(6, 'Vũng Tàu', 'Số 8 Trần Hưng Đạo', 6, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `charges`
--

CREATE TABLE `charges` (
  `ChID` int(11) NOT NULL COMMENT 'id của phụ phí',
  `Title` varchar(50) NOT NULL COMMENT 'mã phụ phí',
  `Amount` int(11) NOT NULL COMMENT '% phụ phí',
  `Description` varchar(200) DEFAULT NULL COMMENT 'lý do phụ phí',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Phụ phí';

--
-- Đang đổ dữ liệu cho bảng `charges`
--

INSERT INTO `charges` (`ChID`, `Title`, `Amount`, `Description`, `meta`) VALUES
(1, 'PH01', 5, 'Phí dịch vụ hành khách', ''),
(2, 'PH02', 3, 'Phí xếp hành lý', ''),
(3, 'PH03', 2, 'Phí đặt chỗ trước', ''),
(4, 'PH04', 10, 'Phí thay đổi chuyến bay', ''),
(5, 'PH05', 20, 'Phí hủy vé', ''),
(6, 'PH06', 15, 'Phí vận chuyển động vật', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact_details`
--

CREATE TABLE `contact_details` (
  `CnID` int(11) NOT NULL COMMENT 'id của thông tin ',
  `Email` varchar(20) NOT NULL COMMENT 'email',
  `Cell` varchar(20) NOT NULL COMMENT 'điện thoại liên lạc',
  `Tel` varchar(20) DEFAULT NULL COMMENT 'số điện thoại',
  `Street` varchar(50) NOT NULL COMMENT 'địa chỉ ',
  `State` int(11) NOT NULL,
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Thông tin liên lạc hành khách';

--
-- Đang đổ dữ liệu cho bảng `contact_details`
--

INSERT INTO `contact_details` (`CnID`, `Email`, `Cell`, `Tel`, `Street`, `State`, `meta`) VALUES
(1, 'example1@gmail.com', '0987654321', '0123456789', 'Số 1 Đại Cồ Việt', 1, ''),
(2, 'example2@gmail.com', '0912345678', '0234567890', 'Số 12 Lý Tự Trọng', 2, ''),
(3, 'example3@gmail.com', '0901234567', '0345678901', 'Số 6 Trần Phú', 3, ''),
(4, 'example4@gmail.com', '0976543210', '0456789012', 'Số 25 Lạch Tray', 4, ''),
(5, 'example5@gmail.com', '0934567890', '0567890123', 'Số 10 Trần Phú', 5, ''),
(6, 'example6@gmail.com', '0965432109', '0678901234', 'Số 8 Trần Hưng Đạo', 6, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

CREATE TABLE `countries` (
  `CtID` int(11) NOT NULL COMMENT 'id của quốc gia',
  `CountryName` varchar(50) NOT NULL COMMENT 'tên quốc gia',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Quốc gia';

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`CtID`, `CountryName`, `meta`) VALUES
(1, 'Việt Nam', ''),
(2, 'Mỹ', ''),
(3, 'Pháp', ''),
(4, 'Nhật Bản', ''),
(5, 'Trung Quốc', ''),
(6, 'Hàn Quốc', ''),
(7, 'Anh', ''),
(8, 'Nga', ''),
(9, 'Malaysia', ''),
(10, 'Thái Lan', ''),
(11, 'Singapore', ''),
(12, 'Philippines', ''),
(13, 'Indonesia', ''),
(14, 'Canada', ''),
(15, 'Úc', ''),
(16, 'Đức', ''),
(17, 'Tây Ban Nha', ''),
(18, 'Ý', ''),
(19, 'Thụy Điển', ''),
(20, 'Hà Lan', ''),
(21, 'Bỉ', ''),
(22, 'Na Uy', ''),
(23, 'Thụy Sĩ', ''),
(24, 'Ailen', ''),
(25, 'Ba Lan', ''),
(26, 'Áo', ''),
(27, 'Hy Lạp', ''),
(28, 'Bồ Đào Nha', ''),
(29, 'Séc', ''),
(30, 'Nga Ba Lan', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discounts`
--

CREATE TABLE `discounts` (
  `DiID` int(11) NOT NULL COMMENT 'id của mã giảm giá',
  `Title` varchar(50) NOT NULL COMMENT 'mã giảm giá',
  `Amount` int(11) NOT NULL COMMENT '% giảm',
  `Description` varchar(200) NOT NULL COMMENT 'chi tiết giảm giá',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Giảm giá';

--
-- Đang đổ dữ liệu cho bảng `discounts`
--

INSERT INTO `discounts` (`DiID`, `Title`, `Amount`, `Description`, `meta`) VALUES
(1, 'SUMMER2023', 20, 'Mã giảm giá mùa hè 2023', ''),
(2, 'WINTER2023', 15, 'Mã giảm giá mùa đông 2023', ''),
(3, 'SPRING2024', 25, 'Mã giảm giá mùa xuân 2024', ''),
(4, 'FALL2024', 10, 'Mã giảm giá mùa thu 2024', ''),
(5, 'NEWYEAR2025', 30, 'Mã giảm giá đầu năm 2025', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees`
--

CREATE TABLE `employees` (
  `EmpID` int(11) NOT NULL COMMENT 'id của nhân viên',
  `Name` varchar(50) NOT NULL COMMENT 'tên',
  `Address` varchar(50) NOT NULL COMMENT 'địa chỉ',
  `Branch` int(11) NOT NULL COMMENT 'chi nhánh làm việc',
  `Designation` varchar(50) NOT NULL COMMENT 'vị trí',
  `Email` varchar(50) NOT NULL COMMENT 'email',
  `Tel` varchar(20) DEFAULT NULL COMMENT 'số điện thoại',
  `Ext` int(11) DEFAULT NULL COMMENT 'số tủ',
  `meta` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Nhân viên';

--
-- Đang đổ dữ liệu cho bảng `employees`
--

INSERT INTO `employees` (`EmpID`, `Name`, `Address`, `Branch`, `Designation`, `Email`, `Tel`, `Ext`, `meta`) VALUES
(1, 'Nguyễn Vinh Đạt', 'Số 10, Nguyễn Thị Minh Khai, Quận 1, TP. Hồ Chí Mi', 1, 'Nhân viên bán vé', 'nguyenvinhdat@gmail.com', '0987654321', 1, 0),
(2, 'Trần Thị Thu Nhi', 'Số 20, Lê Duẩn, Quận 1, TP. Hồ Chí Minh', 1, 'Nhân viên bán vé', 'tranthithunhi@gmail.com', '0123456789', 2, 0),
(3, 'Lê Trọng Nghĩa', 'Số 5, Nguyễn Trãi, Quận 5, TP. Hồ Chí Minh', 2, 'Quản lý chi nhánh', 'letrongnghia@gmail.com', '0987654321', 3, 0),
(4, 'Phạm Thái Hòa', 'Số 15, Tôn Thất Thuyết, Quận 4, TP. Hồ Chí Minh', 2, 'Nhân viên bán vé', 'phamthaihoa@gmail.com', '0123456789', 4, 0),
(5, 'Vũ Văn Cường', 'Số 30, Hoàng Văn Thụ, Quận Tân Bình, TP. Hồ Chí Mi', 3, 'Nhân viên bán vé', 'vuvancuong@gmail.com', '0987654321', 5, 0),
(6, 'Nguyễn Cao Thái Tú', 'Số 25, Nguyễn Đình Chiểu, Quận 1, TP. Hồ Chí Minh', 3, 'Nhân viên bán vé', 'nguyencaothaitu@gmail.com', '0123456789', 6, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_schedule`
--

CREATE TABLE `flight_schedule` (
  `FlID` int(11) NOT NULL COMMENT 'id của lịch bay',
  `FightDate` datetime NOT NULL COMMENT 'Ngày của chuyến bay',
  `Departure` datetime DEFAULT NULL COMMENT 'Chứa giờ khởi hành của chuyến bay',
  `Arrival` datetime DEFAULT NULL COMMENT 'Thời gian dự kiến đến địa điểm',
  `AirCraft` int(11) NOT NULL COMMENT 'mã của máy bay sẽ cất cánh',
  `NetFare` int(11) NOT NULL COMMENT 'tổng tiền của chuyến bay',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Lịch bay';

--
-- Đang đổ dữ liệu cho bảng `flight_schedule`
--

INSERT INTO `flight_schedule` (`FlID`, `FightDate`, `Departure`, `Arrival`, `AirCraft`, `NetFare`, `meta`) VALUES
(1, '2023-03-15 12:00:00', '2023-03-15 12:00:00', '2023-03-15 14:00:00', 1, 1, ''),
(2, '2023-03-17 10:00:00', '2023-03-17 10:00:00', '2023-03-17 12:30:00', 2, 2, ''),
(3, '2023-03-20 16:30:00', '2023-03-20 16:30:00', '2023-03-20 18:30:00', 3, 3, ''),
(4, '2023-03-22 08:45:00', '2023-03-22 08:45:00', '2023-03-22 11:00:00', 1, 1, ''),
(5, '2023-03-25 15:00:00', '2023-03-25 15:00:00', '2023-03-25 17:30:00', 2, 2, ''),
(6, '2023-03-27 11:30:00', '2023-03-27 11:30:00', '2023-03-27 13:30:00', 3, 3, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `passengers`
--

CREATE TABLE `passengers` (
  `PsID` int(11) NOT NULL COMMENT 'id của hành khách',
  `Name` varchar(50) NOT NULL COMMENT 'tên',
  `Address` varchar(50) NOT NULL COMMENT 'địa chỉ',
  `Age` int(11) NOT NULL COMMENT 'tuổi',
  `Nationalities` varchar(20) NOT NULL COMMENT 'quốc tịch',
  `Contacts` int(11) NOT NULL,
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Hành khách';

--
-- Đang đổ dữ liệu cho bảng `passengers`
--

INSERT INTO `passengers` (`PsID`, `Name`, `Address`, `Age`, `Nationalities`, `Contacts`, `meta`) VALUES
(1, 'Nguyen Chí Thanh', '123 Nguyen Van Cu, Quan 5, TP. Ho Chi Minh', 25, 'Vietnam', 1, ''),
(2, 'Tran Thi Thu Thảo', '456 Tran Hung Dao, Quan 1, TP. Ho Chi Minh', 30, 'Vietnam', 2, ''),
(3, 'John Smith', '123 Main Street, New York, USA', 45, 'USA', 3, ''),
(4, 'Mai Van Hòa', '789 Vo Thi Sau, Quan 3, TP. Ho Chi Minh', 28, 'Vietnam', 4, ''),
(5, 'Maria Garcia', '456 Calle de Alcala, Madrid, Spain', 32, 'Spain', 5, ''),
(6, 'Le Thành Danh', '101 Nguyen Van Troi, Quan Phu Nhuan, TP. Ho Chi Mi', 20, 'Vietnam', 6, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `route`
--

CREATE TABLE `route` (
  `RtID` int(11) NOT NULL COMMENT 'Chứa id của chuyến bay',
  `Airport` varchar(50) NOT NULL COMMENT 'Sân bay',
  `Destination` varchar(50) NOT NULL COMMENT 'Đích đến',
  `RouteCode` varchar(20) NOT NULL COMMENT 'Mã đặc biệt của chuyến bay',
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Chuyến bay';

--
-- Đang đổ dữ liệu cho bảng `route`
--

INSERT INTO `route` (`RtID`, `Airport`, `Destination`, `RouteCode`, `meta`) VALUES
(1, 'Tan Son Nhat', 'Noi Bai', 'TSN-HAN-1', ''),
(2, 'Noi Bai', 'Da Nang', 'HAN-DAD-2', ''),
(3, 'Da Nang', 'Phu Quoc', 'DAD-PQC-3', ''),
(4, 'Phu Quoc', 'Cam Ranh', 'PQC-CXR-4', ''),
(5, 'Cam Ranh', 'Da Lat', 'CXR-DLI-5', ''),
(6, 'Da Lat', 'Nha Trang', 'DLI-NHA-6', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `state`
--

CREATE TABLE `state` (
  `StID` int(11) NOT NULL COMMENT 'id của tiểu bang',
  `StateName` varchar(50) NOT NULL COMMENT 'tên tiểu bang',
  `Country` int(11) NOT NULL,
  `meta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci COMMENT='Tiểu bang';

--
-- Đang đổ dữ liệu cho bảng `state`
--

INSERT INTO `state` (`StID`, `StateName`, `Country`, `meta`) VALUES
(1, 'California', 1, ''),
(2, 'Texas', 1, ''),
(3, 'Florida', 1, ''),
(4, 'New York', 1, ''),
(5, 'Illinois', 1, ''),
(6, 'Pennsylvania', 1, '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`AcID`);

--
-- Chỉ mục cho bảng `airfare`
--
ALTER TABLE `airfare`
  ADD PRIMARY KEY (`AfID`),
  ADD KEY `Route.RtID` (`Route`);

--
-- Chỉ mục cho bảng `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`BrID`);

--
-- Chỉ mục cho bảng `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`ChID`);

--
-- Chỉ mục cho bảng `contact_details`
--
ALTER TABLE `contact_details`
  ADD PRIMARY KEY (`CnID`),
  ADD KEY `State.StID` (`State`);

--
-- Chỉ mục cho bảng `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`CtID`);

--
-- Chỉ mục cho bảng `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`DiID`);

--
-- Chỉ mục cho bảng `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmpID`),
  ADD KEY `Branch.BrID` (`Branch`);

--
-- Chỉ mục cho bảng `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD PRIMARY KEY (`FlID`),
  ADD KEY `AirCraft.AcID` (`AirCraft`),
  ADD KEY `AirFare.AfID` (`NetFare`);

--
-- Chỉ mục cho bảng `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`PsID`),
  ADD KEY `Contact_Details.CnID` (`Contacts`);

--
-- Chỉ mục cho bảng `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`RtID`),
  ADD UNIQUE KEY `RouteCode` (`RouteCode`);

--
-- Chỉ mục cho bảng `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`StID`),
  ADD KEY `Country.CtID` (`Country`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `aircraft`
--
ALTER TABLE `aircraft`
  MODIFY `AcID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Trường chứa id của máy bay', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `airfare`
--
ALTER TABLE `airfare`
  MODIFY `AfID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của vé ', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `branches`
--
ALTER TABLE `branches`
  MODIFY `BrID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của chi nhánh', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `charges`
--
ALTER TABLE `charges`
  MODIFY `ChID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của phụ phí', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `contact_details`
--
ALTER TABLE `contact_details`
  MODIFY `CnID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của thông tin ', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `countries`
--
ALTER TABLE `countries`
  MODIFY `CtID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của quốc gia', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `discounts`
--
ALTER TABLE `discounts`
  MODIFY `DiID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của mã giảm giá', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `employees`
--
ALTER TABLE `employees`
  MODIFY `EmpID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của nhân viên', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `flight_schedule`
--
ALTER TABLE `flight_schedule`
  MODIFY `FlID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của lịch bay', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `passengers`
--
ALTER TABLE `passengers`
  MODIFY `PsID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của hành khách', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `route`
--
ALTER TABLE `route`
  MODIFY `RtID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Chứa id của chuyến bay', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `state`
--
ALTER TABLE `state`
  MODIFY `StID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id của tiểu bang', AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `airfare`
--
ALTER TABLE `airfare`
  ADD CONSTRAINT `Route.RtID` FOREIGN KEY (`Route`) REFERENCES `route` (`RtID`);

--
-- Các ràng buộc cho bảng `contact_details`
--
ALTER TABLE `contact_details`
  ADD CONSTRAINT `State.StID` FOREIGN KEY (`State`) REFERENCES `state` (`StID`);

--
-- Các ràng buộc cho bảng `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `Branch.BrID` FOREIGN KEY (`Branch`) REFERENCES `branches` (`BrID`);

--
-- Các ràng buộc cho bảng `flight_schedule`
--
ALTER TABLE `flight_schedule`
  ADD CONSTRAINT `AirCraft.AcID` FOREIGN KEY (`AirCraft`) REFERENCES `aircraft` (`AcID`),
  ADD CONSTRAINT `AirFare.AfID` FOREIGN KEY (`NetFare`) REFERENCES `airfare` (`AfID`);

--
-- Các ràng buộc cho bảng `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `Contact_Details.CnID` FOREIGN KEY (`Contacts`) REFERENCES `contact_details` (`CnID`);

--
-- Các ràng buộc cho bảng `state`
--
ALTER TABLE `state`
  ADD CONSTRAINT `Country.CtID` FOREIGN KEY (`Country`) REFERENCES `countries` (`CtID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
