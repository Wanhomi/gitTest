<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/backhome.do">Homie Project</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<div class="navbar-form navbar-right">
					<c:choose>
						<c:when test="${userId != null }">
							<div class="form-group">
								<input type="button" class="form-control" value="${userId }">
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<input type="button" class="form-control" value="로그인이 필요합니다.">
							</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${userId != null }">
							<a href="/logout.do" class="btn btn-success">Logout</a> 
						</c:when>
						<c:otherwise>
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=51aa1d8c55eba611152e5413a0980f03&redirect_uri=http://localhost/login.do&response_type=code" class="btn btn-success">Login</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<!--/.navbar-collapse -->
		</div>
</nav>
