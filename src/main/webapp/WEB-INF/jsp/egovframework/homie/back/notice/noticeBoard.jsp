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
	.btn-center{
		margin-bottom: 5px;
		margin-left: 5px;
		
	}
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../header.jsp"/>
	</div>
	

	
    <div class="container">
      <form  name="frm" class="form-createNotice" enctype="multipart/form-data" method="post" action="/notice/submitBoard.do">
        <h2 class="form-signin-heading">게시글 작성</h2>
        <input type="button" style="float: right;" class="btn btn-success float-right btn-center" value="저장">
        
        <input type="text" id="inputTitle" name="noticeTitle" class="form-control notiece" placeholder="제목을 입력해주세요." >
<!--         <input id='fileList' type="file" name="uploadFile" multiple  class="form-control notiece" id="fileDrop"> -->
        <textarea rows="10" name="noticeContents" class="col-xs-12 form-control notiece" id="inputContents" placeholder="내용을 입력해주세요."></textarea>
        <input  type="text" disabled="disabled" name="userName" id="userName" class="form-control notiece" style="width: 30%;" placeholder="작성자" value="${userName }">
        <input  type="hidden" disabled="disabled" name="userId" id="userId" class="form-control notiece" style="width: 30%;" placeholder="작성자" value="${userId }">
        <br>
      </form>

    </div> <!-- /container -->


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
		$('form input[type="button"]').on('click',function(e){
			
			debugger;
			var submitForm = $('form');
			var title = $('#inputTitle').val().trim();
			var contents = $('#inputContents').val().trim();
			
			if('${userId}' == ''){
				alert('로그인 해주세요.')
				return false;
			}
			
			if(title == null || title == "" || contents == null|| contents == ""){
				if(!confirm("미입력된 부분있습니다. 그래도 진행하시겠습니까?")){
					return false;
				}
			}
			
			if(title.length >= 100){
				alert("제목은 100자 이하로 입력해주세요");
				return false;
			};
			if(contents.length >= 1000){
				alert("내용은 1000자 이하로 입력해주세요");
			};
			
			submitForm.submit();
		})
	</script>
</body>
	
</html>