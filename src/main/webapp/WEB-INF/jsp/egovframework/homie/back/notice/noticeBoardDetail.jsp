<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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

</style>
</head>
<body>
	<div class="header">
		<jsp:include page="../header.jsp"/>
	</div>
	
    <div class="container">
      <form  name="frm" class="form-createNotice" enctype="multipart/form-data" method="post" action="/notice/updateNoticeBoard.do">
      <div>
        <h2 class="form-signin-heading">게시글 상세</h2>
        <c:if test="${noticeBoardInfo.userId == userId}">
		        <input type="button" id="update-submit"style="float: right;" class="btn btn-success float-right btn-center" value="수정">
		        <input type="button" id="delete-submit" style="float: right;"class="btn btn-danger float-right btn-center" value="삭제">
        </c:if>
       </div>
        <input type="" id="inputTitle" name="noticeTitle" class="form-control notiece"  value="${noticeBoardInfo.noticeTitle }">
        <textarea rows="10" name="noticeContents" class="col-xs-12 form-control notiece" id="inputContents" >${noticeBoardInfo.noticeContents }</textarea>
        <input  type="text" disabled="disabled" name="userName" id="userName" class="form-control notiece" style="width: 30%;" value="${noticeBoardInfo.userName }">
        <input  type="hidden" disabled="disabled" name="userId" id="userId" class="form-control notiece" style="width: 30%;"  value="${noticeBoardInfo.userId }">
      </form>
        <br>
		<input type="button" id="commentSubmitButton" class="btn btn-success btn-center" style="float: right;" value="댓글 작성">
		<span style="float:right; ">
			<input id="commentSubmit" type="text" style="padding-bottom: 7px;" placeholder="댓글을 남겨주세요." >
		</span>
       	
        <div class="comment-box col-xs-12">
        	<div class="comment-contents">
        		<span class="comment-content" name="userName"><strong>차완호</strong></span>
        		<span class="comment-content" name="commentContent">디자인 별로네요</span>
        		<span class="comment-content comment-date" name="commentDate">2021.15</span>
        	</div>
        	<div class="comment-contents">
        		<span class="comment-content" name="userName"><strong>차완호</strong></span>
        		<span class="comment-content" name="commentContent">레드마인 다시 접속 가능합니다.</span>
        		<span class="comment-content comment-date" name="commentDate">2021.15</span>
        	</div>
        </div>

    </div> <!-- /container -->


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	var noticeId = '${noticeBoardInfo.noticeId }';

	fn_getCommentList(noticeId);
	if('${noticeBoardInfo.userId}' != '${userId}'){
		$('form input').attr("disabled",true)
		$('form textarea').attr("disabled",true)
	}
	
	function fn_getCommentList(noticeId) {
		$.ajax({
			type:"post",
			url: "/notice/noticeCommentList.do",
			data : {noticeId : noticeId},
			success: function (data){
				console.log(data)
				var list = data.commentList
				html ="";
				for(var i=0; i<list.length; i++){
			
					html += '<div class="comment-contents">';
					html += 	'<span class="comment-content" name="userName"><strong>'+list[i].USER_NAME+' : </strong></span>';
					html +=		'<span class="comment-content" name="commentContent">'+list[i].COMMENT_CONTENTS+' </span>';
					html +=		'<span class="comment-content comment-date" name="commentDate">'+list[i].CREATE_DATE+' </span>';
					html += '</div>'
				}
				
				
				if (list.length == 0){
					html = '<div class="comment-contents"><span>댓글이없네요.</span></div>'
				}
				
				$('.comment-box').html(html);
			},
			error:function(e){
				alert("다시 시도해보세요.")
			}
		})
		
	}
	
	// 댓글 작성
	$('#commentSubmitButton').on('click',function(){
		debugger;
		var comment = $(commentSubmit).val().trim();
		
		if('${userId}' == ''){
			alert('로그인 해주세요.')
			$(commentSubmit).val('');
			return false;
		}
		
		if(comment.length == 0){
			alert('댓글을 작성해주세요.')
			return false;
		}
		
		if(comment.length > 50){
			alert('50자 이하로 작성해주세요. ')
			return false;
		}
		
		$.ajax({
			type:"post",
			data:{comment:comment, noticeId:noticeId},
			url:"/notice/setNoticeComment.do",
			success: function (data){
				console.log(data);
				fn_getCommentList(noticeId);
				$(commentSubmit).val('');
			},
			error:function(e){
				alert("다시 시도 해주세요.")
			}
		})
		
	})
	
	// 삭제 버튼 클릭시
	$('#delete-submit').on('click',function(){
		debugger;
		location.href ="/notice/deleteNoticeBoard.do?noticeId="+noticeId;
	})
	// 수정 버튼 클릭시
	$('#update-submit').on('click',function(){
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
		
		$('form').append("<input type='text' style='display:none' name='noticeId' value='"+noticeId+"'></div>")
		
		submitForm.submit();
	})
	</script> 
</body>
	
</html>