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
	margin-left: 5px;
	
}
@-moz-document url-prefix() {
  fieldset { display: table-cell; }
}

</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../header.jsp"/>
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
							<li><a href="/backhome.do">게시판</a></li>
							<li class="active"><a href="/data/index.do">자료실</a></li>
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
	            <th>자료명</th>
	            <th>작성자</th>
	            <th>날짜</th>
	          </tr>
	        </thead>
	        <tbody id="dataList">
					<tr>
						<th scope="row">1</th>
						<td>레드마인 사용자가이드</td>
						<td>차완호</td>
						<td>2021.12.12</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>레드마인 사용자가이드</td>
						<td>차완호</td>
						<td>2021.12.12</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>레드마인 사용자가이드</td>
						<td>차완호</td>
						<td>2021.12.12</td>
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
		fn_getDataList(1);
	
		$('.button-create button').on('click', function() {
			debugger;
			if('' == '${userId}'){
				alert("로그인이 필요합니다.!!");
				return false;
			}
			location.href = "/data/createData.do";
		})
	
		$('tbody tr').on('click',function(){
			var dataId = $(this).find('td:last').text();
			
			location.href ="/data/dataDetail.do?dataId="+dataId;
		})
		
		function fn_getDataList(page) {
			var params = {};
			
			params.pageNo = (page == 1) ? page : (page * 5) - 4;
			params.pageSize = (page == 1) ? 5 : (params.pageNo + 4);
			
			$.ajax({
				type:'post',
				url:'/data/dataList.do',
				data: params,
				success : function(data){
				debugger;
					console.log(data);
					
					var result = data.dataList;
					var totCnt = data.totCnt;
					
					fn_setNoticeBoard(result, page);
					fn_cusmtomPaging('.pagination', totCnt, page, 'fn_getDataList');
					
					
				},
				error: function(e){
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
				html +=		"<td>"+item.DATA_TITLE+"</td>";
				html +=		"<td>"+item.USER_NAME+"</td>";
				html +=		"<td>"+item.MODIFIY_DATE+"</td>";
				html +=		"<td style='display:none'>"+item.DATA_ID+"</td>";
				html += "</tr>";
				
			}
			if(data.length == 0){
				html = "<tr><td colspan='7' style='text-align:center'>데이터가 없습니다.</td></tr>";
			}
			
			$("#dataList").html(html);
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
		$(document).on('click','#dataList tr', function(){
			debugger;
			var dataId = $(this).find('td:last').text();
			location.href="/data/dataDetail.do?dataId="+dataId;
		})
	</script>


</body>
</html>