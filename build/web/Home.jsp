<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:include page="Header.jsp"></jsp:include>

            <div class="container-fluid pt-3">
                <div class="container animate-box" data-animate-effect="fadeIn">
                    <div>
                        <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4 ymm-arial"><a href="category?MaLoai=19">Tin tức</a></div>
                    </div>
                    <div class="owl-carousel owl-theme js" id="slider1">
                    <c:forEach items="${listN}" var="m">
                        <div class="item px-2">
                            <div class="fh5co_latest_trading_img_position_relative">
                                <div class="fh5co_latest_trading_img"><img src="${m.hinhAnh}" class="fh5co_img_special_relative"/></div>
                                <div class="fh5co_latest_trading_img_position_absolute"></div>
                                <div class="fh5co_latest_trading_img_position_absolute_1">
                                    <a href="detail?MaBaiViet=${m.maBaiViet}" class="text-white ymm-arial"> ${m.tenBaiViet} </a>
                                    <div class="fh5co_latest_trading_date_and_name_color ymm-arial"> <fmt:formatDate value="${m.ngayTao}" pattern="dd/MM/yyyy" /></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach> 
                </div>
            </div>
        </div>
        <div class="container-fluid pb-4 pt-5">
            <div class="container animate-box">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4 ymm-arial"><a href="category?MaLoai=20">Nhạc</a></div>
                </div>
                <div class="owl-carousel owl-theme" id="slider2">
                    <c:forEach items="${listS}" var="m">
                        <div class="item px-2">
                            <div class="fh5co_hover_news_img">
                                <div class="fh5co_news_img"><img src="${m.hinhAnh}" alt="thumbnail"/></div>
                                <div>
                                    <a href="detail?MaBaiViet=${m.maBaiViet}" class="d-block fh5co_small_post_heading" style="padding-top: 10px"><span class="ymm-title-post">${m.tenBaiViet}</span></a>
                                    <div class="c_g ymm-arial"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${m.ngayTao}" pattern="dd/MM/yyyy" /></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="container-fluid fh5co_video_news_bg pb-4">
            <div class="container animate-box" data-animate-effect="fadeIn">
                <div>
                    <div class="fh5co_heading fh5co_heading_border_bottom pt-5 pb-2 mb-4 ymm-arial"><a href="category?MaLoai=5">Cover</a></div>
                </div>
                <div>
                    <div class="owl-carousel owl-theme" id="slider3">
                        <c:forEach items="${listVid}" var="m">
                            <div class="item px-2">
                                <div class="fh5co_hover_news_img">
                                    <div class="fh5co_hover_news_img_video_tag_position_relative">
                                        <div class="fh5co_news_img">
                                            <iframe width="347" height="200" src="https://www.youtube.com/embed/${m.video}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                        </div>
                                    </div>
                                    <div class="pt-2">
                                        <a href="detail?MaBaiViet=${m.maBaiViet}" class="d-block fh5co_small_post_heading fh5co_small_post_heading_1">
                                            <span class="ymm-arial">${m.tenBaiViet} </span></a>
                                        <div class="ymm-arial c_g"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${m.ngayTao}" pattern="dd/MM/yyyy" /></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid pb-4 pt-4 paddding">
            <div class="container paddding">
                <div class="row mx-0">
                    <div class="col-md-8 animate-box" data-animate-effect="fadeInLeft">
                        <div>
                            <div class="fh5co_heading fh5co_heading_border_bottom py-2 mb-4 ymm-arial">Bài viết</div>
                        </div>
                        <c:forEach items="${listP}" var="m">
                            <div class="row pb-4">
                                <div class="col-md-5">
                                    <div class="fh5co_hover_news_img">
                                        <div class="fh5co_news_img"><img href="detail?MaBaiViet=${m.maBaiViet}" src="${m.hinhAnh}" alt=""/></div>
                                        <div></div>
                                    </div>
                                </div>
                                <div class="col-md-7 animate-box">
                                    <a href="detail?MaBaiViet=${m.maBaiViet}" class="ymm-title-post">${m.tenBaiViet}</a> 
                                    </br>
                                    <a class="fh5co_mini_time py-3 ymm-arial"><fmt:formatDate value="${m.ngayTao}" pattern="dd/MM/yyyy" /></a>
                                    <div class="fh5co_consectetur">
                                        <p class="ymm-arial ymm-text-short1">${m.noiDung}</p> 
                                    </div>
                                    <c:if test="${sessionScope.acc.loaiTaiKhoan == 0}">
                                        <a href="like?aid=${m.maBaiViet}" style="text-decoration:none;margin-right: 10px; ">
                                            <span style='font-size:30px;'>&#128077;</span>
                                        </a>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <jsp:include page="RightBar.jsp"></jsp:include>
                    </div>
                <jsp:include page="PageList.jsp"></jsp:include>
                </div>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>
</html>
