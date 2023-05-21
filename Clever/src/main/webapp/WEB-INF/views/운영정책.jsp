<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>번개장터</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 고객센터 공통 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_service_common.css">
<!-- 운영정책 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/customer_service/customer_operational_policy.css">
<!-- 파비콘 -->
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/market/favicon.ico">

<!-- 화면 스크롤시 -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/customer_service/top_show_name.js"></script>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="./inc/header.jsp" />
	</header>	
    <!-- main_content 영역 -->
        <header>
        <div>
            <a href="customer_service.html">
                <i class="bi bi-chevron-left"></i>
            </a>
            <div id="top_menu_name">
                운영정책
            </div>
        </div>
    </header>

    <!-- wrapper 영역 -->
    <div id="wrapper">
        <h1>운영정책</h1>

        <div id="explain">
            번개장터 이용시<br>이것만은 지켜주세요.
        </div>
        <p>
            지키지 않을시 3아웃 정책에 의해 제재받을 수 있어요.
        </p>
        <div id="mid_img">
            <img src="${pageContext.request.contextPath }/resources/images/customer_service/warning.png" alt="경고창">
        </div>
        <div id="lists">
            <ul>
                <li><a href="#">금지 품목</a> 거래시,제재 받을 수 있어요.</li>
                <hr>
                <li>적절하지 않은 상품명, 이미지, 가격 등록 시 제재를 받을 수 있어요.</li>
                <hr>
                <li>외부 채널로의 연락 유도, 타사이트로의 결제 유도시 제재 받을 수 있어요.</li>
                <hr>
                <li>욕설 등 비매너 행위는 타인을 불쾌하게 해요.</li>
                <hr>
                <li>상품, 댓글, 번개톡에 도배는 안돼요.</li>
                <hr>
                <li>일반상점이 <a href="#">일반상점 판매제한상품</a>을 판매하면 제재 받을 수 있어요.</li>
            </ul>
        </div>
        <div id="policy_area">
            <h2>3아웃 정책이란?</h2>
            <p>번개장터의 커뮤니티 가이드라인을 지키지 않을시 받게 되는 경고예요.</p>
            <div id="policy_table" class="container text-center">
                <div class="row">
                    <div class="col-4 title">
                        3아웃 정책
                    </div>
                    <div class="col-8">
                        제재 내용
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 title center">
                        1차 아웃
                    </div>
                    <div class="col-8 content">
                        상품이 삭제되고,<br>
                        3일동안 이용정지돼요
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 title center">
                        2차 아웃
                    </div>
                    <div class="col-8 content">
                        상품이 삭제되고,<br>
                        15일동안 이용정지돼요
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 title center">
                        3차 아웃
                    </div>
                    <div class="col-8 content">
                        상품이 삭제되고,<br>
                        30일동안 이용정지돼요
                    </div>
                </div>
            </div>
            <p>・ 항목에 따라 사전 안내 없이 상점 이용이 영구 제한될 수 있어요.</p>
        </div>
    </div>
    <!-- // wrapper 영역 -->

	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="./inc/footer.jsp" />
	</footer></body>
</html>