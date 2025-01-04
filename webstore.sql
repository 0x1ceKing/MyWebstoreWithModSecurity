-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3307
-- Thời gian đã tạo: Th10 22, 2024 lúc 09:27 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

-- Cấp quyền INSERT, UPDATE, DELETE trên tất cả các bảng của database
GRANT SELECT, INSERT, UPDATE, DELETE ON webstore.* TO 'th1nyunb0y'@'%';
-- Tắt quyền tạo bảng hoặc database
REVOKE CREATE, DROP, ALTER, REFERENCES ON *.* FROM 'th1nyunb0y'@'%';
-- Không cho phép xem danh sách cơ sở dữ liệu khác
REVOKE SHOW DATABASES ON *.* FROM 'th1nyunb0y'@'%';
-- Lưu thay đổi
FLUSH PRIVILEGES;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webstore`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` bigint NOT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `quantity`, `product_id`, `user_id`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 1, 4, 1),
(4, 1, 8, 1),
(5, 2, 5, 1),
(8, 3, 4, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Cây giống hồng'),
(2, 'Hoa quả đặc sản'),
(11, 'Hoa quả miền bắc'),
(12, 'Hoa quả đà lạt'),
(13, 'Hoa quả miền nam'),
(15, 'Hoa quả dược liệu'),
(16, 'Giỏ quà tặng'),
(18, 'Hoa quả giá rẻ'),
(19, 'Nước uống hoa quả');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history_pay`
--

CREATE TABLE `history_pay` (
  `id` bigint NOT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `history_pay`
--

INSERT INTO `history_pay` (`id`, `created_date`, `created_time`, `order_id`, `request_id`, `total_amount`, `invoice_id`) VALUES
(2, '2024-11-08', NULL, '1731033082897', '1731033082897', 310000, 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `import_product`
--

CREATE TABLE `import_product` (
  `id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `import_date` datetime(6) DEFAULT NULL,
  `import_price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `product_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `import_product`
--

INSERT INTO `import_product` (`id`, `description`, `import_date`, `import_price`, `quantity`, `product_id`) VALUES
(1, '<p>nh&acirc;n vi&ecirc;n:oke</p>\n<p>hehe</p>', '2023-10-27 19:00:45.000000', 60000, 480, 1),
(3, '<p>nhập h&agrave;ng</p>', '2023-10-28 08:43:00.000000', 75000, 500, 6),
(4, '<p>nhập h&agrave;ng</p>', '2023-10-28 08:43:11.000000', 80000, 500, 5),
(5, '<p>nhaajpo h&agrave;ng</p>', '2023-10-28 08:43:29.000000', 45000, 500, 4),
(6, '<p>nhập h&agrave;ng</p>', '2023-10-28 08:43:42.000000', 60000, 500, 3),
(8, '<p>gerg</p>\r\n<p>dw</p>', '2024-11-08 17:33:20.751000', 120000, 45, 5),
(9, '<p>gerg</p>\r\n<p>dw</p>', '2024-11-08 17:37:22.001000', 120000, 45, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `instruct`
--

CREATE TABLE `instruct` (
  `id` bigint NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_date` date DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `image_banner` varchar(255) DEFAULT NULL,
  `num_view` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `instruct`
--

INSERT INTO `instruct` (`id`, `content`, `created_date`, `description`, `image_banner`, `num_view`, `title`) VALUES
(1, '<h2><strong>Chuẩn bị đất v&agrave; trồng c&acirc;y</strong></h2>\n<p>Trước ti&ecirc;n cần l&agrave;m ướt đất v&agrave; trộn đều trước khi trồng. Bạn c&oacute; thể tự pha trộn đất trồng với rơm, cỏ kh&ocirc;, ph&acirc;n b&oacute;n, cho tất cả v&agrave;o một th&ugrave;ng gỗ hoặc xe k&uacute;t k&iacute;t rồi trộn đều. Nếu mua t&uacute;i đất hữu cơ b&aacute;n sẵn ngo&agrave;i cửa h&agrave;ng, bạn chỉ cần th&ecirc;m nước v&agrave;o v&agrave; trộn đều ngay trong t&uacute;i trước khi đổ v&agrave;o chậu.</p>\n<p><strong>Đổ đất v&agrave;o chậu v&agrave; tiến h&agrave;nh trồng c&acirc;y</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/16-cham-soc-san-vuon-2.jpg\" alt=\"\"></p>\n<p>&nbsp;</p>\n<h2><strong>Tưới nước</strong></h2>\n<p>Nước rất quan trọng đối với c&acirc;y trồng, kh&ocirc;ng ri&ecirc;ng g&igrave; c&acirc;y cảnh, nếu c&acirc;y thiếu nước sẽ dẫn đến c&acirc;y chết hoặc chậm sinh trưởng. Ch&iacute;nh v&igrave; thế ch&uacute;ng ta n&ecirc;n cung cấp nước đầy đủ để nu&ocirc;i sống c&acirc;y.</p>\n<p>C&acirc;y cảnh b&agrave;y tr&iacute; trong văn ph&ograve;ng th&igrave; lượng nước tưới kh&ocirc;ng n&ecirc;n qu&aacute; nhiều, khi n&agrave;o thấy đất trồng kh&ocirc; th&igrave; tưới nước l&agrave; được. Ngo&agrave;i ra, c&oacute; thể d&ugrave;ng b&igrave;nh phun nước để phun cho c&acirc;y, m&ugrave;a h&egrave; c&oacute; thể phun ng&agrave;y hai lần, m&ugrave;a đ&ocirc;ng th&igrave; ng&agrave;y một lần để tăng cường độ ẩm, l&agrave;m sạch l&aacute;, c&oacute; lợi cho qu&aacute; tr&igrave;nh quang hợp của c&acirc;y, l&agrave;m c&acirc;y xanh tốt.</p>\n<p>T&ugrave;y v&agrave;o k&iacute;ch thước chậu v&agrave; chiều cao c&acirc;y v&agrave; đặc điểm sinh học tường loại c&acirc;y m&agrave; ch&uacute;ng ta cung cấp lượng nước để tưới cho c&acirc;y</p>\n<p>Ph&acirc;n bón: Chọn lựa loại ph&acirc;n bón phù hợp với c&acirc;y tr&ocirc;̀ng cảu bạn. Bón ph&acirc;n theo định kì và chu kí phát tri&ecirc;̉n của c&acirc;y. Hạn ch&ecirc;́ bón các loại ph&acirc;n hóa học và đọc kĩ hướng d&acirc;̃n trước khi dùng. V&igrave; vậy điều quan trọng l&agrave; mua c&acirc;y cảnh, đ&acirc;́t tr&ocirc;̀ng ở nơi đảm bảo uy tính đ&ecirc;̉ c&acirc;y kh&ocirc;ng bị b&ecirc;̣nh</p>\n<p>&nbsp;</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/16-cham-soc-san-vuon(1).jpg\" alt=\"\"></p>\n<p>&nbsp;</p>\n<h3><strong>Lau v&agrave; cắt tỉa l&aacute; v&agrave;ng, vệ sinh chậu kiểng l&aacute;</strong></h3>\n<p>Đối với tất cả c&acirc;y cảnh văn ph&ograve;ng, c&acirc;y cảnh để b&agrave;n l&agrave;m việc th&igrave; kh&ocirc;ng tr&aacute;nh khỏi c&acirc;y c&oacute; hiện tượng l&aacute; v&agrave;ng v&agrave; bụi bẩn. Ch&iacute;nh v&igrave; thế mỗi lần tưới nước chăm s&oacute;c c&acirc;y ch&uacute;ng ta cũng n&ecirc;n quan s&aacute;t tổng thể v&agrave; cắt tỉa l&aacute; v&agrave;ng n&ecirc;n d&ugrave;ng khăn sạch thấm nước lau l&aacute; sạch để c&aacute;c lỗ kh&iacute; khổng tr&ecirc;n l&aacute; dễ d&agrave;ng hấp thu v&agrave; quang hợp được tốt hơn.</p>\n<p>Hầu hết c&aacute;c c&acirc;y đều dễ chăm s&oacute;c n&ecirc;n h&atilde;y ngắt hết hoa kh&ocirc; v&agrave; l&aacute; v&agrave;ng.</p>\n<p>Cắt tỉa hết c&agrave;nh thừa bằng k&eacute;o nếu cần. Bụi bẩn c&oacute; thể b&aacute;m nhanh tr&ecirc;n l&aacute;, kh&ocirc;ng chỉ l&agrave;m cho c&acirc;y kh&ocirc;ng được đẹp mắt m&agrave; c&ograve;n ngăn cản sự ph&aacute;t triển của c&acirc;y. H&atilde;y lau sạch l&aacute; bằng b&ocirc;ng nh&uacute;ng nước</p>\n<p><strong>S&acirc;u bệnh hại</strong></p>\n<p>&nbsp;&nbsp;&nbsp; Trước khi d&ugrave;ng đến h&oacute;a chất mạnh để kiểm so&aacute;t s&acirc;u bệnh, cố gắng loại bỏ c&ocirc;n tr&ugrave;ng bằng c&aacute;ch x&oacute;a sạch ch&uacute;ng tr&ecirc;n c&acirc;y với miếng vải ẩm hoặc bằng nước x&agrave; ph&ograve;ng. D&ugrave;ng thuốc trừ s&acirc;u l&agrave; một biện ph&aacute;p hữu cơ để loại bỏ dịch bệnh tr&ecirc;n c&acirc;y của ban. Thậm ch&iacute; n&oacute; c&ograve;n kiểm so&aacute;t một số nấm tr&ecirc;n c&acirc;y trồng.</p>', '2023-10-27', 'Trước tiên cần làm ướt đất và trộn đều trước khi trồng. Bạn có thể tự pha trộn đất trồng với rơm, cỏ khô, phân bón, cho tất cả vào một thùng gỗ hoặc xe kút kít rồi trộn đều. Nếu mua túi đất hữu cơ bán sẵn ngoài cửa hàng, bạn chỉ cần thêm nước vào và trộn đều ngay trong túi trước khi đổ vào chậu', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698415545/r9p9yqezdoczjdqbfgv0.jpg', 2, 'Hướng dẫn trồng và chăm sóc cây tại nhà'),
(5, '<h1><strong>Hướng dẫn chăm s&oacute;c c&acirc;y xanh trong chậu</strong></h1>\n<p><strong>B&oacute;n ph&acirc;n k&iacute;ch th&iacute;ch</strong></p>\n<p>B&oacute;n ph&acirc;n định k&igrave;: Việc bảo dưỡng cảnh quan th&aacute;ng đầu hay những th&aacute;ng tiếp theo bạn n&ecirc;n b&oacute;n ph&acirc;n định k&igrave; để cỏ v&agrave; c&acirc;y ph&aacute;t triển mỗi th&aacute;ng 1 lần, tuy nhi&ecirc;n sau khi thực hiện nhiều c&ocirc;ng tr&igrave;nh ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn kh&ocirc;ng n&ecirc;n chỉ sử dụng một loại ph&acirc;n ure để b&oacute;n m&agrave; n&ecirc;n xen kẽ ph&acirc;n ure v&agrave; ph&acirc;n vi sinh để c&acirc;y ph&aacute;t triển tốt cũng như cải tạo đất cho l&acirc;u d&agrave;i, bạn c&oacute; thể một th&aacute;ng b&oacute;n ph&acirc;n ure v&agrave; th&aacute;ng sau b&oacute;n ph&acirc;n vi sinh như vậy sẽ kh&ocirc;ng lo c&aacute;c vẫn đề đất dị tho&aacute;i h&oacute;a nữa.&nbsp;</p>\n<p>&nbsp;</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/15-cham-soc-san-vuon.jpg\" alt=\"\"></p>\n<p>&nbsp;</p>\n<h2><strong>Cắt tỉa c&acirc;y định kỳ</strong></h2>\n<p>Tại c&aacute;c nh&agrave; m&aacute;y, khu đ&ocirc; thị cần thường xuy&ecirc;n cắt tỉa c&agrave;nh c&acirc;y xanh để tr&aacute;nh t&igrave;nh trạng g&atilde;y, đổ g&acirc;y ảnh hưởng tới t&iacute;nh mạng con người v&agrave; t&agrave;i sản, ch&iacute;nh do vậy c&acirc;y xanh mỗi năm cần cắt tỉa 1 lần v&agrave; thường v&agrave;o đầu m&ugrave;a mưa.</p>\n<p>Cắt tỉa thảm cỏ định k&igrave;: đối với thảm cỏ hay c&acirc;y hoa l&aacute; m&agrave;u việc cắt tỉa cần thường xuy&ecirc;n để c&acirc;y ra l&aacute; non v&agrave; c&agrave;nh nh&aacute;nh mới k&iacute;ch th&iacute;ch sự ra hoa v&agrave; cho một m&agrave;u xanh tươi hơn, bạn c&oacute; thể cắt cỏ 2 &ndash; 3 th&aacute;ng 1 lần, sau khi cắt cỏ cần b&oacute;n ph&acirc;n k&iacute;ch th&iacute;ch để cỏ ra l&aacute; mới nhanh hơn.</p>\n<h2><strong>Tưới nước</strong></h2>\n<p>Do trồng trong bồn n&ecirc;n c&acirc;y sẽ nhanh kh&ocirc; v&agrave; cần được tưới nước thường xuy&ecirc;n trong ng&agrave;y. Để biết khi n&agrave;o c&acirc;y cần nước, h&atilde;y &aacute;p ng&oacute;n tay bạn v&agrave;o nền đất trong chậu, nếu tay kh&ocirc; nghĩa l&agrave; c&acirc;y đang cần nước, khi đ&oacute; h&atilde;y tưới.</p>\n<p>&nbsp;</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/15-cham-soc-san-vuon-2.jpg\" alt=\"\"></p>\n<p>&nbsp;</p>\n<p>Nhiều người l&agrave;m vườn nghĩ rằng n&ecirc;n tưới nước c&agrave;ng nhiều c&agrave;ng tốt, tuy nhi&ecirc;n đ&acirc;y lại l&agrave; một quan niệm sai lầm. Việc tưới nước sẽ cuốn tr&ocirc;i lớp dinh dưỡng tr&ecirc;n bề mặt đất trồng, nguồn thức ăn của c&acirc;y sẽ theo đ&oacute; m&agrave; nhanh ch&oacute;ng cạn kiệt. Để b&ugrave; đắp lại lượng dinh dưỡng bị mất đi, c&acirc;y trồng phải được b&oacute;n ph&acirc;n theo quy tr&igrave;nh v&agrave; chu kỳ nhất định trong suốt qu&aacute; tr&igrave;nh sinh trưởng.</p>\n<p><strong>Thường xuy&ecirc;n dọn dẹp l&aacute; rụng v&agrave; r&aacute;c&nbsp;</strong></p>\n<p>Trong suốt m&ugrave;a đ&ocirc;ng, c&acirc;y cỏ vẫn cần được tiếp x&uacute;c với &aacute;nh nắng mặt trời. Dọn sạch những c&agrave;nh l&aacute; rụng v&agrave; r&aacute;c vụn để đảm bảo rằng c&acirc;y cỏ nhận đủ &aacute;nh s&aacute;ng v&agrave; kh&ocirc;ng kh&iacute;. Bệnh tật v&agrave; nấm mốc rất phổ biến trong m&ugrave;a đ&ocirc;ng, nhất l&agrave; khi l&aacute; c&acirc;y v&agrave; r&aacute;c rơi đầy tr&ecirc;n b&atilde;i cỏ. Nếu để t&uacute;i đựng r&aacute;c, th&ugrave;ng r&aacute;c hay c&aacute;c vật nặng kh&aacute;c l&ecirc;n cỏ trong một thời gian d&agrave;i sẽ g&acirc;y hậu quả nghi&ecirc;m trọng đến sự ph&aacute;t triển của c&acirc;y cỏ.</p>\n<h3><strong>Biện ph&aacute;p phục hồi c&acirc;y bị kh&ocirc; h&eacute;o</strong></h3>\n<p>Khi ph&aacute;t hiện c&acirc;y c&oacute; hiện tượng v&agrave;ng &uacute;a, kh&ocirc; h&eacute;o, rụng l&aacute;&hellip; th&igrave; phải kịp thời c&oacute; những biện ph&aacute;p chăm s&oacute;c gi&uacute;p c&acirc;y hồi phục lại sức sống. Kh&ocirc;ng n&ecirc;n cho &aacute;nh s&aacute;ng mặt trời trực tiếp chiếu xạ v&agrave;o c&acirc;y để tr&aacute;nh l&agrave;m cho sức n&oacute;ng của &aacute;nh nắng g&acirc;y ảnh hưởng bất lợi đến c&acirc;y xanh hoặc c&oacute; thể l&agrave;m cho c&acirc;y chết do bị mất nước. Nơi chăm s&oacute;c c&acirc;y phải l&agrave; nơi m&aacute;t mẻ, kh&ocirc;ng kh&iacute; trong l&agrave;nh v&agrave; n&ecirc;n tr&aacute;nh gi&oacute; mạnh</p>\n<p>Trong thời gian đầu nu&ocirc;i dưỡng c&acirc;y th&igrave; kh&ocirc;ng n&ecirc;n t&aacute;c động v&agrave;o đất trồng bởi l&uacute;c n&agrave;y c&aacute;c tổ chức v&agrave; chức năng của c&acirc;y ở trang th&aacute;i tĩnh, nếu động thổ sẽ l&agrave;m cho hệ rễ c&acirc;y bị tổn thương. V&agrave;o thời gian n&agrave;y chỉ n&ecirc;n cắt bỏ c&aacute;c l&aacute; v&agrave;ng &uacute;a, kh&ocirc; h&eacute;o, tưới nước đầy đủ, đồng thời c&oacute; thể h&ograve;a đạm, l&acirc;n v&agrave;o nước với nồng độ vừa phải để tưới cho c&acirc;y, mỗi tuần một lần, sau mỗi th&aacute;ng th&igrave; sẽ tăn dần lượng, cụ thể khoảng 2-3 th&aacute;ng sẽ tăng nồng độ.Đợi đến khi c&acirc;y c&oacute; sức sống trở lại th&igrave; thay đổi đất trồng, tốt nhất l&agrave; d&ugrave;ng đất mục, đất đồi, đất vi sinh v&agrave; đất ph&ugrave; sa để trồng, n&ecirc;n b&oacute;n l&oacute;t ph&acirc;n trước khi trồng c&acirc;y.</p>\n<p><span style=\"color: #000000; font-family: Arial, Helvetica, sans-serif, tinos;\">DỊCH VỤ CHĂM S&Oacute;C S&Acirc;N VƯỜN - 0901.222.767</span></p>', '2023-10-27', 'Bón phân định kì: Việc bảo dưỡng cảnh quan tháng đầu hay những tháng tiếp theo bạn nên bón phân định kì để cỏ và cây phát triển mỗi tháng 1 lần, tuy nhiên sau khi thực hiện nhiều công trình chúng tôi khuyên bạn không nên chỉ sử dụng một loại phân ure để bón mà nên xen kẽ phân ure và phân vi sinh để cây phát triển tốt cũng như cải tạo đất cho lâu dài, bạn có thể một tháng bón phân ure và tháng sau bón phân vi sinh như vậy sẽ không lo các vẫn đề đất dị thoái hóa nữ', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698415710/uddazz9c64djobvcq0bt.jpg', 0, 'Hướng dẫn chăm sóc cây xanh trong chậu'),
(6, '<p>C&acirc;y bonsai l&agrave; loại c&acirc;y cảnh m&agrave; được rất nhiều người ưa chuộng, lựa chọn để trang tr&iacute; cho s&acirc;n vườn v&agrave; trang tr&iacute; cả b&ecirc;n trong nội thất. Điều gi&uacute;p cho nhiều gia chủ tin tưởng l&agrave; bởi v&igrave; n&oacute; kh&ocirc;ng chỉ mang trong m&igrave;nh một vẻ đẹp nghệ thuật m&agrave; c&ograve;n đem lại sự sang trọng v&agrave; độc đ&aacute;o. Nhưng khi trồng những loại c&acirc;y bonsai n&agrave;y bạn n&ecirc;n lưu &yacute; c&aacute;ch nu&ocirc;i dưỡng v&igrave; c&acirc;y thường rất kh&oacute; nu&ocirc;i. B&agrave;i viết dưới đ&acirc;y ch&uacute;ng t&ocirc;i sẽ hướng dẫn bạn một số phương ph&aacute;p&nbsp;<strong>chăm s&oacute;c c&acirc;y bonsai</strong>&nbsp;hiệu quả, h&atilde;y ch&uacute;ng t&ocirc;i xem qua nh&eacute;!</p>\n<h2><strong>1. Cung cấp đầy đủ &aacute;nh s&aacute;ng</strong></h2>\n<p>Để c&acirc;y cảnh bonsai đẹp c&oacute; thể duy tr&igrave; v&agrave; ph&aacute;t triển tốt th&igrave; cần được cung cấp đủ &aacute;nh s&aacute;ng. Bởi v&igrave; thiếu &aacute;nh s&aacute;ng c&acirc;y sẽ rất dễ bị kh&ocirc; h&eacute;o v&agrave; nhanh chết. Điều quan trọng l&agrave; cần phải thường xuy&ecirc;n phun sương cho c&acirc;y, tốt nhất n&ecirc;n bố tr&iacute; c&acirc;y ngo&agrave;i s&acirc;n v&agrave;o ban đ&ecirc;m để thuận lợi cho qu&aacute; tr&igrave;nh h&ocirc; hấp. Trồng c&acirc;y ở nơi c&oacute;&nbsp;nhiệt độ tối thiểu l&agrave; 60 độ F (15.5 độ C)&nbsp;gi&uacute;p c&acirc;y t&aacute;i tạo v&agrave; ph&aacute;t triển b&igrave;nh thường.</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/0901_222_767%20(3).png\" alt=\"anh-cay-bon-sai-san-vuon\"></p>\n<p><em>(Nguồn: Pinterest)</em></p>\n<h2><strong>2. Tưới nước cho c&acirc;y bonsai</strong></h2>\n<p>Thường xuy&ecirc;n kiểm tra v&agrave; cung cấp đủ độ ẩm cho c&acirc;y, hạn chế để đất qu&aacute; kh&ocirc; hạn, n&ecirc;n tưới nước&nbsp;h&agrave;ng ng&agrave;y v&agrave;o l&uacute;c b&igrave;nh minh hoặc chiều tối. Kh&ocirc;ng n&ecirc;n tưới qu&aacute; nhanh, h&atilde;y để nước chảy chậm r&atilde;i ngấm từ từ v&agrave;o đất v&agrave; xuống rễ, sau đ&oacute; d&ugrave;ng v&ograve;i tưới ẩm phun l&ecirc;n c&agrave;nh v&agrave; l&aacute; c&acirc;y.</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/13.png\" alt=\"anh-tieu-canh-cay-bon-sai\"></p>\n<p><em>(Nguồn: Pinterest)</em></p>\n<h2><strong>3. Thay chậu định kỳ</strong></h2>\n<p>C&acirc;y bonsai trồng 1 thời gian sẽ dần lớn l&ecirc;n, rễ v&agrave; c&agrave;nh l&aacute; ng&agrave;y c&agrave;ng to ra v&agrave; xum xu&ecirc;. Tốt nhất n&ecirc;n thay chậu cho c&acirc;y định kỳ 2 năm/lần v&agrave; n&ecirc;n thực hiện v&agrave;o m&ugrave;a xu&acirc;n. Lưu &yacute;: Khi thay n&ecirc;n cắt bớt 1/3 rễ, đảm bảo chậu rộng r&atilde;i v&agrave; c&oacute; hệ thống tho&aacute;t nước tốt, v&igrave; c&acirc;y ng&acirc;m trong nước sẽ dễ dẫn đến hiện tượng ngập &uacute;ng.</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/12.png\" alt=\"anh-chau-cay-bon-sai\"></p>\n<p><em>(Nguồn: Pinterest)</em></p>\n<h2><strong>4. Ph&ograve;ng trừ s&acirc;u bệnh cho bonsai</strong></h2>\n<p>Thường xuy&ecirc;n cắt tỉa những c&agrave;nh c&acirc;y yếu, l&aacute; v&agrave;ng hoặc c&oacute; nguy cơ bị s&acirc;u bọ tấn c&ocirc;ng để tr&aacute;nh l&acirc;y nhiễm bệnh cho c&acirc;y. Cần quan s&aacute;t theo d&otilde;i nếu c&acirc;y c&oacute; dấu hiệu lạ, s&acirc;u bệnh, n&ecirc;n phun thuốc hoặc li&ecirc;n hệ đến c&aacute;c đơn vị chuy&ecirc;n nghiệp để c&oacute; giải ph&aacute;p đặt trị ngay. C&aacute;c loại c&ocirc;n tr&ugrave;ng thường g&acirc;y hại cho c&acirc;y l&agrave;: s&acirc;u bướm, nhện đỏ, rệp vừng,&hellip;</p>\n<p><img src=\"https://chamsocsanvuon.vn/data/images/6(2).png\" alt=\"anh-cham-soc-cay-bon-sai\"></p>\n<p><em>(Nguồn:&nbsp;</em><em>dịch vụ chăm s&oacute;c c&acirc;y bonsai tại NIS Landscape)</em></p>\n<p>Qua b&agrave;i viết tr&ecirc;n c&aacute;c bạn đ&atilde; biết được một số phương ph&aacute;p&nbsp;<strong>chăm s&oacute;c c&acirc;y bonsai</strong>&nbsp;hiệu quả c&oacute; thể sẽ gi&uacute;p &iacute;ch cho c&acirc;y cảnh s&acirc;n vườn của gia đ&igrave;nh. Nếu bạn đang cần một đơn vị chăm s&oacute;c cảnh quan s&acirc;n vườn n&oacute;i chung v&agrave; c&acirc;y xanh n&oacute;i ri&ecirc;ng th&igrave;&nbsp;<strong>NIS LANDSCAPE</strong>&nbsp;sẽ gi&uacute;p bạn l&agrave;m điều đ&oacute;. H&atilde;y li&ecirc;n hệ ngay với ch&uacute;ng t&ocirc;i qua số điện thoại&nbsp;<strong>0943.888.767</strong> để được tư vấn miễn ph&iacute; nh&eacute;! Cảm ơn c&aacute;c bạn đ&atilde; xem qua b&agrave;i viết!</p>', '2023-10-27', 'Cây bonsai là loại cây cảnh mà được rất nhiều người ưa chuộng, lựa chọn để trang trí cho sân vườn và trang trí cả bên trong nội thất. Điều giúp cho nhiều gia chủ tin tưởng là bởi vì nó không chỉ mang trong mình một vẻ đẹp nghệ thuật mà còn đem lại sự sang trọng và độc đáo. Nhưng khi trồng những loại cây bonsai này bạn nên lưu ý cách nuôi dưỡng vì cây thường rất khó nuôi. Bài viết dưới đây chúng tôi sẽ hướng dẫn bạn một số phương pháp chăm sóc cây bonsai hiệu quả, hãy chúng tôi xem qua nhé!', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698415781/xfkdzvizr4ow15wzsgao.png', 2, 'PHƯƠNG PHÁP CHĂM SÓC CÂY BONSAI HIỆU QUẢ'),
(7, '<p class=\"tandan-p-article-news-summary\">Những năm gần đ&acirc;y, diện t&iacute;ch c&acirc;y ăn quả tr&ecirc;n địa b&agrave;n huyện Quảng Xương c&oacute; xu hướng gia tăng cả về chủng loại v&agrave; phạm vi trồng, theo thống k&ecirc; t&iacute;nh đến năm 2022 to&agrave;n huyện c&oacute; tổng diện t&iacute;ch trồng c&acirc;y ăn quả đạt gần 500ha; đ&acirc;y l&agrave; loại c&acirc;y trồng c&oacute; lợi thế, được x&aacute;c định l&agrave; một trong những sản phẩm n&ocirc;ng nghiệp chủ lực của huyện. B&ecirc;n cạnh đ&oacute;, biến đổi kh&iacute; hậu l&agrave;m thay đổi quy luật thời tiết; việc h&igrave;nh th&agrave;nh những v&ugrave;ng c&acirc;y ăn quả tập trung, tr&ecirc;n phạm vi rộng lớn tạo điều kiện thuận lợi cho nhiều đối tượng s&acirc;u bệnh ph&aacute;t sinh g&acirc;y hại v&agrave; c&oacute; nguy cơ g&acirc;y thiệt hại lớn cho người sản xuất.</p>\n<p class=\"tandan-p-article-main\">&nbsp;</p>\n<div id=\"ctl00_PlaceHolderMain_ctl03__ControlWrapper_RichHtmlField\" class=\"ms-rtestate-field\" aria-labelledby=\"ctl00_PlaceHolderMain_ctl03_label\">\n<p>Để hạn chế thiệt hại do s&acirc;u bệnh g&acirc;y ra, ph&aacute;t huy hết tiềm năng năng suất, chất lượng c&acirc;y ăn quả, nhằm n&acirc;ng cao thu nhập cho người d&acirc;n v&agrave; bảo vệ sức khỏe cộng đồng. Trung t&acirc;m dịch vụ N&ocirc;ng nghiệp huyện đưa ra một số biện ph&aacute;p kỹ thuật trồng v&agrave; chăm s&oacute;c c&acirc;y ăn quả như sau:</p>\n<p>Kỹ thuật trồng: Chọn khu đất c&oacute; tầng canh t&aacute;c d&agrave;y, tơi xốp, ti&ecirc;u tho&aacute;t nước thuận lợi. T&ugrave;y v&agrave;o địa h&igrave;nh cao hay thấp để bố tr&iacute; hệ thống mương ti&ecirc;u tho&aacute;t nước cho ph&ugrave; hợp. Khi trồng x&aacute;c định mật độ khoảng c&aacute;ch hợp l&yacute; h&agrave;ng x h&agrave;ng: 4-5m, c&acirc;y x c&acirc;y: 4-5m; Đ&agrave;o hố k&iacute;ch thước 40x40x40 hoặc 60x60x60, xử l&yacute; hố bằng hỗn hợp thuốc BVTV trừ nấm + vi khuẩn trước khi trồng; sau đ&oacute; b&oacute;n l&oacute;t đầy đủ bằng ph&acirc;n chuồng hoai mục, ph&acirc;n hữu cơ vi sinh(nếu c&oacute;) kết hợp ph&acirc;n super l&acirc;n hoặc ph&acirc;n l&acirc;n nung chảy, to&agrave;n bộ hốn hợp ph&acirc;n b&oacute;n l&oacute;t trộn đều với lớp đất mặt sau đ&oacute; lấp đầy hố trở lại, c&ocirc;ng việc n&agrave;y phải ho&agrave;n thiện trước khi đặt c&acirc;y giống 15-20 ng&agrave;y trước khi trồng.</p>\n<p>Y&ecirc;u cầu c&acirc;y giống phải c&oacute; nguồn gốc r&otilde; r&agrave;ng, được cung cấp bởi cơ sở uy t&iacute;n chất lượng, c&acirc;y giống khỏe, sạch s&acirc;u bệnh, bộ l&aacute; xanh tốt; trồng c&acirc;y v&agrave;o th&aacute;ng 3-4 v&agrave; th&aacute;ng 8-10 dương lịch, l&uacute;c n&agrave;y thời tiết m&aacute;t mẻ, kh&ocirc; r&aacute;o, &iacute;t mưa thuận lợi cho c&acirc;y trồng đ&acirc;m chối nảy lộc; khi trồng cần đặt c&acirc;y ở vị tr&iacute; trung t&acirc;m hố, sau đ&oacute; lấp đất vừa bằng cổ rễ hoặc cao hơn 2-3cm, trồng xong d&ugrave;ng cỏ mục hoặc rơm rạ kh&ocirc; che phủ gốc (lưu &yacute; c&aacute;ch gốc c&acirc;y 10-15cm để tr&aacute;nh s&acirc;u bệnh x&acirc;m nhập, sau trồng thường xuy&ecirc;n thăm vườn, kịp thời trồng dặm c&acirc;y chết, c&acirc;y c&oacute; biểu hiện sinh trưởng ph&aacute;t triển k&eacute;m, đảm bảo mật độ trồng).</p>\n<p><img src=\"https://quangxuong.thanhhoa.gov.vn/portal/Photos/2023-02-11/106dffe2c1f733dd1%20(1).jpg\" alt=\"\"></p>\n<p>H&igrave;nh ảnh c&aacute;n bộ trung t&acirc;m DVNN huyện hướng dẫn kỹ thuật bao tr&aacute;i tr&ecirc;n c&acirc;y ăn quả cho b&agrave; con</p>\n<p>Sau khi trồng xong tỉa bớt l&aacute;, tưới nước, d&ugrave;ng odoa hoặc đ&agrave;o r&atilde;nh xung quanh tưới nhẹ nh&agrave;ng; tưới nước thường xuy&ecirc;n giữ ẩm trong v&ograve;ng 20 ng&agrave;y đến 1 th&aacute;ng để c&acirc;y ho&agrave;n to&agrave;n b&eacute;n rễ v&agrave; phục hồi. Sau đ&oacute;, tuỳ thời tiết nắng mưa để chống hạn hoặc chống &uacute;ng cho c&acirc;y.</p>\n<p>&nbsp;Chăm s&oacute;c thời kỳ kiến thiết cơ bản (KTCB) l&agrave; giai đoạn từ khi trồng đến khi c&acirc;y ra hoa đậu tr&aacute;i, đồng thời kiến thiết n&ecirc;n bộ khung t&aacute;n cho c&acirc;y (1-2 năm sau trồng). Kh&acirc;u kỹ thuật quan trọng trong giai đoạn n&agrave;y l&agrave; cắt tỉa tạo t&aacute;n.</p>\n<p>Cắt tỉa tạo bộ khung, t&aacute;n:&nbsp; Khi c&acirc;y đạt chiều cao, bấm ngọn tạo c&agrave;nh cấp 1, bấm ngọn c&agrave;nh cấp 1, tạo c&agrave;nh cấp 2. Tiếp tục tạo t&aacute;n ở giai đoạn KTCB, chỉ để lại 3 - 4 c&agrave;nh cấp 1 ph&acirc;n bố tương đối đều về c&aacute;c hướng. C&aacute;c c&agrave;nh cấp 1 n&agrave;y thường chọn &nbsp;c&agrave;nh khoẻ, &iacute;t cong queo, khung t&aacute;n đều v&agrave; th&ocirc;ng tho&aacute;ng. Tr&ecirc;n c&agrave;nh cấp 1 chỉ giữ lại 3 c&agrave;nh cấp 2 ph&acirc;n bố hợp l&yacute; về g&oacute;c độ v&agrave; hướng. C&agrave;nh cấp 3 l&agrave; những c&agrave;nh tạo quả v&agrave; mang quả cho những năm sau. C&aacute;c c&agrave;nh n&agrave;y phải khống chế để ch&uacute;ng kh&ocirc;ng giao nhau v&agrave; sắp xếp theo c&aacute;c hướng kh&aacute;c nhau gi&uacute;p c&acirc;y quang hợp được tốt; ch&uacute; &yacute; thời kỳ KTCB,&nbsp;nếu c&acirc;y ra hoa, quả th&igrave; tỉa bỏ để c&acirc;y tập trung dinh dưỡng tạo khung t&aacute;n.</p>\n<p>B&oacute;n ph&acirc;n thời kỳ KTCB: B&oacute;n l&oacute;t ph&acirc;n hữu cơ hoai mục hoặc ph&acirc;n vi sinh, ph&acirc;n l&acirc;n, v&ocirc;i bột; b&oacute;n th&uacute;c NPK 16-16-8, 13-13-13+TE, Kcl, Ure.</p>\n<p>C&aacute;ch b&oacute;n: Năm thứ nhất b&oacute;n 4 lần/năm, lượng b&oacute;n 200gNPK 16-16-8 + 50gKcl/c&acirc;y; Năm thứ hai b&oacute;n 4 lần/năm, lượng b&oacute;n 400gNPK 16-16-8 + 100gUre + 100gKcl/c&acirc;y; Năm thứ 3 sau thu hoạch tỉa sửa nh&aacute;nh, xới đất b&oacute;n th&uacute;c để c&acirc;y ra chồi, lượng b&oacute;n 300g NPK 16-16-8 + 100gUre + 100gKcl + 10-15kg ph&acirc;n chuồng hoai mục/c&acirc;y (lưu &yacute;, v&ugrave;ng đất chua d&ugrave;ng th&ecirc;m v&ocirc;i bột hoặc chế phẩm n&acirc;ng PH, lượng ph&acirc;n b&oacute;n cung cấp cần gia tăng dần khi c&acirc;y lớn, lượng ph&acirc;n b&oacute;n tuỳ theo tuổi của c&acirc;y). Ở giai đoạn kiến thiết cơ bản n&ecirc;n ng&acirc;m ph&acirc;n để tưới, c&acirc;y từ 1- 3 năm sau khi trồng&nbsp; chưa c&oacute; quả; mỗi năm b&oacute;n 4 lần v&agrave;o th&aacute;ng 2, th&aacute;ng 5 th&aacute;ng 8 v&agrave; th&aacute;ng 11.</p>\n<p><img src=\"https://quangxuong.thanhhoa.gov.vn/portal/Photos/2023-02-11/5f0f9f8df8f3d75d1%20(2).jpg\" alt=\"\"></p>\n<p>H&igrave;nh ảnh vườn Bưởi diễn trước m&ugrave;a thu hoạch</p>\n<p>&nbsp;Chăm s&oacute;c thời kỳ kinh doanh: Đ&acirc;y l&agrave; thời kỳ c&acirc;y từ năm thứ 3 trở đi, bắt đầu cho tr&aacute;i ổn định. Cần thực hiện cắt tỉa h&agrave;ng năm, gi&uacute;p c&acirc;n bằng sinh trưởng cho c&acirc;y, cắt tỉa tất cả c&aacute;c c&agrave;nh s&acirc;u bệnh, c&agrave;nh chết, c&agrave;nh vượt, những c&agrave;nh qu&aacute; d&agrave;y, cắt tỉa bớt c&agrave;nh cấp 1,sao cho c&acirc;y c&oacute; bộ khung t&aacute;n c&acirc;n đối; đối với c&agrave;nh thu, cắt bỏ những c&agrave;nh yếu, mọc qu&aacute; d&agrave;y. Tr&ecirc;n c&acirc;y chỉ giữ lại 1 số c&agrave;nh tốt mọc từ th&acirc;n, cho tr&aacute;i đều, hướng đầy đủ &aacute;nh s&aacute;ng. Như vậy c&acirc;y thường thấp v&agrave; c&oacute; t&aacute;n c&acirc;n đối. C&ocirc;ng việc cắt tỉa cần được tiến h&agrave;nh khi thời tiết m&aacute;t mẻ, kh&ocirc; r&aacute;o.</p>\n<p>C&aacute;ch b&oacute;n ph&acirc;n thời kỳ kinh doanh: Lượng b&oacute;n tăng dần theo độ tuổi: từ 05-3kg/c&acirc;y/lần b&oacute;n. Mỗi năm bổ sung th&ecirc;m 15-30kg ph&acirc;n chuồng hoai mục (hoặc 5-10kg ph&acirc;n hữu cơ vi sinh)/c&acirc;y. B&oacute;n v&agrave;o 5 giai đoạn: giai đoạn sau thu hoạch: b&oacute;n 25% đạm + 25% l&acirc;n + 10-30 kg hữu cơ/gốc/năm; bốn tuần trước khi c&acirc;y ra hoa: b&oacute;n 25% đạm + 50% l&acirc;n + 25% kali; sau khi đậu quả: b&oacute;n 25% đạm + 25% l&acirc;n + 25% kali; giai đoạn quả ph&aacute;t triển: b&oacute;n 25% đạm + 25% kali; một th&aacute;ng trước thu hoạch: b&oacute;n 25% kali; n&ecirc;n b&oacute;n bổ sung từ 0,5-1kg ph&acirc;n Ca(NO3)2/c&acirc;y/năm v&agrave;o c&aacute;c giai đoạn sau thu họach, trước khi trổ hoa v&agrave; sau đậu tr&aacute;i; c&oacute; thể phun ph&acirc;n b&oacute;n l&aacute; tối đa kh&ocirc;ng qu&aacute; 3 lần/vụ tr&aacute;i, mỗi lần c&aacute;ch nhau &iacute;t nhất 30 ng&agrave;y v&agrave; đảm bảo thời gian c&aacute;ch ly trước khi thu hoạch. Kh&ocirc;ng phun ph&acirc;n b&oacute;n l&aacute; v&agrave;o m&ugrave;a mưa v&igrave; l&agrave;m c&acirc;y dễ nhiễm nấm bệnh như Lo&eacute;t, Mốc hồng, Đốm rong.</p>\n<p><img src=\"https://quangxuong.thanhhoa.gov.vn/portal/Photos/2023-02-11/87aeb76724808a2d1%20(3).jpg\" alt=\"\"></p>\n<p>H&igrave;nh ảnh vườn c&acirc;y ăn quả</p>\n<p>Ph&ograve;ng trừ s&acirc;u bệnh hại:&nbsp;Cần thường xuy&ecirc;n thăm vườn c&acirc;y, ph&aacute;t hiện v&agrave; ph&ograve;ng trừ kịp thời c&aacute;c đối tượng s&acirc;u bệnh hại bằng c&aacute;ch thực hiện biện ph&aacute;p ph&ograve;ng trừ dịch hại tổng hợp IPM tr&ecirc;n c&acirc;y ăn quả hợp l&yacute;, kết hợp sử dụng bộ thuốc BVTV chuy&ecirc;n d&ugrave;ng tr&ecirc;n c&acirc;y ăn quả khi s&acirc;u bệnh đến ngưỡng g&acirc;y hại kinh tế, nằm trong danh mục thốc BVTV được ph&eacute;p sử dụng tại Việt Nam. Đặc biệt quan t&acirc;m v&agrave;o m&ugrave;a nắng n&oacute;ng kh&ocirc; hạn ch&uacute; &yacute; một số đối tượng như: Bọ x&iacute;t; Bọ trĩ; Nhện; Rệp s&aacute;p; Rầy mềm; s&acirc;u đục th&acirc;n (x&eacute;n t&oacute;c);... c&aacute;c loại bệnh do nấm + vi khuẩn g&acirc;y ra; v&agrave;o m&ugrave;a mưa thường xuất hiện một số đối tượng s&acirc;u bệnh hại do nấm + vi khuẩn g&acirc;y hại (Bệnh đốm l&aacute; vi khuẩn; Lo&eacute;t th&acirc;n, c&agrave;nh; Ch&aacute;y b&igrave;a l&aacute;; Th&aacute;n thư,...); việc phun thuốc BVTV cần tu&acirc;n thủ theo nguy&ecirc;n tắc &ldquo;4 đ&uacute;ng&rdquo;.</p>\n<p>Bảo quản tr&aacute;i c&acirc;y: Để tăng chất lượng mẫu m&atilde;, ngăn ngừa s&acirc;u bệnh hại, b&agrave; con c&oacute; thể &aacute;p dụng biện ph&aacute;p bao quả chuy&ecirc;n dụng để bao quả từ khi quả c&ograve;n nhỏ.</p>\n</div>', '2023-10-27', 'Những năm gần đây, diện tích cây ăn quả trên địa bàn huyện Quảng Xương có xu hướng gia tăng cả về chủng loại và phạm vi trồng, theo thống kê tính đến năm 2022 toàn huyện có tổng diện tích trồng cây ăn quả đạt gần 500ha; đây là loại cây trồng có lợi thế, được xác định là một trong những sản phẩm nông nghiệp chủ lực của huyện. Bên cạnh đó, biến đổi khí hậu làm thay đổi quy luật thời tiết; việc hình thành những vùng cây ăn quả tập trung, trên phạm vi rộng lớn tạo điều kiện thuận lợi cho nhiều đối tượng sâu bệnh phát sinh gây hại và có nguy cơ gây thiệt hại lớn cho người sản xuất.', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698415838/rv5bjj1kjryfhggh8ffp.jpg', 7, 'Hướng dẫn biện pháp kỹ thuật trồng và chăm sóc cây ăn quả');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time(6) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `pay_type` enum('COD','PAYMENT_ONLINE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice`
--

INSERT INTO `invoice` (`id`, `address`, `created_date`, `created_time`, `note`, `phone`, `receiver_name`, `total_amount`, `status_id`, `user_id`, `pay_type`) VALUES
(22, 'Trường chinh, Hai bà trưng, Hà nội', '2024-11-08', '09:32:00.272000', 'gẻgr', '0932478234', 'Trần Văn Hiếu', 310000, 3, 3, 'PAYMENT_ONLINE'),
(23, '21 A trương định, Hà nội', '2024-11-08', '10:06:26.085000', '', '0932478234', 'Trần Văn Hiếu', 750000, 2, 3, 'COD');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoice_detail`
--

CREATE TABLE `invoice_detail` (
  `id` bigint NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `invoice_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `invoice_detail`
--

INSERT INTO `invoice_detail` (`id`, `price`, `quantity`, `invoice_id`, `product_id`) VALUES
(5, 250000, 1, 22, 4),
(6, 60000, 1, 22, 3),
(7, 250000, 3, 23, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `image_banner` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `quantity_sold` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `code`, `created_date`, `deleted`, `description`, `image_banner`, `name`, `price`, `quantity`, `quantity_sold`, `category_id`) VALUES
(1, 'TBB-TL', '2023-10-27 16:55:48.000000', b'0', '<p>Giỏ qu&agrave; hoa quả nhập khẩu - TC20 kh&ocirc;ng chỉ l&agrave; m&oacute;n qu&agrave; tượng trưng m&agrave; n&oacute; c&ograve;n mang &yacute; nghĩa thiết thực cho sức khỏe. Khi cuộc sống ng&agrave;y c&agrave;ng hiện đại, con người ta ng&agrave;y c&agrave;ng ch&uacute; t&acirc;m hơn đến việc sống xanh, sống khỏe th&igrave; m&oacute;n qu&agrave; hộp tr&aacute;i c&acirc;y l&agrave; v&ocirc; c&ugrave;ng hợp l&yacute;.</p>\n<p>Loại thực phẩm tốt cho sức khỏe, bổ sung nhiều vitamin, dưỡng chất, cung cấp cho cơ thể con người năng lượng qu&yacute; gi&aacute; thay v&igrave; rượu, hoa v&agrave; một số qu&agrave; tặng kh&aacute;c. Kh&ocirc;ng chỉ vậy, sử dụng hộp qu&agrave; tr&aacute;i c&acirc;y l&agrave;m qu&agrave; tặng cũng ch&iacute;nh l&agrave; c&aacute;ch để ch&uacute;ng ta g&oacute;p phần bảo vệ m&ocirc;i trường..</p>\n<p>B&ecirc;n cạnh đ&oacute;, Giỏ qu&agrave; hoa quả nhập khẩu - TC36 c&ograve;n biểu trưng cho sự đầy đặn, sung t&uacute;c, m&agrave;u sắc h&ograve;a quyện v&agrave;o nhau tạo n&ecirc;n một h&igrave;nh ảnh thật đẹp mắt.</p>\n<h3>Giỏ qu&agrave; hoa quả nhập khẩu - TC20&nbsp;&nbsp;</h3>\n<h3>Đặc điểm của sản phẩm</h3>\n<ul>\n<li>Giỏ, hộp qu&agrave; hoa quả sang trọng, lịch sự.</li>\n<li>Đẹp mắt, m&acirc;̃u mã lu&ocirc;n thay đ&ocirc;̉i phù hợp với thị hi&ecirc;́u của người ti&ecirc;u dùng.</li>\n<li>Ch&acirc;́t lượng hoa quả lu&ocirc;n tươi mới.</li>\n<li>Hoa quả được nhập khẩu 100%, c&oacute; chứng nhận nguồn gốc xuất xứ r&otilde; r&agrave;ng.</li>\n</ul>\n<p>C&aacute;ch bảo quản giỏ qu&agrave; hoa quả thập cẩm</p>\n<ul>\n<li>Hộp hoa quả được bọc chắc chắn bằng m&agrave;ng co, ngo&agrave;i ra ch&uacute;ng t&ocirc;i c&ograve;n c&oacute; t&uacute;i chuy&ecirc;n d&ugrave;ng v&igrave; vậy qu&yacute; kh&aacute;ch h&agrave;ng an t&acirc;m khi vận chuyển.</li>\n<li>HỘP QU&Agrave; HOA QUẢ sử dụng c&aacute;c sản phẩm hoa quả nhập khẩu được bảo quản lạnh. V&igrave; vậy sản phẩm ăn sẽ ngon hơn trong v&ograve;ng 2 ng&agrave;y hoặc bảo quản lạnh ăn trong v&ograve;ng 1 tuần.</li>\n</ul>\n<p>Qu&yacute; kh&aacute;ch c&oacute; thể xem th&ecirc;m c&aacute;c mẫu sản phẩm kh&aacute;c&nbsp;<strong><a href=\"http://luontuoisach.vn/ha-noi/gio-trai-cay\">Tại Đ&acirc;y</a>.</strong></p>\n<div><strong>HỆ THỐNG HOA QUẢ NHẬP KHẨU LU&Ocirc;N TƯƠI SẠCH H&Agrave; NỘI</strong></div>\n<div><strong><img title=\"yes\" src=\"http://luontuoisach.vn/public/ckeditor/plugins/smiley/images/thumbs_up.png\" alt=\"yes\">&nbsp;&nbsp;HOTLINE ( Zalo )&nbsp; :&nbsp; 0944.28.38.86&nbsp; -&nbsp; 0869.362.849</strong></div>\n<div><strong><img title=\"mail\" src=\"http://luontuoisach.vn/public/ckeditor/plugins/smiley/images/envelope.png\" alt=\"mail\">&nbsp;&nbsp;Facebook - Mua h&agrave;ng trực tuyến :&nbsp;</strong><a href=\"https://www.facebook.com/vfoodfruit/\">https://www.facebook.com/vfoodfruit/</a></div>\n<div><img title=\"mail\" src=\"http://luontuoisach.vn/public/ckeditor/plugins/smiley/images/envelope.png\" alt=\"mail\">&nbsp;&nbsp;<strong>Website&nbsp;</strong>:&nbsp;<a href=\"http://luontuoisach.vn/ha-noi\">http://luontuoisach.vn/ha-noi</a></div>\n<div><img title=\"mail\" src=\"http://luontuoisach.vn/public/ckeditor/plugins/smiley/images/envelope.png\" alt=\"mail\">&nbsp;&nbsp;<strong>Email&nbsp;</strong>:<em>&nbsp;</em>luontuoisach@gmail.com</div>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283694/ftspcn5jcebwj4h7gon5.jpg', 'Giỏ quà tết - TC20', 570000, 458, 23, 16),
(3, 'TMC-T', '2023-10-27 20:03:51.000000', b'0', '<p>Măng Cụt được xem l&agrave; Nữ Ho&agrave;ng của C&acirc;y Ăn Tr&aacute;i nhiệt đới v&agrave; được rất nhiều người ưa chuộng bởi lẽ d&aacute;ng tr&aacute;i đẹp v&agrave; chứa nhiều chất bổ dưỡng.&nbsp;C&acirc;y được trồng nhiều ở Th&aacute;i Lan, M&atilde; lai, Philippines, Indon&ecirc;sia v&agrave; Việt nam.</p>\n<p><img class=\"alignnone size-medium wp-image-8157 aligncenter\" src=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-1-225x300.jpg\" sizes=\"(max-width: 225px) 100vw, 225px\" srcset=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-1-225x300.jpg 225w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-1-600x800.jpg 600w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-1.jpg 720w\" alt=\"\" width=\"225\" height=\"300\" loading=\"lazy\"></p>\n<h2>I.Đặc điểm h&igrave;nh th&aacute;i của C&acirc;y Măng Cụt</h2>\n<p>Măng Cụt&nbsp;c&oacute; t&ecirc;n khoa học l&agrave; Garcinia mangostana, l&agrave; một lo&agrave;i c&acirc;y thuộc&nbsp;họ Bứa&nbsp;(Clusiaceae). C&acirc;y c&oacute; nguồn gốc từ c&aacute;c nước Đ&ocirc;ng Nam &Aacute; nhiệt đới.</p>\n<p>Th&acirc;n, t&aacute;n,&nbsp;l&aacute;:&nbsp;Măng Cụt l&agrave; một loại c&acirc;y to, c&oacute; thể cao tới 20&ndash;25 m. L&aacute; d&agrave;y, dai, m&agrave;u lục sẫm, h&igrave;nh thu&ocirc;n d&agrave;i&nbsp;</p>\n<p><img class=\"alignnone size-medium wp-image-8150 aligncenter\" src=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4-300x189.jpg\" sizes=\"(max-width: 300px) 100vw, 300px\" srcset=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4-300x189.jpg 300w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4-1024x643.jpg 1024w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4-768x483.jpg 768w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4-600x377.jpg 600w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-4.jpg 1332w\" alt=\"\" width=\"300\" height=\"189\" loading=\"lazy\"></p>\n<p>Hoa, quả, hạt:&nbsp;Hoa đực cụm 3-9 hoa c&oacute; l&aacute; bắc. Hoa lưỡng t&iacute;nh c&oacute; cuống c&oacute; đốt. Quả h&igrave;nh cầu, to bằng quả cam trung b&igrave;nh, vỏ ngo&agrave;i m&agrave;u đỏ t&iacute;m d&agrave;y cứng, trong đỏ tươi như rượu vang, d&agrave;y xốp, ph&iacute;a dưới c&oacute; l&aacute; d&agrave;i, ph&iacute;a đỉnh c&oacute; đầu nhụy. Ruột trắng ng&agrave; v&agrave; chia th&agrave;nh nhiều m&uacute;i c&oacute; vị chua ngọt thanh thanh v&agrave; c&oacute; m&ugrave;i thơm thu h&uacute;t. Trong quả c&oacute; từ 6 đến 18 hạt, quanh hạt c&oacute; &aacute;o hạt trắng, ăn ngọt thơm ngon.</p>\n<h2>II.Đặc điểm sinh th&aacute;i của C&acirc;y Măng Cụt</h2>\n<p><img class=\"alignnone size-medium wp-image-8151 aligncenter\" src=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-300x282.jpg\" sizes=\"(max-width: 300px) 100vw, 300px\" srcset=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-300x282.jpg 300w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5-600x564.jpg 600w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-5.jpg 740w\" alt=\"\" width=\"300\" height=\"282\" loading=\"lazy\"></p>\n<p>C&acirc;y Măng Cụt dễ trồng, dễ chăm s&oacute;c được trồng phổ biến ở c&aacute;c tỉnh miền Đ&ocirc;ng Nam Bộ v&agrave; T&acirc;y Nam Bộ. C&acirc;y c&oacute; thể sinh trưởng ở nhiều loại đất kh&aacute;c nhau nhưng tốt nhất l&agrave; đất s&eacute;t gi&agrave;u hữu cơ, tầng canh t&aacute;c dầy, tho&aacute;t nước tốt v&agrave; gần nguồn nước tưới. Măng Cụt l&agrave; loại c&acirc;y đ&ograve;i hỏi kh&iacute; hậu nhiệt đới với nhiệt độ cao, ẩm độ cao, lượng mưa dồi d&agrave;o.</p>\n<p>Lượng mưa:&nbsp;C&acirc;y y&ecirc;u cầu lượng mưa thấp nhất phải l&agrave; 1270mm/năm. C&acirc;y Măng Cụt kh&ocirc;ng thể sinh trưởng ph&aacute;t triển tốt ở v&ugrave;ng qu&aacute; kh&ocirc; hay qu&aacute; ẩm.</p>\n<p>Nhiệt độ- ẩm độ:&nbsp;Nhiệt độ th&iacute;ch hợp cho c&acirc;y ph&aacute;t triển ở v&agrave;o khoảng 25-35oC v&agrave; ẩm độ kh&ocirc;ng kh&iacute; thấp nhất l&agrave; 80%</p>\n<p><img class=\"alignnone size-medium wp-image-8155 aligncenter\" src=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-3-1-225x300.jpg\" sizes=\"(max-width: 225px) 100vw, 225px\" srcset=\"https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-3-1-225x300.jpg 225w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-3-1-600x800.jpg 600w, https://hocviennongnghiep.com/wp-content/uploads/2023/10/mang-cut-3-1.jpg 720w\" alt=\"\" width=\"225\" height=\"300\" loading=\"lazy\"></p>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283640/gyctuqbzsplw2litwvpv.jpg', 'Cherry Úc size 28-30', 60000, 486, 11, 13),
(4, 'TNS-R', '2023-10-27 20:05:43.000000', b'0', '<p><strong>I. GIỚI THIỆU NA SẦU RI&Ecirc;NG :&nbsp;</strong><br>C&acirc;y na sầu ri&ecirc;ng l&agrave; loại c&acirc;y được trồng chủ yếu ở c&aacute;c khu vực nhiệt đới. Nguồn gốc của n&oacute; bắt nguồn từ Đ&agrave;i Loan Trung Quốc.&nbsp;L&aacute; na sầu ri&ecirc;ng mỏng, h&igrave;nh bầu dục, mặt sau c&oacute; m&agrave;u xanh nhạt, mọc 4 ph&iacute;a quanh th&acirc;n. Hoa thường mọc đơn độc hoặc 2 &ndash; 4 cụm tr&ecirc;n ngọn c&agrave;nh hoặc mọc đối diện l&aacute;. Hoa c&oacute; m&agrave;u v&agrave;ng nhạt, c&aacute;nh hẹp, d&agrave;y, h&igrave;nh thu&ocirc;n, đ&agrave;i hoa h&igrave;nh tam gi&aacute;c.</p>\n<p>Quả na sầu ri&ecirc;ng c&oacute; n&eacute;t đặc trưng ri&ecirc;ng đ&oacute; l&agrave; tr&aacute;i d&agrave;i theo h&igrave;nh n&oacute;n, vỏ mỏng, ruột m&agrave;u trắng, &iacute;t hạt, thịt quả chắc, vị ngọt thanh, c&oacute; m&ugrave;i hương sầu ri&ecirc;ng đặc trưng. Trọng lượng quả to gấp<strong>&nbsp;2 &ndash; 3 lần</strong>&nbsp;so với na truyền thống.</p>\n<p id=\"ky-thuat-trong-cay-na-sau-rieng\" class=\"ftwp-heading\"><strong>II. KỸ THUẬT TRỒNG NA SẦU RI&Ecirc;NG :&nbsp;</strong></p>\n<pre id=\"tieu-chuan-chon-giong\" class=\"ftwp-heading\"><strong>1.Ti&ecirc;u chuẩn chọn giống</strong></pre>\n<p>Ti&ecirc;u chuẩn chọn giống quan trọng nhất l&agrave; c&acirc;y khỏe mạnh, khả năng chống chọi s&acirc;u bệnh tốt. Khi lựa chọn c&acirc;y giống na sầu ri&ecirc;ng bạn n&ecirc;n chọn những c&acirc;y khỏe mạnh, kh&ocirc;ng c&oacute; dấu hiệu s&acirc;u bệnh để c&oacute; mức độ th&iacute;ch nghi cao nhất mang lại khả năng tăng trưởng nhanh, cho hiệu suất cao về sau.</p>\n<pre id=\"dat-trong\" class=\"ftwp-heading\"><strong>2. Đất trồng</strong></pre>\n<p>Đất l&agrave; m&ocirc;i trường ch&iacute;nh cung cấp nguồn dinh dưỡng quan trọng để c&acirc;y ph&aacute;t triển. Điểm quan trọng để năng suất cao l&agrave; lựa chọn loại đất ph&ugrave; hợp với mỗi loại c&acirc;y giống.</p>\n<p>C&acirc;y na sầu ri&ecirc;ng l&agrave; c&acirc;y giống ph&ugrave; hợp với nhiều loại đất như đất c&aacute;t hoặc c&aacute;t pha đất s&eacute;t. Nhưng ph&aacute;t triển tốt nhất vẫn l&agrave; loại đất c&aacute;t c&oacute; độ tho&aacute;t nước tốt. V&igrave; vậy c&acirc;y dễ d&agrave;ng hấp thu chất dinh dưỡng qua việc tưới ti&ecirc;u.</p>\n<pre id=\"thoi-vu-va-mat-do-trong\" class=\"ftwp-heading\"><strong>3. Thời vụ v&agrave; mật độ trồng</strong></pre>\n<p><strong>Thời vụ trồng:</strong>&nbsp;C&acirc;y na sầu ri&ecirc;ng l&agrave; giống c&acirc;y th&iacute;ch hợp trồng tại khắp c&aacute;c v&ugrave;ng miền nước ta. Tuy nhi&ecirc;n, mỗi miền th&igrave; sẽ c&oacute; khoảng thời gian trồng c&acirc;y v&agrave;o mỗi m&ugrave;a kh&aacute;c nhau.</p>\n<p><strong>Miền Bắc</strong>: nếu bạn trồng c&acirc;y v&agrave;o m&ugrave;a xu&acirc;n th&igrave; chọn th&aacute;ng 2 hoặc th&aacute;ng 3, m&ugrave;a thu sẽ trồng v&agrave;o th&aacute;ng 8 hoặc th&aacute;ng 9.</p>\n<p><strong>Miền Nam:</strong>&nbsp;bạn c&oacute; thể trồng quanh năm.</p>\n<p><strong>C&aacute;c tỉnh T&acirc;y Nguy&ecirc;n</strong>: thời gian trồng c&acirc;y tốt nhất l&agrave; v&agrave;o đầu m&ugrave;a mưa, khoảng th&aacute;ng 4 hoặc th&aacute;ng 5.</p>\n<p><strong>Mật độ trồng c&acirc;y:</strong>&nbsp;Với giống na sầu ri&ecirc;ng khoảng c&aacute;ch tốt nhất giữa c&aacute;c c&acirc;y giống l&agrave; 3 x 3m hoặc 3 x 4m.</p>\n<p id=\"ky-thuat-cham-soc-cay-na-sau-rieng\" class=\"ftwp-heading\"><strong>III. KỸ THUẬT CHĂM S&Oacute;C C&Acirc;Y NA SẦU RI&Ecirc;NG :&nbsp;</strong></p>\n<pre id=\"bon-phan\" class=\"ftwp-heading\"><strong>1. B&oacute;n ph&acirc;n</strong></pre>\n<p>C&acirc;y na sầu ri&ecirc;ng chủ yếu hợp với ph&acirc;n hữu cơ, ph&acirc;n hữu cơ kết hợp với v&ocirc; cơ. T&ugrave;y v&agrave;o từng giai đoạn sinh trưởng của c&acirc;y m&agrave; c&oacute; c&aacute;ch b&oacute;n ph&acirc;n kh&aacute;c nhau. Một năm, na sầu ri&ecirc;ng sẽ được chia b&oacute;n ph&acirc;n l&agrave;m 3 giai đoạn ch&iacute;nh.</p>\n<p><strong>Lần đầu ti&ecirc;n</strong>: trước v&agrave; sau khi cắt tỉa l&aacute; v&agrave;o m&ugrave;a đ&ocirc;ng kết hợp với việc xới đất. Lần n&agrave;y sẽ sử dụng ph&acirc;n hữu cơ. V&agrave; bạn ch&uacute; &yacute; l&agrave; cần đ&agrave;o s&acirc;u lớp đất trước khi b&oacute;n ph&acirc;n để c&acirc;y dễ hấp thụ hơn.</p>\n<p><strong>Lần thứ hai</strong>: trong thời kỳ quả non v&agrave;o khoảng th&aacute;ng 5 hoặc 6. L&uacute;c n&agrave;y bạn cần ch&uacute; &yacute; kỹ hơn trong kh&acirc;u ph&acirc;n b&oacute;n. V&igrave; đ&acirc;y l&agrave; giai đoạn quan trọng để quả ph&aacute;t triển tốt. Tỷ lệ ph&acirc;n b&oacute;n tại thời điểm n&agrave;y l&agrave; ph&acirc;n l&acirc;n 80%, ph&acirc;n đạm v&agrave; kali chiếm 20%.</p>\n<p><strong>Lần thứ ba</strong>: trong thời kỳ tr&aacute;i c&acirc;y m&ugrave;a đ&ocirc;ng v&agrave; tr&aacute;i non v&agrave;o khoảng th&aacute;ng 9 &ndash; 10. Tỷ lệ ph&acirc;n b&oacute;n cho c&acirc;y được chia như sau: ph&acirc;n b&oacute;n nito 35%, ph&acirc;n l&acirc;n 10%, ph&acirc;n kali 35%.</p>\n<p>Trong cả năm th&igrave; bạn c&oacute; thể &aacute;p dụng tỷ lệ ph&acirc;n b&oacute;n l&agrave; ph&acirc;n đạm 35%, ph&acirc;n l&acirc;n 10% v&agrave; ph&acirc;n kali 20% để c&acirc;y c&oacute; thể hấp thụ đều đặn trong qu&aacute; tr&igrave;nh ph&aacute;t triển của m&igrave;nh.</p>\n<pre id=\"tuoi-nuoc\" class=\"ftwp-heading\"><strong>2. Tưới nước</strong></pre>\n<p>Bạn cần phải ch&uacute; &yacute; l&agrave; na sầu ri&ecirc;ng rất nhạy cảm với nước. Nếu bạn tưới nước qu&aacute; nhiều hoặc qu&aacute; &iacute;t c&acirc;y đều kh&ocirc;ng ph&aacute;t triển tốt như mong đợi. Nước rất quan trọng với sự ra hoa, đậu quả v&agrave; chất lượng quả. Nếu c&acirc;y lu&ocirc;n trong t&igrave;nh trạng thiếu nước hoặc tưới nước khi th&igrave; qu&aacute; nhiều, khi th&igrave; qu&aacute; &iacute;t sẽ l&agrave;m ảnh hưởng nghi&ecirc;m trọng đến sự ph&aacute;t triển của quả.</p>\n<pre id=\"cat-tia-cay\" class=\"ftwp-heading\"><strong>3. Cắt tỉa c&acirc;y</strong></pre>\n<p>H&agrave;ng năm bạn n&ecirc;n cắt tỉa c&agrave;nh l&aacute; để lu&ocirc;n duy tr&igrave; h&igrave;nh dạng c&acirc;y v&agrave; th&uacute;c đẩy c&acirc;y ra hoa. Việc cắt tỉa thường được chia l&agrave;m 2 lần v&agrave;o m&ugrave;a đ&ocirc;ng (th&aacute;ng 1 &ndash; 3) v&agrave; m&ugrave;a h&egrave; (th&aacute;ng 6 &ndash; 9).</p>\n<pre id=\"phong-tru-sau-benh\" class=\"ftwp-heading\"><strong>4. Ph&ograve;ng trừ s&acirc;u bệnh</strong></pre>\n<p>S&acirc;u bệnh l&agrave; mối nguy hại cho c&acirc;y trồng. Bạn cần theo d&otilde;i v&agrave; ph&aacute;t hiện sớm t&igrave;nh trạng s&acirc;u bệnh ở c&acirc;y để tr&aacute;nh l&agrave;m giảm năng suất. C&acirc;y na sầu ri&ecirc;ng thường gặp c&aacute;c loại s&acirc;u bệnh như:</p>\n<p><strong>Bệnh than</strong>: bệnh n&agrave;y g&acirc;y ra t&igrave;nh trạng l&aacute; rụng, quả đen v&agrave; thối. C&aacute;ch điều trị khi c&acirc;y mắc bệnh than l&agrave; phun 1 &ndash; 2 lần bột carbendazim hoặc bột thiophanate 70% trong giai đoạn chiết t&aacute;ch chồi mới v&agrave; giai đoạn ra hoa, quả.</p>\n<p><strong>Thối rễ:</strong>&nbsp;khi nước t&iacute;ch tụ qu&aacute; nhiều l&agrave;m tổn thương rễ kết hợp với nhiệt độ v&agrave; độ ẩm cao th&igrave; rễ c&acirc;y na sầu ri&ecirc;ng sẽ bị thối. Bạn c&oacute; thể sử dụng c&aacute;m đậu n&agrave;nh l&ecirc;n men, ph&acirc;n gia cầm v&agrave; c&aacute;c loại ph&acirc;n hữu cơ kh&aacute;c c&oacute; lợi để ngăn chặn t&igrave;nh trạng n&agrave;y. Hoặc rải v&ocirc;i trước khi trồng để loại trừ mầm bệnh n&agrave;y từ trong đất. H&agrave;ng năm bạn n&ecirc;n rắc v&ocirc;i với bột lưu huỳnh theo tỉ lệ 10:1 xung quanh gốc, b&ocirc;i v&ocirc;i v&agrave;o gốc c&acirc;y tr&ecirc;n 50cm.</p>\n<p><strong>Thối th&acirc;n</strong>: khi c&acirc;y mắc bệnh thối th&acirc;n th&igrave; phần chồi v&agrave; quả sẽ kh&ocirc;ng hấp thu được chất dinh dưỡng từ dưới đất. Từ đ&oacute; dẫn đến chồi kh&ocirc;, rụng v&agrave; quả bị thối. Để ph&ograve;ng tr&aacute;nh bệnh n&agrave;y bạn n&ecirc;n phun 1 &ndash; 2 lần bột carbendazim 50% hoặc bột bordeaux trong giai đoạn chồi mới nảy mầm v&agrave; thời kỳ ra hoa.</p>\n<p><strong>S&acirc;u bọ:</strong>&nbsp;na sầu ri&ecirc;ng c&oacute; thể gặp những loại s&acirc;u bọ như rệp s&aacute;p, s&acirc;u đục quả hay bọ v&ograve;i voi. Bạn cần thăm vườn thường xuy&ecirc;n để ph&aacute;t hiện s&acirc;u bọ kịp thời. Khi ph&aacute;t hiện c&acirc;y mắc s&acirc;u bọ cần phải sử dụng thuốc đặc trị để ti&ecirc;u diệt như Abamectin EC, Pyridaben hoặc Spirodiclofen.</p>\n<p><strong>C&ocirc;n tr&ugrave;ng vảy:</strong> v&agrave;o m&ugrave;a xu&acirc;n v&agrave; thu khi c&acirc;y ra chồi mới v&agrave; quả non rất dễ bị những loại c&ocirc;n tr&ugrave;ng c&oacute; vảy tấn c&ocirc;ng. L&uacute;c n&agrave;y bạn n&ecirc;n sử dụng thuốc&nbsp;Deltamethrin&nbsp;2.5% để ph&ograve;ng ngừa v&agrave; điều trị.</p>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412244/mmhqyrawhnnwdfjottm1.png', 'Na Sầu Riêng', 250000, 462, 35, 11),
(5, 'TNR-DL', '2023-10-27 20:07:15.000000', b'0', '<p>C&acirc;y Na Dứa Đ&agrave;i Loan Cao Khoảng 60cm</p>\n<p>&ndash; Xuất xứ: Đ&agrave;i Loan</p>\n<p>&ndash; Loại na dứa Đ&agrave;i Loan cho hương vị đặc biệt thơm ngon v&agrave; cho năng suất cực k&igrave; cao. Giống na n&agrave;y ngo&agrave;i ra c&ograve;n c&oacute; nhiều gi&aacute; trị dinh dưỡng m&agrave; bạn sẽ ph&aacute;t bất ngờ.</p>\n<p>&ndash; Quả na dứa Đ&agrave;i Loan to v&agrave; bắt mắt hơn giống na bản địa. Sau khi trồng 2 năm c&acirc;y cho ra những quả to c&oacute; k&iacute;ch thước hơn 1kg. Na bở khi ch&iacute;n cho thịt quả mềm v&agrave; bở khi ăn c&oacute; vị ngọt m&aacute;t v&agrave; hương thơm rất đặc trưng.</p>\n<p>&nbsp;1. Na dứa Đ&agrave;i Loan &ndash; loại quả gi&agrave;u dinh dưỡng</p>\n<p>&nbsp;&ndash; Nếu để so s&aacute;nh với c&aacute;c giống na kh&aacute;c th&igrave; loại na bở n&agrave;y xem ra nhỉnh hơn kh&aacute; nhiều.</p>\n<p>&nbsp;&ndash; Trong th&agrave;nh phần của loại na n&agrave;y c&oacute; h&agrave;m lượng Vitamin A, C kh&aacute; dồi d&agrave;o. gi&uacute;p cải thiện dược vấn đề về mắt kh&aacute; tốt. Kh&ocirc;ng những thế h&agrave;m lượng chất xơ, v&agrave; đường glucozo kh&aacute; nhiều khiến loại na n&agrave;y cung cấp nhiều nguồn năng lượng cho cơ thể.</p>\n<p>&nbsp;&ndash; Do l&agrave; loại na mới được nhập khẩu n&ecirc;n gi&aacute; tr&ecirc;n thị trường kh&aacute; đắt. Khoảng 400.000/kg. Ch&iacute;nh v&igrave; nắm được gi&aacute; trị kinh tế m&agrave; nhiều nh&agrave; vườn đ&atilde; trồng v&agrave; nh&acirc;n rộng giống na n&agrave;y ra khắp nơi gi&uacute;p ph&aacute;t triển kinh tế.</p>\n<p>&nbsp;2. Kỹ thuật trồng v&agrave; chăm s&oacute;c na dứa Đ&agrave;i Loan</p>\n<p>** Theo kinh nghiệm của nhiều nh&agrave; vườn th&igrave; giống na n&agrave;y trồng cũng kh&ocirc;ng qu&aacute; kh&oacute;. Chỉ cần ch&uacute; &yacute; một số kĩ thuật v&agrave; thời điểm chỉnh l&agrave; ho&agrave;n to&agrave;n c&oacute; thể trồng th&agrave;nh c&ocirc;ng được loại&nbsp;<em>na dứa Đ&agrave;i Loan</em>&nbsp;n&agrave;y trong vườn nh&agrave;.</p>\n<p>a. Thời vụ trồng:&nbsp;<em>Na dứa Đ&agrave;i Loan</em>&nbsp;th&iacute;ch hợp trồng v&agrave;o m&ugrave;a xu&acirc;n khoảng th&aacute;ng 3. Điều kiện thời tiết l&uacute;c n&agrave;y ph&ugrave; hợp với loại c&acirc;y n&agrave;y.</p>\n<p>b. Ti&ecirc;u chuẩn đất v&agrave; mật độ trồng:&nbsp;<em>Na dứa Đ&agrave;i Loan</em>&nbsp;th&iacute;ch hợp với loại đất thịt c&aacute;t pha. Đất n&ecirc;n tho&aacute;ng kh&iacute; v&agrave; tơi xốp. Nếu trồng ở nơi đất thấp th&igrave; n&ecirc;n l&agrave;m luống cao trước khi trồng. Mật độ trồng c&acirc;y c&aacute;ch c&acirc;y &iacute;t nhất khoảng 3m.</p>\n<p>c. L&agrave;m đất v&agrave; b&oacute;n l&oacute;t cho c&acirc;y</p>\n<p>&nbsp;&ndash; Trước khi trồng&nbsp;<em>na dứa&nbsp;</em>cần phải l&agrave;m sạch đất v&agrave; đ&agrave;o hố trước đ&oacute; 1 th&aacute;ng. K&iacute;ch thước hố trồng khoảng 50x50x50cm v&agrave; khoảng c&aacute;ch giữa c&aacute;c hố l&agrave; 3m.</p>\n<p>&ndash; Để xử l&yacute; hết mầm bệnh trong đất v&agrave; cung cấp dinh dưỡng cho đất bạn cần b&oacute;n l&oacute;t cho từng hố một lượng ph&acirc;n b&oacute;n l&agrave; 10kg ph&acirc;n chuồng hoai mục, 0,5kg ph&acirc;n L&acirc;n v&agrave; 1kg v&ocirc;i bột.</p>\n<p>d. Trồng c&acirc;y:&nbsp;C&acirc;y con giống khi trồng sẽ được đặt ở giữa hố. Bạn cố định d&aacute;ng c&acirc;y v&agrave; lấp đất k&iacute;n bề mặt rồi tiến h&agrave;nh tưới nước cho c&acirc;y lu&ocirc;n. Duy tr&igrave; độ ẩm 70-80% cho đất trong 1 th&aacute;ng sau đ&oacute; để gi&uacute;p c&acirc;y ph&aacute;t triển xanh tốt.&nbsp;</p>\n<p>3. Kỹ thuật chăm s&oacute;c na dứa Đ&agrave;i Loan:&nbsp;Thời gian đầu sau khi trồng cần duy tr&igrave; việc tưới nước đều đặn 3 ng&agrave;y 1 lần. Khi c&acirc;y ph&aacute;t triển cao 1m trở đi th&igrave; giảm lượng nước tưới lại nhưng vẫn cần duy tr&igrave; độ ẩm thường xuy&ecirc;n cho c&acirc;y.</p>\n<p>&nbsp;4. L&agrave;m cỏ:&nbsp;T&ugrave;y thuộc v&agrave;o đặc điểm của đất m&agrave; bạn cần định k&igrave; nhổ sạch cỏ dại quanh gốc&nbsp;<em>na dứa đ&agrave;i loan</em>&nbsp;để kh&ocirc;ng cạnh tranh chất dinh dưỡng với c&acirc;y.</p>\n<p>&nbsp;5. B&oacute;n ph&acirc;n</p>\n<p>&nbsp;&ndash; Để c&oacute; thể gi&uacute;p c&acirc;y ph&aacute;t triển tốt v&agrave; cho năng suất cao th&igrave; việc b&oacute;n ph&acirc;n l&agrave; điều cần thiết. Trong năm đầu ti&ecirc;n sau khi trồng định k&igrave; b&oacute;n ph&acirc;n B&oacute;n NPK tỷ lệ 2:1:1. Cứ 1-2 th&aacute;ng b&oacute;n một lần. C&oacute; thể tăng lượng đạm để gi&uacute;p c&acirc;y tăng trưởng th&acirc;n, l&aacute; được tốt hơn.</p>\n<p>&ndash; Sang năm thứ 2 bắt đầu tăng lượng ph&acirc;n b&oacute;n NPK l&ecirc;n 10%. B&oacute;n năm 2 lần.</p>\n<p>&nbsp;6. Ph&ograve;ng trừ s&acirc;u, bệnh hại:&nbsp;<em>Na dứa đ&agrave;i loan</em>&nbsp;&iacute;t s&acirc;u bệnh hơn những giống na kh&aacute;c. Tuy nhi&ecirc;n bạn cũng cần ch&uacute; &yacute; ph&ograve;ng chống c&aacute;c loại s&acirc;u rệp tấn c&ocirc;ng quả v&agrave; l&aacute;. Khi ph&aacute;t hiện mầm bệnh cần xử l&yacute; ngay bằng c&aacute;ch bắt bằng tay hoặc phun chế phẩm sinh học bảo vệ thực vật.</p>\n<p>7. Thu hoạch na dứa Đ&agrave;i Loan :&nbsp;Sau khi trồng loại na dứa n&agrave;y đến năm thứ 3 c&acirc;y sẽ cho thu hoạch quả đều. Khi thấy quả to vỏ hơi nứt v&agrave; c&oacute; hương thơm thoang thoảng bạn c&oacute; thể thu hoạch được những quả na bở xuống. Tr&aacute;nh l&agrave;m mạnh tay đẻ quả kh&ocirc;ng bị dập n&aacute;t khi h&aacute;i. H&aacute;i xong đựng trong th&ugrave;ng xốp hoặc bảo quản nơi tho&aacute;ng m&aacute;t sẽ giữ cho chất lượng quả na thơm ngon hơn.</p>\n<p><strong>9. Hướng dẫn mua h&agrave;ng v&agrave; vận chuyển:</strong></p>\n<p>-Phương thức thanh to&aacute;n tiền mua c&acirc;y giống</p>\n<p>Thanh to&aacute;n bằng tiền mặt: trực tiếp tại văn ph&ograve;ng, vườn ươm, Bưu&nbsp;điện.</p>\n<p>hoặc Thanh to&aacute;n qua t&agrave;i khoản: Nguyễn Văn Nhất &ndash; stk: 3120 2058 84962 tại Ng&acirc;n h&agrave;ng NN&amp; PTNT &ndash; AGRIBANK chi nh&aacute;nh gia l&acirc;m , H&agrave;Nội .</p>\n<p>(khi gửi kh&aacute;ch h&agrave;ng lưu&nbsp;&yacute;&nbsp;điền số&nbsp;điện thoại v&agrave;o mục nội dung chuyển tiền)</p>\n<p>&ndash; Dịch vụ&nbsp;vận chuyển</p>\n<p>Nếu kh&aacute;ch h&agrave;ng ở&nbsp;xa, ch&uacute;ng t&ocirc;i c&oacute;&nbsp;k&egrave;m dịch vụ&nbsp;vận chuyển như&nbsp;sau:</p>\n<p>&ndash; &nbsp; &nbsp;Chi ph&iacute; vận chuyển c&acirc;y ra bến xe mỹ&nbsp;đ&igrave;nh + 150.000đ&nbsp;cước vận chuyển.</p>\n<p>&ndash; &nbsp; &nbsp;Chi ph&iacute; vận chuyển c&acirc;y ra bến xe nước ngầm, gi&aacute;p b&aacute;t,Gia l&acirc;m + 100.000đ&nbsp;cước vận chuyển.</p>\n<p>(Kh&aacute;ch h&agrave;ng ở&nbsp;xa mua c&acirc;y giống c&aacute;c loại n&ecirc;n cung cấp cho&nbsp;đơn vị&nbsp;số&nbsp;điện thoại của nh&agrave;&nbsp;xe kh&aacute;ch chạy qua&nbsp;địa&nbsp;điểm gần nơi kh&aacute;ch h&agrave;ng nhất&nbsp;(nếu c&oacute;)&nbsp;để&nbsp;đơn vị&nbsp;gửi c&acirc;y, thuận lợi cho người nhận v&agrave;&nbsp;đảm bảo tốt cho c&acirc;y giống)</p>\n<p>&ndash; Cam kết chất lượng</p>\n<p>&ndash; &nbsp;Đảm bảo chuẩn giống&nbsp;đ&uacute;ng chất lượng sản phẩm cung cấp.</p>\n<p>&ndash; &nbsp;Hỗ&nbsp;trợ&nbsp;hướng dẫn kỹ&nbsp;thuật trồng, chăm s&oacute;c c&acirc;y v&agrave;&nbsp;giới thiệu&nbsp;đầu ra cho sản phẩm sau thu hoạch.</p>\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Rất mong được cộng t&aacute;c với Qu&yacute; vị kh&aacute;ch h&agrave;ng tr&ecirc;n to&agrave;n quốc.</p>\n<p>Mọi chi tiết xin li&ecirc;n hệ:&nbsp;TRUNG T&Acirc;M GIỐNG C&Acirc;Y TRỒNG-&nbsp;&nbsp;HỌC VIỆN N&Ocirc;NG NGHIỆP VIỆT NAM</p>\n<p>Địa chỉ trụ sở giao dịch tại Miền Bắc: Khu 31ha, Ng&otilde; 237, Đường Ng&ocirc; Xu&acirc;n Quảng, TT Tr&acirc;u Quỳ &ndash; Gia L&acirc;m &ndash; H&agrave; Nội</p>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412335/ou5yerbf7oeib3eewahi.jpg', 'Na Dứa Đài Loan', 180000, 590, 0, 11),
(6, 'TBK-ST', '2023-10-27 20:08:58.000000', b'0', '<p><strong>Xuất xứ:&nbsp;</strong><strong>New Zealand</strong></p>\n<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Nhập Khẩu</p>\n<p><strong>Đặc điểm:</strong></p>\n<ul>\n<li>T&aacute;o Dazzle c&oacute; đủ hương vị ngọt, gi&ograve;n với thịt chắc m&agrave;u trắng sữa.</li>\n<li>Dazzel l&agrave;&nbsp;một trong những đặc sản t&aacute;o của ho&agrave;ng gia New Zealand, được xếp v&agrave;o h&agrave;ng ngũ những loại t&aacute;o ngon của thế giới.</li>\n</ul>\n<p><strong>T&aacute;o Dazzle New Zealang (KG)</strong>&nbsp;tr&aacute;i tr&ograve;n, vỏ b&ograve;ng c&oacute; m&agrave;u đỏ sẫm, khi cầm l&ecirc;n rất nặng tay.&nbsp;Khi thưởng thức lại mang đến vị gi&aacute;c ngọt ngọt, gi&ograve;n tan v&agrave; thơm dịu dịu rất lạ, rất đặc biệt chắc chắn bạn sẽ y&ecirc;u ngay khi vừa ăn miếng đầu ti&ecirc;n.</p>\n<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>\n<ul>\n<li>T&aacute;o l&agrave; nguồn cung cấp vitamin C tuyệt vời, c&oacute; t&aacute;c dụng tăng cường hệ thống miễn dịch.&nbsp;Mỗi quả t&aacute;o chứa khoảng 8mg vitamin n&agrave;y, v&igrave; thế ch&uacute;ng sẽ cung cấp khoảng 14% nhu cầu vitamin C h&agrave;ng ng&agrave;y của cơ thể.</li>\n<li>Cũng giống như quả l&ecirc; v&agrave; quả việt quất, t&aacute;o c&oacute; mối li&ecirc;n hệ với việc giảm thiểu nguy cơ mắc bệnh tiểu đường type 2 nhờ chất chống oxy h&oacute;a c&oacute; t&ecirc;n Anthocyanins, hơn nữa trong t&aacute;o c&oacute; chất Triterpenoids c&oacute; khả năng chống lại c&aacute;c bệnh ung thư gan, ruột kết v&agrave; ung thư v&uacute;.</li>\n<li>Một quả t&aacute;o cỡ trung b&igrave;nh chứa khoảng 4g chất xơ. Một phần trong số chất xơ đ&oacute; ở dạng Pectin - loại chất xơ h&ograve;a tan c&oacute; t&aacute;c dụng giảm lượng cholesterol \"\"xấu\"\"</li>\n<li>Chất xơ phức tạp của t&aacute;o gi&uacute;p no l&acirc;u hơn m&agrave; kh&ocirc;ng bị ti&ecirc;u thụ nhiều calo (một quả t&aacute;o b&igrave;nh thường chỉ chứa khoảng 95 calo).</li>\n<li>Một loại axit c&oacute; trong vỏ t&aacute;o l&agrave; Axit Ursolic l&agrave;m giảm nguy cơ b&eacute;o ph&igrave;, Axit Ursolic th&uacute;c đẩy cơ thể đốt ch&aacute;y calo, tăng việc h&igrave;nh th&agrave;nh cơ v&agrave; giảm chất b&eacute;o l&acirc;u năm trong cơ thể.</li>\n</ul>\n<p><strong>Hướng dẫn sử dụng:</strong></p>\n<ul>\n<li>Rửa nhẹ nh&agrave;ng tr&aacute;i t&aacute;o. Sau đ&oacute; cắt đ&ocirc;i tr&aacute;i&nbsp;t&aacute;o&nbsp;v&agrave; loại bỏ phần hạt b&ecirc;n trong.</li>\n<li>Bảo quản trong tủ lạnh từ 4 đến 8 độ C. T&aacute;o giữ được độ tươi, độ gi&ograve;n trong v&ograve;ng 1-4 tuần. Sau thời gian n&agrave;y, t&aacute;o sẽ ngọt hơn, độ gi&ograve;n thấp hơn v&agrave; t&aacute;o trở n&ecirc;n xốp.</li>\n<li>Cần tr&aacute;nh để t&aacute;o với c&aacute;c thực phẩm c&oacute; m&ugrave;i kh&aacute;c như h&agrave;nh, tỏi, t&aacute;o sẽ dễ nhiễm m&ugrave;i.</li>\n<li>Kh&ocirc;ng rửa trước khi cho v&agrave;o tủ lạnh.</li>\n</ul>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283545/kwj3jia6tbo5aeaxngtm.jpg', 'Lê Nâu Hàn Quốc', 250000, 500, 0, 12),
(7, '10249', '2023-11-06 22:29:15.000000', b'0', '<p><strong>Xuất xứ:&nbsp;</strong><strong>New Zealand</strong></p>\n<p><strong>Ti&ecirc;u chuẩn chất lượng:&nbsp;</strong>Nhập Khẩu</p>\n<p><strong>Đặc điểm:</strong></p>\n<ul>\n<li>T&aacute;o Dazzle c&oacute; đủ hương vị ngọt, gi&ograve;n với thịt chắc m&agrave;u trắng sữa.</li>\n<li>Dazzel l&agrave;&nbsp;một trong những đặc sản t&aacute;o của ho&agrave;ng gia New Zealand, được xếp v&agrave;o h&agrave;ng ngũ những loại t&aacute;o ngon của thế giới.</li>\n</ul>\n<p><strong>T&aacute;o Dazzle New Zealang (KG)</strong>&nbsp;tr&aacute;i tr&ograve;n, vỏ b&ograve;ng c&oacute; m&agrave;u đỏ sẫm, khi cầm l&ecirc;n rất nặng tay.&nbsp;Khi thưởng thức lại mang đến vị gi&aacute;c ngọt ngọt, gi&ograve;n tan v&agrave; thơm dịu dịu rất lạ, rất đặc biệt chắc chắn bạn sẽ y&ecirc;u ngay khi vừa ăn miếng đầu ti&ecirc;n.</p>\n<p><strong>Th&ocirc;ng tin dinh dưỡng:</strong></p>\n<ul>\n<li>T&aacute;o l&agrave; nguồn cung cấp vitamin C tuyệt vời, c&oacute; t&aacute;c dụng tăng cường hệ thống miễn dịch.&nbsp;Mỗi quả t&aacute;o chứa khoảng 8mg vitamin n&agrave;y, v&igrave; thế ch&uacute;ng sẽ cung cấp khoảng 14% nhu cầu vitamin C h&agrave;ng ng&agrave;y của cơ thể.</li>\n<li>Cũng giống như quả l&ecirc; v&agrave; quả việt quất, t&aacute;o c&oacute; mối li&ecirc;n hệ với việc giảm thiểu nguy cơ mắc bệnh tiểu đường type 2 nhờ chất chống oxy h&oacute;a c&oacute; t&ecirc;n Anthocyanins, hơn nữa trong t&aacute;o c&oacute; chất Triterpenoids c&oacute; khả năng chống lại c&aacute;c bệnh ung thư gan, ruột kết v&agrave; ung thư v&uacute;.</li>\n<li>Một quả t&aacute;o cỡ trung b&igrave;nh chứa khoảng 4g chất xơ. Một phần trong số chất xơ đ&oacute; ở dạng Pectin - loại chất xơ h&ograve;a tan c&oacute; t&aacute;c dụng giảm lượng cholesterol \"\"xấu\"\"</li>\n<li>Chất xơ phức tạp của t&aacute;o gi&uacute;p no l&acirc;u hơn m&agrave; kh&ocirc;ng bị ti&ecirc;u thụ nhiều calo (một quả t&aacute;o b&igrave;nh thường chỉ chứa khoảng 95 calo).</li>\n<li>Một loại axit c&oacute; trong vỏ t&aacute;o l&agrave; Axit Ursolic l&agrave;m giảm nguy cơ b&eacute;o ph&igrave;, Axit Ursolic th&uacute;c đẩy cơ thể đốt ch&aacute;y calo, tăng việc h&igrave;nh th&agrave;nh cơ v&agrave; giảm chất b&eacute;o l&acirc;u năm trong cơ thể.</li>\n</ul>\n<p><strong>Hướng dẫn sử dụng:</strong></p>\n<ul>\n<li>Rửa nhẹ nh&agrave;ng tr&aacute;i t&aacute;o. Sau đ&oacute; cắt đ&ocirc;i tr&aacute;i&nbsp;t&aacute;o&nbsp;v&agrave; loại bỏ phần hạt b&ecirc;n trong.</li>\n<li>Bảo quản trong tủ lạnh từ 4 đến 8 độ C. T&aacute;o giữ được độ tươi, độ gi&ograve;n trong v&ograve;ng 1-4 tuần. Sau thời gian n&agrave;y, t&aacute;o sẽ ngọt hơn, độ gi&ograve;n thấp hơn v&agrave; t&aacute;o trở n&ecirc;n xốp.</li>\n<li>Cần tr&aacute;nh để t&aacute;o với c&aacute;c thực phẩm c&oacute; m&ugrave;i kh&aacute;c như h&agrave;nh, tỏi, t&aacute;o sẽ dễ nhiễm m&ugrave;i.</li>\n<li>Kh&ocirc;ng rửa trước khi cho v&agrave;o tủ lạnh.</li>\n</ul>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283475/fecfx6bo7bh719jyd5yr.jpg', 'Táo Dazzle New Zealand size 80', 200000, 0, 0, 1),
(8, 'gwewe', '2023-11-15 20:35:08.000000', b'1', '<div dir=\"auto\">&ndash;&nbsp; B&ograve;n Bon Th&aacute;i m&agrave;u v&agrave;ng nhạt, mọc th&agrave;nh ch&ugrave;m.</div>\n<div dir=\"auto\">&ndash;&nbsp; Vỏ dẻo, ch&ugrave;m tr&aacute;i to nhỏ xem lẫn, m&uacute;i căng mọng nước ngọt lịm.</div>\n<div dir=\"auto\">&ndash;&nbsp; Cơm b&ograve;n bon m&agrave;u trắng đục, vị ngọt thơm, mỗi tr&aacute;i c&oacute; từ 3 &ndash; 5 m&uacute;i, c&oacute; hạt.</div>\n<div dir=\"auto\">&ndash;&nbsp; B&ograve;n bon chứa nhiều đường, chất xơ, vitamin A, B1, B2, B3, C, v&agrave; c&aacute;c kho&aacute;ng chất kh&aacute;c. B&ograve;n Bon c&oacute; t&aacute;c dụng rất tốt đối với sức khỏe đặc biệt l&agrave; gi&uacute;p ngăn ngừa ung thư ruột kết, chống l&atilde;o h&oacute;a, tăng cường miễn dịch&hellip;</div>', 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1700055620/a2igbhmyxo1umuytwpc0.jpg', 'caay oki', 53345, 0, 0, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_comment`
--

CREATE TABLE `product_comment` (
  `id` bigint NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_time` time(6) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product_comment`
--

INSERT INTO `product_comment` (`id`, `content`, `created_date`, `created_time`, `product_id`, `user_id`) VALUES
(2, 'Mua hàng liên hệ ad nhé', '2024-11-07', '18:48:13.141000', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint NOT NULL,
  `link_image` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `link_image`, `product_id`) VALUES
(9, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412133/hsn9kbz2kr4duilnb6lp.jpg', 3),
(10, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412133/ph6jo7heywgp3aye2qzw.jpg', 3),
(11, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412133/dox2ck6sgxzrodnvtpal.jpg', 3),
(12, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412133/ut5tv4l6clo2pnivaqhv.jpg', 3),
(13, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412246/nuq3qsadazkv2ynqvp5v.jpg', 4),
(14, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412247/dcuuvmxbsigayshppnav.jpg', 4),
(15, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412247/lvrh3r7rzclfq19quhwk.jpg', 4),
(16, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412337/gqshevokanbe7oqpif04.jpg', 5),
(17, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412338/iwjv6kccg2zwhlq3qwmi.jpg', 5),
(18, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412338/jmgpwsq9isw9pqnjtgye.png', 5),
(19, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412441/n9unymfsty0psszpe9zo.jpg', 6),
(20, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412441/i13v8om1tntndvyootlp.jpg', 6),
(21, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1698412442/nz8pev88dzdvt2vtbl8f.jpg', 6),
(24, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1700055622/whv4nuqybs9vmtoosdfo.jpg', 8),
(25, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1700055622/rvm7wdalqetjnj16rhuz.jpg', 8),
(26, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1700055622/h6f0nf1yjc0avhclqkdl.jpg', 8),
(27, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1700055622/pxfrjbsr6rmdvnag2fpx.jpg', 8),
(28, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283480/srvhtu4cabr8ap9dc37p.jpg', 7),
(29, 'http://res.cloudinary.com/dxqh3xpza/image/upload/v1705283944/xkoorqlfstfvgj8k323d.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `statuses`
--

INSERT INTO `statuses` (`id`, `name`) VALUES
(1, 'Đang chờ xác nhận'),
(2, 'Đã xác nhận'),
(3, 'Đã gửi'),
(4, 'Đã nhận'),
(5, 'Đã hủy'),
(6, 'Không nhận hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint NOT NULL,
  `activation_key` varchar(255) DEFAULT NULL,
  `actived` bit(1) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('ROLE_ADMIN','ROLE_USER') DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `activation_key`, `actived`, `created_date`, `email`, `full_name`, `password`, `role`, `phone`, `address`) VALUES
(1, NULL, b'1', '2024-11-07', 'admin@gmail.com', 'ADMIN', '$2a$10$Mlta8Re5d5wILBo6Q7z1guDaAp45H29IyI9oJIE3lUQcliXJ6ANl6', 'ROLE_ADMIN', NULL, NULL),
(3, NULL, b'1', '2024-11-07', 'hieutran02102804@gmail.com', 'Trần Văn Hiếu', '$2a$10$bQ3ffyBRtWRq04Eg488InO.OU84lILb96GPajb/VrhQCOAhupv5bG', 'ROLE_USER', '0932478234', 'Trường chinh, Hai bà trưng, Hà nội');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  ADD KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history_pay`
--
ALTER TABLE `history_pay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3uqapx8urdm829chr0p30d0y2` (`invoice_id`);

--
-- Chỉ mục cho bảng `import_product`
--
ALTER TABLE `import_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrb4pegepmxt4xa1n8dmw5mtwv` (`product_id`);

--
-- Chỉ mục cho bảng `instruct`
--
ALTER TABLE `instruct`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK50hypf4gj5aqm6glk0prt0pmt` (`status_id`),
  ADD KEY `FKc8jotskr93810vgn75qlbusw2` (`user_id`);

--
-- Chỉ mục cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKit1rbx4thcr6gx6bm3gxub3y4` (`invoice_id`),
  ADD KEY `FKbe6c21nke5fy4m3vw00f23qsf` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`);

--
-- Chỉ mục cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf0dvop3xf5orf5j8icdwnq5ak` (`product_id`),
  ADD KEY `FKkg61diec02rh2o3xt4hjiy5u0` (`user_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`);

--
-- Chỉ mục cho bảng `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `history_pay`
--
ALTER TABLE `history_pay`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `import_product`
--
ALTER TABLE `import_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `instruct`
--
ALTER TABLE `instruct`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `history_pay`
--
ALTER TABLE `history_pay`
  ADD CONSTRAINT `FK3uqapx8urdm829chr0p30d0y2` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`);

--
-- Các ràng buộc cho bảng `import_product`
--
ALTER TABLE `import_product`
  ADD CONSTRAINT `FKrb4pegepmxt4xa1n8dmw5mtwv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FK50hypf4gj5aqm6glk0prt0pmt` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `FKc8jotskr93810vgn75qlbusw2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `invoice_detail`
--
ALTER TABLE `invoice_detail`
  ADD CONSTRAINT `FKbe6c21nke5fy4m3vw00f23qsf` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKit1rbx4thcr6gx6bm3gxub3y4` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `product_comment`
--
ALTER TABLE `product_comment`
  ADD CONSTRAINT `FKf0dvop3xf5orf5j8icdwnq5ak` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKkg61diec02rh2o3xt4hjiy5u0` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
