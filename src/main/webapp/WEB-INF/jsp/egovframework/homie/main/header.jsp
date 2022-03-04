<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="header_inner">
			<div id="logo">
				<a href="/home.do">
					<img src="/images/egovframework/main/logoKor.png" alt="logo" width="100" height="56">
				</a>
			</div>
			<div class="header-content">
				<h1>We are homie, come on in</h1>
			</div>
			<c:if test="${sessionScope.userId == null }">
				<span class="apply_homie login-button">
					<a class="btn-open-popup" href="#">
						login
					</a>
				</span>
			</c:if>
			<c:if test="${sessionScope.userId != null }">
				<span class="apply_homie kakao-logout-button" >
					<a href="/logout.do">
					    logout
					</a>
				</span>
			</c:if>
			<c:if test="${sessionScope.userId != null }">
				<span class="apply_homie back-button" >
					<a href="/backhome.do">
						Homie
					</a>
				</span>
			</c:if>
			<c:if test="${sessionScope.userId == null }">
				<span class="apply_homie">
					<a href="#">
						입사지원서
					</a>
				</span>
			</c:if>
			<c:if test="${sessionScope.userId == null }">
				<span class="apply_homie">
					<a href="#">
						회사소개서
					</a>
				</span>
			</c:if>
		</div>