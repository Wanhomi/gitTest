<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko"><!-- head -->
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<meta name="description" content="호미파는 호미 즉 고향의 가족을 의미합니다. ">
    <meta name="author" content="HOMIE(호미파)">
	<meta name="keyword" content="">
    <title>호미 | 호미파다 들어와라</title>    
	

	<!-- 제이쿼리 불러오기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- slick 불러오기 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	
	<!-- AOS 플러그인 -->
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- 폰트어썸 불러오기 -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	
	<!-- header.css -->
	<link rel="stylesheet" href="/css/egovframework/main/header.css">
	
	<!-- slick.css -->
	<link rel="stylesheet" href="/css/egovframework/main/slick.css">
	
	<!-- kakao login -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

	<style type="text/css">
		.modal { 
			position: absolute; 
			top: 0; 
			left: 0; 
			width: 100%; 
			height: 100%; 
			display: none; 
			background-color: rgba(0, 0, 0, 0.4); 
		} 
		.modal.show { display: block; } 
		.modal_body { 
			position: absolute; 
			top: 50%; 
			left: 50%; 
			width: 400px; 
			padding: 10px; 
			text-align: center; 
			background-color: rgb(255, 255, 255); 
			border-radius: 10px; 
			box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); 
			transform: translateX(-50%) translateY(-50%); 
		}
		html {
		    position: relative;
		    min-height: 100%;
		    margin: 0;
		}
		
		body {
		    min-height: 100%;
		}
		
		.footer {
		    position: absolute; 
			margin-top : 100px;
		    left: 0;
		    bottom: 0;
		    width: 100%;
			color: white;
			background: gray;
			font-size: 15px;
		}
		.info-detail{
			text-align: center;
		}
		.introduce-area{
			width:400px;
			height:250px;
			margin: 10px;
			border: solid 1px;
			float: left;
  			background-color: white; 
  			margin-top : 30px;
  			margin-bottom : 50px;
  			color : white;
  			position:relative;
  			overflow: hidden;
		}
		#introduce{
			margin-top:10px;
			display: flex;
  			justify-content: center;
  			background-color: #b7bfc7; 
		}
		#tab2{
			text-align: center;
			font-size: 50px;
			display: flex;
  			justify-content: center;
		}
		.test{
			height: 100%;
			width: 100%;
		}
		.text{
			position: absolute;
			top: 10px;
			left:10px;
		}
		.login-info{
			margin: 15px;
		}
		.login-info[type="text"]{
			border-bottom: solid 1px black;
		}
		.delete-button{
			text-align:right;
		}
		.delete-button img{
			text-align: right;
			width: 30px;
		}
	</style>
</head>

<body>
	<div id="header">
        <jsp:include page="./header.jsp"/>
	</div>
	
	<div class="wrap">
		<div id="body-content">
			<div id="mainSlider">
			<!-- 중앙 컨텐츠 3차 visual story -->
				<div class="v-story-wrap con">
				    <h2 class="v-story-tt" data-aos="fade-up" id="slider_head">이달의 사원</h2>
				    <div class="v-story-slider" data-aos="fade-up">
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box block">
				                    <img src="/images/egovframework/user/1.png" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
		      		            <p class="v-story-desc-tt">2021년 07월</p>
				                <p class="v-story-desc">당진본부 : 조복기</p>
				            </div>
				        </div>
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box">
				                    <img src="/images/egovframework/user/2.png" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
				                <p class="v-story-desc-tt">2021년 08월</p>
				                <p class="v-story-desc">서울지부 : 이종호</p>
				            </div>
				        </div>
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box">
				                    <img src="/images/egovframework/user/3.png" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
				                <p class="v-story-desc-tt">2021년 09월</p>
				                <p class="v-story-desc">서울지부 : 이재호</p>
				            </div>
				        </div>
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box">
				                    <img src="/images/egovframework/main/logo.png" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
				                <p class="v-story-desc-tt">2021년 10월</p>
				                <p class="v-story-desc">아쉽게도 아무도 없네요!</p>
				            </div>
				        </div>
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box">
				                    <img src="/images/egovframework/user/5.jpg" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
				                <p class="v-story-desc-tt">2021년 11월</p>
				                <p class="v-story-desc">대전지부 : 차완호</p>
				            </div>
				        </div>
				        <div class="slider-item">
				            <a href="#" class="block">
				                <div class="img-box">
				                    <img src="/images/egovframework/main/logo.png" alt="">
				                </div>
				                <div class="discover">
				                    <span class="discover-btn block"></span>
				                    <span class="discover-txt block">EXPLORE</span>
				                </div>
				            </a>
				            <div class="v-story-desc-list">
				                <p class="v-story-desc-tt">2021년 12월</p>
				                <p class="v-story-desc">아쉽게도 아무도 없네요!</p>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div> <!-- <div id="body-content"> -->
	</div> <!-- <div class="wrap"> -->
	
	<div class="footer">
		<jsp:include page="./footer.jsp"/>
	</div>
	
	<div class="modal">
		<jsp:include page="./modal.jsp"/>
	</div>

	<script src="/js/slick.js"></script>
	<script src="/js/header.js"></script>
</body>

</html>