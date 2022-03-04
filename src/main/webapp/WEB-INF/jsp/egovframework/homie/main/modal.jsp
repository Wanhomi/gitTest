<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal_body">
	<div class="delete-button">
		<img src="/images/egovframework/main/delete.png">
	</div>
	<h2 style="padding-bottom: 50px;">Welcome Homie</h2>
	<span class="login-info">ID : </span> <input class="login-info"
		type="text" name="id"> <br> <span class="login-info">PW : </span> 
		<input class="login-info" type="text" name="pw"> 
		<br>
	<div class="login-info">
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=51aa1d8c55eba611152e5413a0980f03&redirect_uri=http://localhost/login.do&response_type=code">
		
			<img class="kakao-login-button" src="/images/egovframework/main/kakaologin.png" style="width: 25%; height: 20%;" />
		</a>
	</div>
</div>