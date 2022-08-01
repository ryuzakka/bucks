<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>starbucks</title>
<link rel="stylesheet" href="../common/bucks.css" />
<!-- <script src="" /> -->
<script>
	function view(n) {
		document.getElementsByClassName('drop-menu-title')[n].style.color = "#669900";
		document.getElementsByClassName('drop-menu')[n].style.visibility = "visible";
	}
	function hide(n) {
		document.getElementsByClassName('drop-menu-title')[n].style.color = "#555555";
		document.getElementsByClassName('drop-menu')[n].style.visibility = "hidden";
	}
</script>
</head>
<body>
<div id="wrap">
	<div id="gnb">
		<div id="first">
			<div id="left">
				<a href="../main/index.jsp"><img src="../common/img/sb_logo.png" alt="starbucks"></a>
			</div>
			<div id="nav-member">
				<c:if test="${userid == null}">
					<!-- <div>회원서비스</div> -->
					<ul>
						<li><a href="../member/login.jsp">Sign In</a></li>
						<li><a href="../member/member_input.jsp">Sign Up</a></li>
					</ul>
				</c:if>
				<c:if test="${userid != null}">
					<c:if test="${userid != 'admin'}">
						<div>반갑습니다 ${userid}님</div>
						<ul>
							<li><a href="../member/member_info.jsp">회원정보</a></li>
							<li><a href="../member/.jsp">장바구니</a></li>
							<li><a href="../member/.jsp">나의 주문</a></li>
							<li><a href="../member/.jsp">나의 리워드</a></li>
							<li><a href="../member/.jsp">e-Gift</a></li>
							<li><a href="../member/logout.jsp">로그아웃</a></li>
						</ul>
					</c:if>
					<c:if test="${userid == 'admin'}">
						<div>관리자모드</div>
						<ul>
							<li><a href="../manager/.jsp">주문관리</a></li>
							<li><a href="../manager/.jsp">e-Gift관리</a></li>
							<li><a href="../manager/.jsp">회원관리</a></li>
							<li><a href="../manager/.jsp">공지관리</a></li>
							<li><a href="../manager/.jsp">신상품관리</a></li>
							<li><a href="../manager/.jsp">프로모션관리</a></li>
							<li><a href="../member/logout.jsp">로그아웃</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
			<div id="nav-menu">
				
				<!-- <div id="right"> -->
					<ul id="nav-menu-list">
						<li id="top-menu" onmouseover="view(0)" onmouseout="hide(0)">
							<div class="drop-menu-title">MENU</div>
							<ul class="drop-menu">
								<li><a href="">음료</a></li>
								<li><a href="">푸드</a></li>
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(1)" onmouseout="hide(1)">
							<div class="drop-menu-title">STORE</div>
							<ul class="drop-menu">
								<li><a href="">매장찾기</a></li>
								<li><a href="">지역검색</a></li>
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(2)" onmouseout="hide(2)">
							<div class="drop-menu-title">REWARDS</div>
							<ul class="drop-menu">
								<li><a href="">리워드 소개</a></li>
								<li><a href="">e-Gift 소개</a></li>
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(3)" onmouseout="hide(3)">
							<div class="drop-menu-title">WHAT'S NEW</div>
							<ul class="drop-menu">
								<li><a href="">새소식</a></li>
								<li><a href="">신상품</a></li>
								<li><a href="">이벤트</a></li>
							</ul>
						</li>
					</ul>
				<!-- </div> -->
			</div>
		</div>
	</div>