<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal_body">
	<div class="delete-button">
		<img src="/images/egovframework/main/delete.png">
	</div>
	<h2 class="todo-modal-title">ToDO+ 리스트</h2>
	<div class="todo-modal-header">
		<span class="login-info">제 목 : </span> 
		<input class="login-info"type="text" class="todo-modal-contents" name="todo_header">
	</div>
	<div class="todo-modal-header">
		<span class="login-info">할 일  : </span> 
		<input class="login-info"type="text" class="todo-modal-contents" name="todo_body">
	</div>
	<div class="todo-modal-header">
		<span class="btn-modal-insert"><a href="#">할일 추가하기</a></span>
		<span class="btn-modal-insert"><a href="#">| 저장하기</a></span>
	
	</div>
	<div class="todo-modal-body" style="display: none">
		<div class="todo-div scroll-x" style="margin-left:70px;">
			<div class="todo-header"><strong>12/17</strong></div>
			<ul class="todo-contents">
				<li class="todo-content">test1 <a class="del-content" href="#">삭제</a></li>
				<li class="todo-content">test2 <a class="del-content" href="#">삭제</a></li>
				<li class="todo-content">test3 <a class="del-content" href="#">삭제</a></li>
			</ul>
		</div>
	</div>
</div>