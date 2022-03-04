<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- kakao login -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<style type="text/css">
	.header{
		height: 100px;
	}
	.container{
		width: 60%;
	}
	.notiece{
		margin-top: 10px;
		height: auto;
	}
	textarea{
		margin-bottom: 10px;
	}
	.comment-box{
		border: solid 1px gray;
		border-radius: 10px;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.comment-header{
		text-align: center;
		border-radius: 10px;
		border: solid 1px gray;
	}
	.comment-date{
		color: gray;
	}
	.btn-center{
		margin-bottom: 5px;
		margin-left: 5px;
	}
	.container{
		width: 40%;
	}
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../header.jsp"/>
	</div>
	
    <div class="container">
      <form  name="frm" class="form-createNotice" enctype="multipart/form-data" method="post" action="/notice/submitㅇㅁㅅㅁ.do">
      <div>
        <h2 class="form-signin-heading">자료실 상세</h2>
        <input id="download-btn" type="button" style="float: right;" class="btn btn-success float-right btn-center" value="다운로드">
        <input type="button" style="float: right;" class="btn btn-success float-right btn-center" value="수정">
        <input type="button"  style="float: right;"class="btn btn-danger float-right btn-center" value="삭제">
       </div>
        <input type="" id="inputTitle" name="title" class="form-control notiece" value="레드마인 사용자 가이드">
        <input  type="text" disabled="disabled" name="userName" id="userName" class="form-control notiece" style="width: 30%;" value="${userName }">
        <input type="button" id="addFile-btn" class ="btn btn-success float-right notiece" value="파일 변경하기">
       	<input id='fileList'  style="display:none" type="file" name="uploadFile" multiple  class="form-control notiece" id="fileDrop">
        <c:if test="${fn:length(dataFileInfo)> 0 }">
	        <div class="form-control" id="downLoadFileList">
	        	<c:forEach items="${dataFileInfo  }" var="item" varStatus="status">
	        	<a href="/upload/${item.FILE_NAME }" download>${item.FILE_ORGIN_NAME }</a>
	        	</c:forEach>
	        </div>
        </c:if>
        <input  type="hidden" disabled="disabled" name="userId" id="userId" class="form-control notiece" style="width: 30%;"  value="${userId }">
      </form>
    </div> <!-- /container -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		console.log("전체: "+'${dataFileInfo}[0]');
		$('#addFile-btn').on('click',function(){
			$('#fileList').show();
			$('#downLoadFileList').hide();
			$('#addFile-btn').after("<input type='button' id='cancle-btn' class='btn btn-danger float-right notiece' value='취소'>");
		})	;
		
		$(document).on('click','#cancle-btn',function(){
			$('#downLoadFileList').show();
			$('#fileList').hide();
			$(this).remove();
		})
		
		$('#download-btn').on('click',function(){
			debugger;
			$('#downLoadFileList a').get(0).click();
			
		})
	</script>
</body>
	
</html>