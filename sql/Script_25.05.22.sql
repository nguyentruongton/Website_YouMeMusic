USE [master]
GO
/****** Object:  Database [BlogYMM]    Script Date: 25.05.2022 23:52:37 ******/
CREATE DATABASE [BlogYMM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BlogYMM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BlogYMM.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BlogYMM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BlogYMM_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BlogYMM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BlogYMM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BlogYMM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BlogYMM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BlogYMM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BlogYMM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BlogYMM] SET ARITHABORT OFF 
GO
ALTER DATABASE [BlogYMM] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BlogYMM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BlogYMM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BlogYMM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BlogYMM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BlogYMM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BlogYMM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BlogYMM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BlogYMM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BlogYMM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BlogYMM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BlogYMM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BlogYMM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BlogYMM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BlogYMM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BlogYMM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BlogYMM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BlogYMM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BlogYMM] SET  MULTI_USER 
GO
ALTER DATABASE [BlogYMM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BlogYMM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BlogYMM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BlogYMM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BlogYMM] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BlogYMM]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiViet] [nvarchar](255) NULL,
	[NoiDung] [ntext] NULL,
	[NgayTao] [date] NULL,
	[HinhAnh] [varchar](255) NULL,
	[Video] [text] NULL,
	[MaLoai] [int] NOT NULL,
	[MaTaiKhoan] [int] NOT NULL,
	[Khac] [varchar](255) NULL,
 CONSTRAINT [PK_BaiViet] PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BaiYeuThich]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiYeuThich](
	[MaTaiKhoan] [int] NULL,
	[MaBaiViet] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[MaTaiKhoan] [int] NOT NULL,
	[MaBaiViet] [int] NOT NULL,
	[NoiDung] [nvarchar](255) NULL,
	[NgayTaoBL] [date] NULL,
 CONSTRAINT [PK__BinhLuan__87CB66A08C12A04F] PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLienHe] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[Email] [varchar](255) NULL,
	[ChuDe] [nvarchar](100) NULL,
	[NoiDung] [ntext] NULL,
 CONSTRAINT [PK__LienHe__0E73388A68A74C53] PRIMARY KEY CLUSTERED 
(
	[MaLienHe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiBaiViet]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBaiViet](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
 CONSTRAINT [PK__LoaiBaiV__730A5759FC0D56CD] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NoiBat]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NoiBat](
	[MaNoiBat] [int] NOT NULL,
	[TenNoiBat] [nvarchar](255) NULL,
	[NgayDang] [date] NULL,
	[HinhAnh] [varchar](255) NULL,
	[NoiDung] [nvarchar](255) NULL,
	[Video] [varchar](255) NULL,
	[Khac] [varchar](255) NULL,
 CONSTRAINT [PK_NoiBat] PRIMARY KEY CLUSTERED 
(
	[MaNoiBat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 25.05.2022 23:52:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TenDangNhap] [varchar](100) NULL,
	[MatKhau] [varchar](100) NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](255) NULL,
	[LoaiTaiKhoan] [int] NULL,
 CONSTRAINT [PK__TaiKhoan__AD7C65299B1072BA] PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (5, N'Lý do BIGBANG có nhiều người hâm mộ là nam giới', N'<b>BIGBANG thực sự là một người đi đầu xu hướng và đã tự đặt mình vào danh sách những nhóm nhạc huyền thoại nhất trong ngành công nghiệp K-pop.</b>
</br>
Trong lịch sử phát triển của mình, BIGBANG đã phát hành vô số ca khúc hit và thu hút được nhiều người hâm mộ từ khắp nơi trên thế giới. Bản thân BIGBANG đã trở thành một thương hiệu và tiếp tục có nhiều ảnh hưởng trong ngành công nghiệp âm nhạc.
</br>
Bất chấp 4 năm gián đoạn hoạt động với tư cách là một nhóm, BIGBANG đã đạt được những kỷ lục với đĩa đơn mới nhất của họ, "Still Life". Ngay cả sau khi tạm dừng hoạt động trong lĩnh vực âm nhạc, nhóm vẫn đạt được "Perfect All Kill" khi đứng đầu tất cả các bảng xếp hạng âm nhạc lớn ở Hàn Quốc.
</br>
Với sự nổi tiếng vô cùng lớn, BIGBANG đã trở thành biểu tượng mà người hâm mộ mong muốn trở thành giống như họ. Bởi vì khía cạnh này, có vẻ như BIGBANG có rất nhiều fan nam so với các nhóm nhạc nam khác.
</br>
Cư dân mạng đã bàn luận về lý do BIGBANG có nhiều fan nam và chủ đề này đang được bàn tán sôi nổi. Theo đó, những lý do được đưa ra gồm có: "Hình ảnh của BIGBANG là điều mà các chàng trai muốn đạt được. Đó là hình ảnh nam tính nhưng lạ mắt. BIGBANG có hình ảnh hoàn hảo mà các chàng trai cho là tuyệt", "Các bài hát hay và hình ảnh của G-Dragon cực kỳ ngầu đó là lý do tại sao", "Đó là bởi vì các bài hát hay và hợp thời trang", "Các bài hát phù hợp với thị hiếu của các chàng trai và chúng thực sự hợp thời trang", " Họ thực sự có kỹ năng tốt, đó là lý do tại sao "," Họ thực sự sành điệu và họ được tôn trọng"... ', CAST(N'2022-05-13' AS Date), N'https://kenh14cdn.com/203336854389633024/2022/5/13/photo2022-05-1309-53-44-16524104585611767408957.jpg', N'eN5mG_yMDiM', 19, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (6, N'Loạt hint rõ rành rành chứng minh màn trở lại của BLACKPINK đang đến rất gần, mặc lời phủ nhận của YG!', N'<b>Sau pha phủ nhận với truyền thông ngày 27/4 từ YG, BLINK lại nhận thêm một hint BLACKPINK comeback nữa.</b>
</br>
Công ty giải trí khiến dân tình cảm thấy "ức chế" nhất hiện tại chắc chắn gọi tên YG. Không vì nỗi gì, chỉ vì lịch comeback của idol YG được quý công ty cho xài "lịch sao hoả" nên chờ idol trở lại không khác gì chờ idol xuất ngũ. Và fandom nếm trải sự "ức chế" này nhiều nhất chính là BLINK.
</br>
Dù theo dõi idol với lịch trình khó nắm bắt, để idol "ngủ đông" của công ty chủ quản, nhưng BLINK vẫn rất kiên nhẫn chờ đợi 4 cô gái tái xuất. Gần đây, loạt thính chất lượng về màn comeback của BLACKPINK xuất hiện ngày càng nhiều, tiếp thêm sức mạnh cho fan đợi đến ngày được "hái quả ngọt".
</br></br>
<b>Jennie nhuộm tóc cam</b></br></br>
Chỉ trong tháng 4 này, đếm sương sương cũng dễ đến ... lần BLINK vui sướng vì các hint comeback đáng tin tưởng. Bắt đầu từ khi Jennie "đảo ngói", đổi từ màu tóc tối gắn bó lâu nay sang màu cam chói lọi rực rỡ. Theo lý lẽ bình thường, idol cứ nhuộm tóc mới màu nổi là sẽ comeback, thì Jennie cũng không ngoại lệ. Nhìn màu tóc mới rực cháy của cô nàng main rapper, fan càng có lý do tin tưởng BLACKPINK comeback.
</br></br>
<b>Jisoo đến phòng thu The Black Label</b></br></br>
Trong khi Jennie ở Mỹ thì chị cả Jisoo ở Hàn Quốc hé lộ hình ảnh đến phòng thu The Black Label. Hình ảnh này chính là hint đáng tin nhất khi mỗi lần các cô nàng BLACKPINK đến phòng thu của Teddy, là một lần sản phẩm mới được chuẩn bị. Chị cả Jisoo cũng chưa từng khiến fan thất vọng khi các "thính" mà cô nàng thả đều rất uy tín.
</br></br>
<b>Báo cáo hàng năm của YG</b></br></br>
Trong báo cáo hàng năm của YG cũng có đề cập, nửa cuối năm 2022 tầm tháng 7 sau khi WINNER và iKON comeback hoàn tất, BLACKPINK sẽ trở lại với sản phẩm mới chưa rõ hình thức. Đồng thời, nhóm có thể sẽ có các tour diễn và Jennie là thành viên cuối cùng có lịch trình cá nhân tại nước ngoài. Đây là thông tin giúp BLINK khẳng định được thần tượng sẽ trở lại trong thời gian sắp tới.</br></br>
<b>Bộ đôi biên đạo - dancer quen thuộc của BLACKPINK check-in phòng tập YG</b></br></br>
Mới đây, dancer nổi tiếng Leejung đã update Instagram cùng biên đạo Kiel Tutin. Đây là bộ đôi dancer - biên đạo quen thuộc góp mặt trong các dự án của BLACKPINK. Các fan soi ra địa điểm bộ đôi này check-in chính là phòng tập của YG. Có thêm một hint này, BLINK càng có lý do tin tưởng BLACKPINK sẽ comeback trong nay mai.
</br></br>
Dù gần đây, YG đã phủ nhận truyền thông Hàn Quốc khi đưa tin BLACKPINK có lịch trình trở lại trong tháng 6 nhưng fan vẫn hi vọng BLACKPINK sẽ sớm comeback với loạt hint chất lượng thế này!', CAST(N'2022-05-13' AS Date), N'https://kenh14cdn.com/203336854389633024/2022/4/30/photo1651288163841-1651288164099804066803.jpeg', N'', 19, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (7, N'Binz “rực cháy” giữa mùa hè 2022 tại music tour của Đại học FPT', N'<b>Binz sẽ góp mặt trong music tour của ĐH FPT, khởi đầu vào ngày 11/6 tại Đà Nẵng, tiếp đó là Hà Nội vào ngày 1/7 và khép lại tại chung kết Học bổng tài năng tại ĐH FPT AI Quy Nhơn vào ngày 23/7 để giao lưu với hàng chục nghìn HSSV.</b>
</br>
Vừa qua, thông tin "trai phố" Binz sẽ đi cùng Đại học FPT trong chuyến music tour toàn quốc đã khiến cộng đồng yêu rap tại Việt Nam, đặc biệt là các rap fan của anh chàng đứng ngồi không yên. Tour diễn này kéo dài trong 2 tháng được tổ chức như một đại tiệc âm nhạc, tặng vé miễn phí chiêu đãi những người mê rap.
</br>
Với sự góp mặt của Binz, đại nhạc hội cho HSSV tại campus của ĐH FPT sẽ được khởi động tại ĐH FPT tại Đà Nẵng ngày 11/6, ĐH FPT tại Hà Nội ngày 1/7 và khép lại ở ĐH FPT tại Quy Nhơn vào ngày 23/7. Đồng thời nam rapper sẽ là nhân vật quan trọng, đóng lại đêm chung kết chương trình Học bổng tài năng tại Đại học FPT campus Quy Nhơn.
</br>
Ngay sau khi có xác nhận chính thức từ hai bên, dàn thí sinh của cuộc thi Học bổng tài năng ĐH FPT năm nay hào hứng khi nắm chắc một vé gặp Binz, thậm chí còn mong có cơ hội được đứng chung sân khấu với nam rapper. Đồng thời, hàng chục nghìn bạn trẻ cũng tìm cách săn lùng tấm vé giới hạn tại các fanpage của Đại học FPT trên toàn quốc. Không ai muốn bỏ lỡ cơ hội đến gần hơn với thần tượng, cùng nhau "cháy hết mình" trong một không gian tôn vinh nhạc rap với những bản hit làm nên tên tuổi của anh chàng hào hoa bậc nhất làng rap Việt.
</br>
Hơn một thập kỷ kể từ ngày đặt những bước chân đầu tiên vào làng rap, Binz từng bước trở thành nghệ sĩ đương đại nổi tiếng ở dòng nhạc Rap/RnB/Soul/HipHop và khiến công chúng ghi nhận trong nhiều vai trò như rapper, nhạc sĩ, nhà sản xuất âm nhạc nổi tiếng của showbiz Việt. Anh cũng được khán giả yêu mến qua nhiều tác phẩm âm nhạc độc đáo, trendy cùng phong cách thời trang và ngoại hình "cool ngầu", hình tượng "bad boy" cuốn hút.
</br>
Tại chương trình của Đại học FPT, chàng rapper không chỉ hâm nóng bầu không khí bằng những màn trình diễn công phu mà còn dành thời gian giao lưu cùng thí sinh Học bổng tài năng và các học sinh sinh viên giành được tấm vé tham dự chương trình năm nay. Những câu chuyện đời, chuyện nghề trong 14 năm đi tìm bản ngã, hoàn thiện một Binz như ngày hôm nay sẽ truyền cảm hứng tới người đam mê âm nhạc, đặc biệt là những người trẻ muốn theo đuổi lĩnh vực nghệ thuật. Đối với thí sinh cuộc thi Học bổng tài năng Đại học FPT, đây cũng là cơ hội để tự tin bước đi trên con đường mình đã chọn, bồi đắp tài năng và giành lấy cơ hội tỏa sáng dù là nhỏ nhất.', CAST(N'2022-05-14' AS Date), N'https://kenh14cdn.com//pr/2022/photo1652330479675-16523304802361521086344-63787956718884.jpg', N'', 19, 1, N'<img style="width: 100%" src="https://channel.mediacdn.vn/428462621602512896/2022/5/12/photo-1-1652330506167515200808.jpg">')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (8, N'Đen Vâu lên tiếng khi lời bài rap mới gây tranh cãi: "Việc ngắt lời riêng từng đoạn làm cho mọi người hiểu khác đi ý nghĩa là điều đáng tiếc"', N'<b>Đen Vâu đã chính thức lên tiếng xoay quanh loạt ồn ào về lời bài hát Đi Trong Mùa Hè.</b>
</br>
Sản phẩm âm nhạc vừa ra mắt của Đen Vâu - Đi Trong Mùa Hè - liên tiếp "gây bão" những ngày vừa qua. Bên cạnh việc trở thành sản phẩm âm nhạc thứ 13 đạt top 1 trending YouTube của Đen Vâu thì Đi Trong Mùa Hè nhận về không ít luồng ý kiến tranh cãi xoay quanh lời bài hát cũng như cách thức truyền tải thông điệp.
</br>
Theo đó ở ngay phần đầu ca khúc, câu rap "Đối thủ cũng như là người tình, bám theo mình theo cách đầy vấn vương. Nhưng người tình thì mong cho mình khoẻ, còn đối thủ thì muốn mình chấn thương" khiến một số ý kiến cho rằng Đen Vâu đang định hướng sai góc nhìn của khán giả về "tinh thần thể thao" mà anh muốn truyền tải trong MV.
</br>
Việc khẳng định "đối thủ muốn mình chấn thương" làm cộng đồng mạng cho rằng nếu hành động phi thể thao xảy ra thì cần lên án thay vì đưa vào một sản phẩm mang tính cổ động một cách "bình thường hoá".
</br>
Bên cạnh đó, đoạn rap "Lời em nói theo thống kê xác suất, tỷ lệ một phần triệu biến anh thành người vũ phu", "Ở trên mạng anh là phe ôn hoà, đôi khi về nhà anh là phe bảo thủ" hay "Em mà chuyển kênh, anh sẽ từ một cậu bé, hóa thân thành..." đã dấy lên tranh cãi lớn trên mạng xã hội khi bị đánh giá là cổ xúy bạo lực gia đình. Hình ảnh người đàn ông vũ phu, bảo thủ được Đen Vâu đưa vào lyrics như chuyện bình thường trong xã hội ngày nay.
</br>
Đó là ý tứ mở đầu cho phân đoạn rap thứ 3, khi tâm lý anh chàng này “mạnh mồm” với vợ để thể hiện tình yêu bóng đá của mình. Đen Vâu chia sẻ chi tiết hơn như sau: “Đen có ý tưởng viết đoạn này là từ gia đình một anh chị hàng xóm yêu bóng đá gần sát nhà. Sau khi viết xong cũng đã hỏi cảm nghĩ của một số người xem cảm cảm nhận của mọi người như thế nào? Mọi người nói rằng cũng giống như đa số gia đình nhỏ khác, hầu như ông chồng “sợ vợ” nào cũng “mạnh mồm” như thế chứ không phải là “nói quá”.
</br>
Ở những gia đình như vậy, chị vợ là “chủ nhà”, anh chồng nghe lời vợ mọi chuyện, chỉ duy nhất có một điều là với anh ấy, đội tuyển Việt Nam là vô địch - dù ai nói thế nào đi chăng nữa, và đó là điều duy nhất anh ấy dám “phản kháng” với vợ. Nhưng anh chồng cũng chỉ là “mạnh mồm” phản kháng thế thôi (“tỷ lệ một phần triệu biến anh thành người vũ phu”) chứ thật ra không dám làm gì. Ý tứ này được thể hiện rõ hơn ở câu bè “anh đùa đấy” (thể hiện anh ta chỉ “mạnh mồm” đùa với vợ thôi)".
</br>
Nói rõ hơn về cụm từ "bảo thủ", Đen Vâu nhấn mạnh: "Còn cụm từ “bảo thủ” ở đây có nghĩa là dù ai - kể cả vợ - có nói gì đi chăng nữa thì trong tim anh ấy, “Việt Nam vô địch, Việt Nam muôn năm” là không bao giờ thay đổi. Lúc viết, Đen cũng đã tưởng tượng MV sẽ có phân cảnh gia đình hài hước như vậy, người chồng làm tất cả mọi việc trong nhà và tới giờ bóng lăn thì chị vợ mới cho phép được xem tivi, nhưng vì nhiều lý do mà phần kịch bản này không được đưa vào MV.
</br>
Thông điệp của đoạn này thực ra rất đơn giản là: bất kỳ người Việt Nam nào, kể cả những “anh chồng sợ vợ” cũng luôn hướng tới đội tuyển Việt Nam với một niềm tin mạnh mẽ là “Việt Nam vô địch, Việt Nam muôn năm”.', CAST(N'2022-05-14' AS Date), N'https://kenh14cdn.com//203336854389633024/2022/5/11/photo1652285735678-1652285736151707030588.jpg', N'', 19, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (10, N'Nữ sinh 2k3 cover hit của Hoàng Thùy Linh đạt 8 triệu view chưa đầy 1 ngày', N'<b>Bản cover của cô nàng 2k3 mới đây đã khiến cư dân mạng phát sốt.</b>
</br>
Mới đây cộng đồng mạng đang truyền tay clip một cô gái cover ca khúc See Tình của Hoàng Thuỳ Linh tại chương trình Bữa Trưa Vui Vẻ phát sóng vào tháng 3 vừa qua.

Đáng chú ý, đoạn clip chỉ mới lên sóng chưa đầy 1 ngày nhưng đã đạt hơn 8 triệu view trên một kênh TikTok và thu hút hàng nghìn lượt bình luận. Thậm chí có bình luận còn khẳng định "đã tìm được bản gốc" hay tưởng đây chính là giọng gốc của ca khúc See Tình.', CAST(N'2022-05-14' AS Date), N'https://kenh14cdn.com/203336854389633024/2022/4/11/chrome-capture-68-16496469536741208478101.gif.png', N'AT9ooDUWLNQ', 5, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (11, N'Rosé (BLACKPINK) bất ngờ cover hit khủng của ban nhạc vừa collab với BTS', N'<b>Nhân dịp sinh nhật lần thứ 25, Rosé đã biến giọng hát của mình thành món quà đặc biệt dành tặng người hâm mộ.</b>
</br>
Ngày 11/2/2022 đánh dấu thời khắc Rosé bước sang tuổi 25 (theo tuổi quốc tế). Không có gì ngạc nhiên khi BLINK trên toàn thế giới dành cho cô những lời chúc tốt lành và dự án kỷ niệm sinh nhật vô cùng hoành tráng, nhưng giọng ca chính BLACKPINK không chỉ ngồi yên đón nhận mà còn tặng quà ngược lại fan. Món quà của cô chính là bản cover ca khúc Viva La Vida của Coldplay - ban nhạc nước Anh vừa có màn collab cực thành công với BTS.', CAST(N'2022-05-15' AS Date), N'https://kenh14cdn.com/203336854389633024/2022/2/11/tai-xuong-52-1644517028014468061407.gif.png', N'mX8rMMS-MbI', 5, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (12, N'SƠN TÙNG M-TP | THERE''S NO ONE AT ALL | Su Cover', N'Follow Instagram của Su:
<a href="https://www.instagram.com/suthejingle" target="_blank">Link IG</a>', CAST(N'2022-05-15' AS Date), N'https://i.imgur.com/goF5yLw.jpg', N'GBkfJ7NyG7k', 5, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (13, N'Mashup X4 : Hơn 10 bài nhạc HOT trên Tik Tok (Về nghe mẹ ru,...) - ChangMie x Tiến Tới', N'', CAST(N'2022-05-15' AS Date), N'https://i.imgur.com/wUadEVD.jpeg', N'HJTOKJgdEfk', 5, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (15, N'Người Ấy (The First Show) - Trịnh Thăng Bình', N'<b>Lời bài hát: Người Ấy (The First Show)</b></br>
Nhạc sĩ: Trịnh Thăng Bình<br>
Hôm qua anh thấy...
<br>Ôi người ấy, đang trong tay với cô nào đấy?
<br>Giật mình nhận ra không phải em,
<br>Chẳng biết em bây giờ đang ở đâu?
<br>Bao lâu ta đã không gặp nhau?
<br>Bao lâu chưa hỏi thăm vài câu?
<br>Nào ngờ hôm nay anh thấy thế này.
<br>Chẳng biết phải nên làm gì đây?
<br>Chưa 1 lần anh hết thắc mắc, sao em lìa xa anh này?
<br>Để tiếp tục con đường yêu bên cạnh người ấy.
<br>Chưa 1 lần anh ngưng suy nghĩ, anh đã làm sai điều gì?
<br>Hay là còn điều gì anh chưa bằng người ấy?
<br>Người ấy có tốt với em, yêu em như anh đã từng yêu?
<br>Người ấy có biết tính em hay trách móc, thích nuông chiều?
<br>Anh nhớ em nhiều... Anh nhớ em nhiều...
<br>Sao để lòng vơi bớt đi bao đêm đợi mong?
<br>Người ấy có lớn tiếng hay luôn khiến em đau buồn không?
<br>Người ấy có biết quý em hay yêu thương em thật lòng?
<br>Anh nhớ em nhiều... Anh nhớ em nhiều...
<br>Sao cho lòng vơi bớt đi nỗi buồn, nỗi đau trong lòng anh.', CAST(N'2022-05-15' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/05/13/d/e/3/3/1652436625860_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/mh/normal/WmmP8dIWI4VJ" width="620" height="382" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (17, N'V-POP 2022: Hot Comeback - V.A', N'', CAST(N'2022-05-15' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/05/12/f/7/c/e/1652342884101_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/lh/normal/GgM5HUi7MPq0" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (18, N'EDM Hits Rewind - V.A', N'', CAST(N'2022-05-15' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2021/06/17/1/0/8/0/1623923626841_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/lh/normal/tp43zjpg04lI" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (19, N'C-POP Today''s Top Hits - V.A', N'', CAST(N'2022-05-15' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/05/13/d/e/3/3/1652434289743_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/lh/normal/oLviiOPmTR6G" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (20, N'Nhạc Mới Phát Hành 2022 - V.A', N'', CAST(N'2022-05-15' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/05/13/d/e/3/3/1652434150552_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/lh/normal/xS2h6nOn7sF9" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (21, N'LIÊN KHÚC PIANO COVER JUSTATEE', N'<a href="http://metub.net/ancoongpiano" target="_blank">♫ Click Đăng Kí </a>Để Xem Video Mới Nhất của An Coong nhé.', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/LvaLe6Z.jpg', N'DhoFIXWhysM', 3, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (22, N'Endless Love (The Myth OST) - Jackie Chan ft. Kim Hee Seon | PIANO COVER', N'<a href="http://metub.net/ancoongpiano" target="_blank">♫ Click Đăng Kí </a>Để Xem Video Mới Nhất của An Coong nhé.', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/jIb19Vs.jpg', N'6fXEsroBpEU', 3, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (23, N'BIGBANG - Haru Haru | Piano Cover', N'<a href="http://metub.net/ancoongpiano" target="_blank">♫ Click Đăng Kí </a>Để Xem Video Mới Nhất của An Coong nhé.', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/vXkPLG2.jpg', N'gqlJInFQAhU', 3, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (24, N'NƠI NÀY CÓ ANH - SƠN TÙNG M-TP | PIANO COVER', N'<a href="http://metub.net/ancoongpiano" target="_blank">♫ Click Đăng Kí </a>Để Xem Video Mới Nhất của An Coong nhé.', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/nbmCDtl.jpg', N'ZzRKtUK-hlw', 3, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (25, N'K-ICM tuyên bố sẽ tạm dừng mọi hoạt động kể từ hôm nay!', N'<b>Dòng trạng thái trưa 25/5 của K-ICM khiến nhiều khán giả vô cùng hoang mang.</b>
<br>
Trưa 25/5, K-ICM đã khiến toàn thể khán giả bất ngờ khi thông báo kể từ hôm nay, anh sẽ tạm dừng mọi kế hoạch và hoạt động. Lí do anh đưa ra xoay quanh vấn đề sức khỏe không cho phép. 
<br>
Thông báo trên cũng cho biết những dự án được K-ICM ấp ủ trong năm nay bao gồm album Hoa (kết hợp với Phương Thanh, Trung Quân, Văn Mai Hương, Bùi Anh Tuấn, Đồng Lan) cũng như các dự án MV khác cũng sẽ tạm hoãn. Nam producer cho biết anh vô cùng buồn và tiếc nuối khi đưa ra quyết định này.
<br>
K-ICM qua đó gửi lời xin lỗi đến toàn bộ đối tác và cho biết những công việc đang dang dở sẽ được ekip của anh cố gắng hoàn thiện trong khả năng cho phép. Những công việc cần sự có mặt trực tiếp, K-ICM cũng cho biết sẽ gác lại để chờ sức khỏe hồi phục. 
<br>
Nam producer cũng chia sẻ rằng khi tình hình sức khỏe cho phép, anh sẽ mau chóng trở lại với âm nhạc tuy nhiên không xác định thời gian là bao lâu. Bức thư khiến toàn thể cộng đồng người hâm mộ K-ICM vô cùng lo lắng.', CAST(N'2022-05-25' AS Date), N'https://kenh14cdn.com//203336854389633024/2022/5/25/photo1653463075770-165346307603749276388.jpg', N'', 19, 1, N'<img src="https://kenh14cdn.com/203336854389633024/2022/5/25/k-16534628219751367650514.png">')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (26, N'Michael Jackson - Billie Jean (Alexandr Misko) (Fingerstyle Guitar)', N'* Get my Tabs, Merch and Albums exclusively on <a href="https://alexandrmisko.com/shop" target="_blank">https://alexandrmisko.com/shop *</a>
<br>
The TABS for Billie Jean are available on <a href="https://www.musicnotes.com/l/6MTQZ" target="_blank">https://www.musicnotes.com/l/6MTQZ</a>', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/Q0le3pc.jpg', N'Jx4okVd3K14', 1, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (27, N'(Charlie Puth) Attention - Josephine Alexandra | Fingerstyle Guitar Cover', N'First of all, sorry for not uploading in months because I''ve been sick and school is killing me -__- and me covering this song is like 4 months late, I know 😂 Actually, I thought I wouldn''t cover this song, but a lot of you asked for it.. so here it is! Well, better late than never 😏', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/wi1PKtH.jpg', N'aTgXgN9fOsk', 1, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (28, N'Believer - Imagine Dragons - Fingerstyle Guitar cover', N'Đây là bản chuyển soạn của tui cho bài Believer - Imagine Dragons!
Spotify: <a href="http://spoti.fi/2cIWGWh" target="_blank">http://spoti.fi/2cIWGWh</a>', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/D3BKHKg.jpg', N'hXQxSi34GWY', 1, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (29, N'[Guitar] Đảo phách với Có không giữ mất đừng tìm - Trúc Nhân', N'ANH EM NHỚ SUBSCRIBE KÊNH CỦA MÌNH ĐỂ XEM NGAY CÁC VIDEO MỚI NHẤT TẠI ĐÂY:
► SUBSCRIBE CHANNEL: <a href="http://bit.ly/Hienrau" target="_blank">http://bit.ly/Hienrau</a>', CAST(N'2022-05-25' AS Date), N'https://i.imgur.com/9lpEYfM.png', N'aKyzMaZSw8I', 1, 1, N'')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TenBaiViet], [NoiDung], [NgayTao], [HinhAnh], [Video], [MaLoai], [MaTaiKhoan], [Khac]) VALUES (30, N'hai mươi hai (22) - Hứa Kim Tuyền, AMEE', N'<b>Lời bài hát: hai mươi hai (22)</b>
<br>
Nhạc sĩ: Hứa Kim Tuyền 
<br>
"Cuộc đời này là màu hồng" - mẹ nói lúc con ra đời
<br>"Mỉm cười là điều tuyệt vời" - mẹ nói lúc con lên 5
<br>Dù răng con sún, chân không dài, vai chẳng thon
<br>Mặt Trời còn dẹt một phần mà sao thế gian luôn cần?
<br>"Hãy làm điều mình tự hào" - mẹ nói lúc con lên 10
<br>"Đừng làm điều mình ngần ngại" - mẹ nói lúc con 12
<br>Dù cho đôi lúc, con sai đường và quên lối đi
<br>Trưởng thành là điều tuyệt vời để từ sai ta học cho đúng.
<br>Sau này năm con 22 sẽ thấy màu mắt của con thật xinh
<br>Thấy giọng ca ngân nga trong vắt có khi lại khiến con rất đặc biệt
<br>Và hãy nhớ rằng trên đời này
<br>Không ai phải giống ai
<br>Nên là năm con 22
<br>Hãy sống hồn nhiên giống như mưòi hai
<br>Tình đầu là điều tuyệt vời mà con khắc ghi suốt đời.
<br>Từng chạm và từng dịu dàng làm tim của con rối bời
<br>Đừng quan tâm quá con sẽ cùng cậu ta đến đâu
<br>Kỉ niệm là điều ở lại dù ai có không quay lại.
<br>Sau này năm con 22 hãy vang lời ca của con muôn nơi
<br>Mang tình yêu thương con đang giữ nhân ra tỏa khắp muôn phương chân trời.
<br>Sẽ thật khó vì có đôi lần con sẽ cảm thấy chơi vơi
<br>Nhưng chẳng sao khi con cho đi
<br>Phía sau đừng nghĩ sẽ nhận lại gì.
<br>Hai mươi hai, hai mươi hai, hai mươi hai
<br>Địa cầu là một hình tròn vậy nên thế gian xoay vòng
<br>Điều mình nhận được là điều mình vô thức đã cho đi
<br>Vậy nên sau nếu con có rời xa chốn đây
<br>Đừng sợ và đừng chần chờ vì đi cũng là để trở về.
', CAST(N'2022-05-25' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/05/25/7/5/b/9/1653461243886_org.jpg', N'', 20, 1, N'<iframe src="https://www.nhaccuatui.com/mh/normal/kvyyApgfnHC3" width="620" height="382" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
INSERT [dbo].[BaiYeuThich] ([MaTaiKhoan], [MaBaiViet]) VALUES (13, 13)
INSERT [dbo].[BaiYeuThich] ([MaTaiKhoan], [MaBaiViet]) VALUES (13, 7)
INSERT [dbo].[BaiYeuThich] ([MaTaiKhoan], [MaBaiViet]) VALUES (14, 12)
INSERT [dbo].[BaiYeuThich] ([MaTaiKhoan], [MaBaiViet]) VALUES (13, 11)
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (2, 13, 7, N'But baby don''t break my heart...', CAST(N'2022-05-14' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (3, 13, 12, N'Why whyyyy', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (4, 13, 10, N'Uây uây uây', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (5, 14, 8, N'Đi trong mùa hè', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (6, 14, 20, N'Put your hands up', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (7, 14, 13, N'Có khó khăn thế nào cũng chẳng sao đâu mà...', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (8, 14, 7, N'Big City Boiiii', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (9, 14, 18, N'Alan đi bộ', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (10, 16, 15, N'Người ấy...', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (11, 16, 12, N'Don’t wanna make up
Don’t wanna make up
Headstrong
Gonna wake up
So long
I kinda died hard
And grew
Seeing that part
Of you 
I never knew love
Somehow
Pretty sick of
That vow
Swallowing down
That pain
Wearing the crown
Unchained', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (12, 1, 12, N'There’s no one at all
Ah ah ah
There’s no one at all
Ah ah ah', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (13, 14, 8, N'Cái nữa', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (14, 13, 12, N'Cái nữa', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (15, 13, 8, N'Đi theo bóng mặt trời', CAST(N'2022-05-16' AS Date))
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [MaTaiKhoan], [MaBaiViet], [NoiDung], [NgayTaoBL]) VALUES (16, 1, 8, N'Ngày khác lạ', CAST(N'2022-05-16' AS Date))
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaLienHe], [Ten], [Email], [ChuDe], [NoiDung]) VALUES (17, N'NTT', N'ntt@gmail.com', N'NTT', N'NTT')
INSERT [dbo].[LienHe] ([MaLienHe], [Ten], [Email], [ChuDe], [NoiDung]) VALUES (18, N'Lê Bảo Ngọc', N'baongoc@gmail.com', N'[Quảng cáo] Chia sẻ bài hát mới', N'Mình muốn....')
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[LoaiBaiViet] ON 

INSERT [dbo].[LoaiBaiViet] ([MaLoai], [TenLoai]) VALUES (1, N'Ghi ta')
INSERT [dbo].[LoaiBaiViet] ([MaLoai], [TenLoai]) VALUES (3, N'Piano')
INSERT [dbo].[LoaiBaiViet] ([MaLoai], [TenLoai]) VALUES (5, N'Cover')
INSERT [dbo].[LoaiBaiViet] ([MaLoai], [TenLoai]) VALUES (19, N'Tin tức')
INSERT [dbo].[LoaiBaiViet] ([MaLoai], [TenLoai]) VALUES (20, N'Nhạc')
SET IDENTITY_INSERT [dbo].[LoaiBaiViet] OFF
INSERT [dbo].[NoiBat] ([MaNoiBat], [TenNoiBat], [NgayDang], [HinhAnh], [NoiDung], [Video], [Khac]) VALUES (1, N'Đây Là Rap Việt', CAST(N'2022-05-05' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/04/26/5/5/5/3/1650971762155_org.jpg', N'Gò má anh ta bỗng hạ xuống, sau khi mở cửa vào nhà
Nực cười những thứ cuộc đời muốn, lại khiến nước mắt anh trào ra
Kim ngắn đồng hồ vào 3, suy nghĩ của anh lại ra 7
Ném vào tủ chiếc áo da "Sao cuộc đời lại đối xử tao như vậy?"', N'', N'<iframe src="https://www.nhaccuatui.com/lh/auto/Z6a59Zipe3uM" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[NoiBat] ([MaNoiBat], [TenNoiBat], [NgayDang], [HinhAnh], [NoiDung], [Video], [Khac]) VALUES (2, N'SERIES ''O'' [ROUND 3 : WHOLE] - VERIVERY', CAST(N'2022-05-01' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/04/21/7/c/3/5/1650531855259_org.jpg', N'오직 나만 포착한 Action
사로잡혔을 뿐이지
Don''t stop
가로놓인
황홀함에 뛰어들겠어
넌 아찔하게도 웃지
천진난만한 표정 속
언젠가 있었던 잔상과 현실이 뒤섞여
데려온 너', NULL, N'<iframe src="https://www.nhaccuatui.com/lh/auto/Hi7Prdpbddr1" width="620" height="587" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[NoiBat] ([MaNoiBat], [TenNoiBat], [NgayDang], [HinhAnh], [NoiDung], [Video], [Khac]) VALUES (3, N'Gửi Em - Hoa Vinh', CAST(N'2022-05-02' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/04/25/2/b/f/f/1650854992246_org.jpg', N'Em nói em còn ngây dại
Em nói em sợ ba mẹ
Em nói anh còn rất nhiều
Nhiều người yêu Anh

Anh nói anh sẽ chở che
Anh nói anh sẽ thưa chuyện
Anh nói anh cũng rất nhiều
Nhiều người thua em', NULL, N'<iframe src="https://www.nhaccuatui.com/mh/auto/xrnkujBDqTD8" width="620" height="382" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[NoiBat] ([MaNoiBat], [TenNoiBat], [NgayDang], [HinhAnh], [NoiDung], [Video], [Khac]) VALUES (4, N'Sao Tiếc Người Không Tốt - Vương Anh Tú', CAST(N'2022-05-03' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/04/26/5/5/5/3/1650972227119_org.jpg', N'Ghì tay gặng hỏi em đang thế nào, lòng em còn chưa biết trả lời ra sao
Ở kế bên anh nhưng lòng em có ai ?
Vậy thôi chào em anh không ở lại !
Lúc trước ngây dại nên cứ siết tay, cứ nghĩ thương em, em sẽ chịu ở đây
Nhưng anh đâu ngờ, người ta nói phải..', NULL, N'<iframe src="https://www.nhaccuatui.com/mh/auto/SoN58LNXZueL" width="620" height="382" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
INSERT [dbo].[NoiBat] ([MaNoiBat], [TenNoiBat], [NgayDang], [HinhAnh], [NoiDung], [Video], [Khac]) VALUES (5, N'Test', CAST(N'2022-05-05' AS Date), N'https://avatar-ex-swe.nixcdn.com/slideshow/2022/04/26/5/5/5/3/1650971762155_org.jpg', N'', N'', N'<iframe src="https://www.nhaccuatui.com/mh/auto/SoN58LNXZueL" width="620" height="382" frameborder="0" allowfullscreen allow="autoplay"></iframe>')
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [HoTen], [Email], [LoaiTaiKhoan]) VALUES (1, N'admin', N'123', N'Quản Trị Viên', N'admin@gmail.com', 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [HoTen], [Email], [LoaiTaiKhoan]) VALUES (13, N'truongton', N'123', N'Nguyễn Trường Tồn', N'tonhuyen2000@gmail.com', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [HoTen], [Email], [LoaiTaiKhoan]) VALUES (14, N'lhpt', N'1234', N'LH Phương Tùng', N'lhpt@gmail.com', 0)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [TenDangNhap], [MatKhau], [HoTen], [Email], [LoaiTaiKhoan]) VALUES (16, N'sontungmtp', N'123', N'Nguyễn Thanh Tùng', N'nguyenthanhtung@outlook.com', 0)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_LoaiBaiViet] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiBaiViet] ([MaLoai])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_LoaiBaiViet]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_TaiKhoan]
GO
ALTER TABLE [dbo].[BaiYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_BaiYeuThich_BaiViet] FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[BaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[BaiYeuThich] CHECK CONSTRAINT [FK_BaiYeuThich_BaiViet]
GO
ALTER TABLE [dbo].[BaiYeuThich]  WITH CHECK ADD  CONSTRAINT [FK_BaiYeuThich_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[BaiYeuThich] CHECK CONSTRAINT [FK_BaiYeuThich_TaiKhoan]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_BaiViet] FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[BaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_BaiViet]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TaiKhoan] FOREIGN KEY([MaTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([MaTaiKhoan])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TaiKhoan]
GO
USE [master]
GO
ALTER DATABASE [BlogYMM] SET  READ_WRITE 
GO
