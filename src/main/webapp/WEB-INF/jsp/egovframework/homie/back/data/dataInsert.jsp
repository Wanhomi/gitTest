<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <form  name="frm" class="form-createNotice" enctype="multipart/form-data" method="post" action="/data/submitData.do">
      <div>
        <h2 class="form-signin-heading">자료실 등록</h2>
        <input id="submit-btn" type="button" style="float: right;" class="btn btn-success float-right btn-center" value="저장하기">
       </div>
        <input type="text" id="inputTitle" name="dataTitle" class="form-control notiece" placeholder="자료명을 입력하세요." >
        <input  type="text" disabled="disabled" name="userName" id="userName" class="form-control notiece" style="width: 30%;" value="${userName }">
        <input id='fileList' type="file" name="uploadFile" multiple  class="form-control notiece" id="fileDrop">
        <input  type="hidden" disabled="disabled" name="userId" id="userId" class="form-control notiece" style="width: 30%;"  value="${userId }">
      </form>
    </div> <!-- /container -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('#submit-btn').on('click',function(){
			var formData = $('form[name="frm"]');
			var dataTitle = $('#inputTitle').val().trim();
			
			if('${userId}' == ''){
				alert("로그인해주세요");
				return false;
			}
			
			if(dataTitle == null || dataTitle == ""){
				if(!confirm("미입력된 부분있습니다. 그래도 진행하시겠습니까?")){
					return false;
				}
			}
			
			if(dataTitle.length > 100){
				alert("자료명이 너무 기네요.");
				return false;
			}
			
			formData.submit();
		})
		
	</script>
</body>
	
</html>