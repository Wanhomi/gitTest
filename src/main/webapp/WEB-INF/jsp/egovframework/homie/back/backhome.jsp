<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- kakao login -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>호미 | 호미파다 들어와라</title>

<!-- 부트스트랩 -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<style>

.header {
	margin-bottom: 20px;
}

.content {
	margin-top: 80px;
}
.btn-center{
	margin-bottom: 5px;
}
@-moz-document url-prefix() {
  fieldset { display: table-cell; }
}

</style>
</head>
<body>
	<div class="header">
		<jsp:include page="./header.jsp"/>
	</div>
		<div class="content">
		<div class="container">
				<!-- Static navbar -->
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar" aria-expanded="false"
							aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav" style="margin-left:-30px">
							<li class="active"><a href="/backhome.do">게시판</a></li>
							<li><a href="/data/index.do">자료실</a></li>
							<li><a href="/todo/index.do">ToDO+</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
				<!--/.container-fluid --> 
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="table-responsive">
		<div class="text-right button-create">
			<button type="button" class="btn btn-success btn-center">작성하기</button>
		</div>
	      <table class="table table-bordered table-hover">
	        <thead>
	          <tr>
	            <th>#</th>
	            <th>게시명</th>
	            <th>게시글 내용</th>
	            <th>작성자</th>
	            <th>날짜</th>
	            <th>좋아요</th>
	          </tr>
	        </thead>
	        <tbody class="notice-list">
					<tr>
						<th scope="row">1</th>
						<td>레드마인 관련 공지</td>
						<td>현재 레드마인 접속 불가합니다.</td>
						<td>차완호</td>
						<td>2021.12.12</td>
						<td>0</td>
						<td style="display:none">23</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>레드마인 관련 공지</td>
						<td>현재 레드마인 접속 불가합니다.</td>
						<td>차완호</td>
						<td>2021.12.12</td>
						<td>0</td>
						<td style="display:none">24</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>레드마인 관련 공지</td>
						<td>현재 레드마인 접속 불가합니다.</td>
						<td>차완호</td>
						<td>2021.12.12</td>
						<td>0</td>
						<td style="display:none">25</td>
					</tr>
	        </tbody>
	      </table>
			<div class="row text-center" style="width: 100%">
				<div class="col ">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</div>
			</div>
	    </div>
		<!-- /container -->
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	
	<script>
	// 게시판 테이블 로드
	fn_getNoticeBoardList(1);

	// ajax로 가져온 데이터에 이벤트 추가
	$(document).on('click','tbody tr',function(){
		
		var noticeId = $(this).find("td:last").text()
		fn_getNoticeDetail(noticeId);
	});

	

	
	// 게시글 작성 버튼 클릭시
	$('.button-create button').on('click', function() {
		if('' == '${userId}'){
			alert("로그인이 필요합니다.");
			return false;
		}
		location.href = "/notice/createBoard.do";
	})
	
	// 게시글 상세 페이지 이동 함수
	function fn_getNoticeDetail(noticeId) {
		location.href = "/notice/noticeDetail.do?noticeId="+noticeId;
	}
	
	// 테이블 데이터 로드
	function fn_getNoticeBoardList(page){
		
		var params = {}; 
		
		params.pageNo = (page == 1) ? page : (page * 5) - 4;
		params.pageSize = (page == 1) ? 5 : (params.pageNo + 4);
		
		$.ajax({
			type: "post",
			url: "/notice/noticeBoardList.do",
			data: params,
			success: function (data){
				console.log(data);
				debugger;
				var result = data.noticeBoardList;
				var totCnt = data.totCnt;
				
				fn_setNoticeBoard(result, page);
				fn_cusmtomPaging('.pagination', totCnt, page, 'fn_getNoticeBoardList');
			},
			error: function (e){
				alert("다시 시도해보세요.")
			}
		})
	}
	
	function fn_setNoticeBoard(data, page){
		var html ="";
		for(var i=0; i<data.length; i++){
			var item = data[i];
			
			html += "<tr>";
			html += 	"<th scope='row'>"+item.ROWNUM+"</th>";
			html +=		"<td>"+item.NOTICE_TITLE+"</td>";
			html +=		"<td>"+item.NOTICE_CONTENTS+"</td>";
			html +=		"<td>"+item.USER_NAME+"</td>";
			html +=		"<td>"+item.MODIFIY_DATE+"</td>";
			html +=		"<td>"+item.LIKE_CNT+"</td>";
			html +=		"<td style='display:none'>"+item.NOTICE_ID+"</td>";
			html += "</tr>";
			
		}
		if(data.length == 0){
			html = "<tr><td colspan='7' style='text-align:center'>데이터가 없습니다.</td></tr>";
		}
		
		$(".notice-list").html(html);
	}
	
	function fn_cusmtomPaging(target, totalCount, currentPage, callback){
		let pageUnit = 5;
		
        let lastPage = (totalCount % pageUnit) == 0 ? (totalCount / pageUnit) : Math.floor(totalCount / pageUnit) + 1;
        let lastSeeingPage = currentPage % pageUnit != 0 ? (Math.floor(currentPage / pageUnit) * pageUnit) + pageUnit : (Math.floor(currentPage / pageUnit) * pageUnit)
        let firstPage = (lastSeeingPage - pageUnit) + 1;
        lastSeeingPage = lastSeeingPage > lastPage ? lastPage : lastSeeingPage
        let pageNext = lastSeeingPage + 1 > lastPage ? lastPage : lastSeeingPage + 1;
        let pagePrev = firstPage - 1 < pageUnit ? 1 : firstPage - 1;
		
		var pagingHtml = '';
		if(pagePrev >0)
			pagingHtml += '<li class="page-item"><a class="page-link" href="javascript:'+callback+'('+pagePrev+')">Previous</a></li>';
			
			for(var i=firstPage; i<=lastSeeingPage; i++){
				if(i==currentPage){
					pagingHtml +='<li class="page-item"><a class="page-link" href="javascript:'+callback+'('+i+')">'+i+'</a></li>';
				}
			}
			
		if(lastPage < totalCount)
			pagingHtml += '<li class="page-item"><a class="page-link" href="javascript:'+callback+'('+pageNext+')">Next</a></li>';
			
		// 페이지 목록 생성	
		$(target).html(pagingHtml);
		
		// 현재 페이지 표시
		$(target).find('.page-item:eq('+currentPage+')').addClass('active');
			
        // 데이터 없을 경우 페이징 삭제 처리
        if (totalCount > 0)
            $(target).show();
        else
            $(target).hide();
        
        
	};
</script>

</body>
</html>