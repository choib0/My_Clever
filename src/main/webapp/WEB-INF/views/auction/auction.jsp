<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클레버 - 경매메인</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/CleverLogo3.png">

<!--아이콘-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- 부트스트랩 icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<!--css-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/market/join.css">


<!-- js -->
<script src="${pageContext.request.contextPath }/resources/js/market/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/menu_hover.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/market/login_modal.js"></script>


<!-- auction -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/auction/used.css?after">
<script type="text/javascript" src="//script.auction.co.kr/style/js/used.js"></script>
<style type="text/css">
.dep1 img {
width: 81px;
height: 94px;
margin-right: 25px;
}
</style>
</head>
<body>
	<!-- 헤더 시작 -->
	<header>
		<jsp:include page="auction_header.jsp" />
	</header>
	<!--로그아웃 확인 모달창-->
        <div class="logout_modal_wrap hidden">
            <div class="logout_bg bg"></div>
            <div class="logout_modal">
                <h2>로그아웃</h2>
                <p>로그아웃 하시겠습니까?</p>
                <div class="btn_area">
                    <button type="button" class="btn_logout_no">취소</button>
                    <a href="" class="btn_logout_yes">확인</a>
                </div>
            </div>
        </div>

        <!--로그인/회원가입 모달창-->
        <div class="join_modal_wrap hidden">
            <div class="join_bg bg"></div>
            <div class="join_content">
                <button class="btn_join_close">
                    <img src="${pageContext.request.contextPath }/resources/images/market/thunder_join_close.png" alt="번개장터 로그인 창 닫기 버튼" width="24px" height="24px">
                </button>
                <div class="join_main">
                    <img src="${pageContext.request.contextPath }/resources/images/market/app.png" alt="번개장터 앱 로고">
                    <p>번개장터로 중고 거래 시작하기</p>
                    <p>간편하게 가입하고 상품을 확인하세요</p>
                    <div class="join_button_area">
                        <button class="join_kakao">
                            <div class="join_kakao_logo"></div>
                            카카오로 이용하기
                        </button>
                        <button class="join_naver">
                            <div class="join_naver_logo"></div>
                            네이버로 이용하기
                        </button>
                        <button class="join_google">
                            <div class="join_google_logo"></div>
                            구글로 이용하기
                        </button>
                    </div>
                    <div class="join_footer">
                        도움이 필요하시면 <span class="join_footer_email">이메일</span> 또는 고객센터 <span class="join_footer_cs">1670-2910</span>로 문의 부탁드립니다.<br>
                        고객센터 운영시간: 09~18시 (점심시간 12~13시, 주말/공휴일 제외)
                    </div>
                </div>
            </div>
        </div>
    <!-- main_content 영역 -->
        <div id="main_content">
			<div id="header" class="used_head">
    <div class="headinside">
        <script type="text/javascript" src="//script.auction.co.kr/listing/UsedMarketHeader.js?ver=20220318"></script>
		<!-- 카테고리 -->
		<div class="tab_umarket">
			<!-- 대대분류 -->
			<ul class="tablist">
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/tshirt.png" alt="패션의류"></a><br>
				  <div align="center">패션의류</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/box.png" alt="패션잡화"></a>
				  <div align="center">패션잡화</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/hobbies.png" alt="취미/컬렉션"></a>
				  <div align="center">취미/컬렉션</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/cross-platform.png" alt="디지털"></a>
				  <div align="center">디지털</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/sport.png" alt="스포츠/레저"></a>
				  <div align="center">스포츠/레저</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/cosmetics.png" alt="뷰티"></a>
				  <div align="center">뷰티</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/furniture.png" alt="생활가전"></a>
				  <div align="center">생활가전</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/electric-car.png" alt="자동차/공구"></a>
				  <div align="center">자동차/공구</div>
				</li>
    
				<li class="dep1">
				   <a href="#"><img src="${pageContext.request.contextPath }/resources/images/auction/open-book.png" alt="도서/기타"></a>
				  <div align="center">도서/기타</div>
				</li>
			</ul>		
			<!-- //대대분류 -->
            <!-- 대분류 -->

			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=12000000">여성의류</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=13000000">남성의류</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=40000000">언더웨어</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=30000000">신발</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=16000000">가방/잡화</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=17000000">쥬얼리/시계</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=52000000">수입명품</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=31000000">출산/육아</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=20000000">장난감/완구</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=32000000">유아동의류</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=49000000">유아동신발/잡화</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=27000000">가구/DIY</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=23000000">조명/인테리어</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=75000000">침구/커튼</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=28000000">생활용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=44000000">주방용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=51000000">신선식품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=19000000">건강식품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=38000000">커피/음료</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=64000000">가공식품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=39000000">생필품</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=33000000">건강/의료용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=45000000">반려동물용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=46000000">악기/취미</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=10000000">문구/사무용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=99000000">꽃/이벤트용품</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=02000000">카메라</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=14000000">음향기기</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=15000000">게임</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=07000000">모바일/태블릿</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=22000000">노트북/데스크탑</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=01000000">모니터/프린터</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=50000000">PC주변기기</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=43000000">저장장치</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=21000000">휘트니스/수영</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=37000000">스포츠의류/운동화</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=08000000">골프</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=48000000">등산/아웃도어</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=72000000">캠핑/낚시</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=73000000">구기/라켓</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=76000000">자전거/보드/기타레저</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=18000000">화장품/향수</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=05000000">바디/헤어</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=29000000">영상가전</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=34000000">계절가전</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=03000000">주방가전</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=71000000">생활/미용가전</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=04000000">자동차용품</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=55000000">공구/안전/산업용품</a></li>
                
				</ul>
			</div>
    
			<div class="tabpanel">
				<ul>
            
                    <li class=""><a href="/corner/UsedMarket.aspx?category=36000000">도서/교육/음반</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=41000000">백화점/제화상품권</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=24000000">여행/항공권</a></li>
                
                    <li class=""><a href="/corner/UsedMarket.aspx?category=86000000">e쿠폰/모바일상품권</a></li>
                
				</ul>
			</div>
    
			<!-- //대분류 -->
			
			<!-- 중소분류 -->
			<div class="used_locbar popular_locbar">
			   
			</div>
			<!-- categoryBox -->
			
			<!-- //categoryBox -->
			<!-- //중소분류 -->
		</div>
		<!-- //카테고리 -->	
    </div>
</div>


            <!--상품 영역-->
            <section class="main_goods">
                <h2 align="center" style="color: red;">마감 임박 상품</h2>
                <div class="goods_wrap">
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    
                </div> 
            </section>
            <section class="main_goods">
                <h2 align="center">신규 등록 순</h2>
                <div class="goods_wrap">
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="goods">
                        <a href="auction_detail">
                            <div class="goods_image">
                                <img src="https://media.bunjang.co.kr/product/178183200_1_1669084670_w360.jpg" width="194" height="194" alt="상품 이미지">
                            </div>
                            <div class="goods_info">
                                <p class="goods_title">JSP책 팝니다</p>
                                <div class="goods_price_date">
                                    <span class="goods_price">가격</span>
                                    <span class="goods_date_before">9000원</span>
                                </div>
                            </div>
                        </a>
                    </div>
                    
                </div> 
            </section>
        </div>
        <!-- // main_content 영역 -->
	<!-- 풋터 시작 -->
	<footer>
		<jsp:include page="../inc/footer.jsp" />
	</footer>
</body>
</html>