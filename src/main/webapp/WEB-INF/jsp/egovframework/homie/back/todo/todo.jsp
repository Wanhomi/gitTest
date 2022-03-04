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
.delete-button{
	text-align:right;
}
.delete-button img{
	text-align: right;
	width: 30px;
}
.header {
	margin-bottom: 20px;
}

.content {
	margin-top: 80px;
}
@-moz-document url-prefix() {
  fieldset { display: table-cell; }
}
.btn-center{
	margin-bottom: 5px;
	margin-left: 5px;
}
.todo-Box{
	width: 100%;
	border: solid 1px gray;
	border-radius: 10px;
	padding:10px;
	overflow: hidden;
	height: 1000px;
}
.todo-div{
	min-width: 200px;
	border: solid 1px #fff9a6;
	border-radius: 10px;
	padding:10px;
	overflow: hidden;
	float: left;
	margin: 10px;
	background-color: #fff9a6
	
}
.todo-header{
	text-align: center;
	border-bottom: 3px solid black;
	font-size: 20px;
}
.button-del{
	width: 20px;
	float: right;
}
.del-content{
	float: right;
}
.todo-contents{
	margin-top : 5px;
}
.scroll-x {overflow-x: auto;}
.scroll-y {overflow-y: auto;}

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
.todo-modal-header{
	margin-bottom: 10px;
}
.todo-modal-title{
	margin-bottom: 15px; 
	margin-top:  15px;
}
.modal_body{
	padding-bottom: 30px;
}
.todo-modal-body{
	border: solid 1px gray;
	border-radius: 10px;
	margin: 10px;
	
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
							<li><a href="/data/index.do">자료실</a></li>
							<li class="active"><a href="/todo/index.do">ToDO+</a></li>
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
			<button type="button" class="btn btn-success btn-center btn-open-popup">작성하기</button>
		</div>
	      <div class="todo-Box overflow-y">
			<div class="todo-div scroll-x">
				<a href="#"><img class="button-del" src="/images/egovframework/main/delete.png"/></a>
				<div class="todo-header"><strong>12/15</strong></div>
				<ul class="todo-contents">
					<li class="todo-content">test1 <a class="del-content" href="#">삭제</a></li>
					<li class="todo-content">test2 <a class="del-content" href="#">삭제</a></li>
					<li class="todo-content">test3 <a class="del-content" href="#">삭제</a></li>
				</ul>
			</div>
			<div class="todo-div scroll-x">
				<a href="#"><img class="button-del" src="/images/egovframework/main/delete.png"/></a>
				<div class="todo-header"><strong>12/16</strong></div>
				<ul class="todo-contents">
					<li class="todo-content">test1 <a class="del-content" href="#">삭제</a></li>
					<li class="todo-content">test2 <a class="del-content" href="#">삭제</a></li>
					<li class="todo-content">test3 <a class="del-content" href="#">삭제</a></li>
				</ul>
			</div>
	      </div>
	    </div>
	</div>
	<!-- /container -->
	<div class="modal">
		<jsp:include page="./modalTodo.jsp"/>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="/bootstrap/js/bootstrap.min.js"></script>
	<script>
		const modal = document.querySelector('.modal'); 
		const btnOpenPopup = document.querySelector('.btn-open-popup'); 
		btnOpenPopup.addEventListener('click', () => { modal.style.display = 'block'; }); 
		$('.delete-button img').on('click', function (e) {
			$('.modal').hide();
		})

	</script>

</body>
</html>