<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**bucks</title>
<link rel="stylesheet" href="" />
<script src="" />
<script>
	function view(n) {
		document.getElementsByClassName('sub')[n].style.visibility = "visible";
	}
	function hide(n) {
		document.getElementsByClassName('sub')[n].style.visibility = "hidden";
	}
</script>
</head>
<body>

	<div id="first"> <span id="closeBtn"> [ X ] </span></div>
	<div id="second">
		<div id="left">
			<a href="../main/index.jsp">Home</a>
		</div>
		<div id="right">
			<ul>
				<li id="menu" onmouseover="view(0)" onmouseout="hide(0)">
					<div>펜션소개</div>
					<ul class="sub">
						<li></li>
						<li> 객실소개 </li>
						<li> 오시는길 </li>
					</ul>
				</li>
				<li id="menu" onmouseover="view(1)" onmouseout="hide(1)">
					<div>여행정보</div>
					<ul class="sub">
						<li> 주문진 항 </li>
						<li> 장사해수욕장 </li>
						<li> 설악산 </li>
						<li> 정동진 </li>
					</ul>
				</li>
				<li id="menu" onmouseover="view(2)" onmouseout="hide(2)">
					<div>예약관련</div>
					<ul class="sub">
						<li>예약하기</li>
						<li>예약확인</li>
					</ul>
				</li>
				<li id="menu" onmouseover="view(3)" onmouseout="hide(3)">
					<div>커뮤니티</div>
					<ul class="sub">
						<li>공지사항</li>
						<li>여행후기</li>
						<li>자유게시판</li>
					</ul>
				</li>
				
				<li id="menu" onmouseover="view(4)" onmouseout="hide(4)">
					<c:if test="${userid == null}">
						<div>회원서비스</div>
						<ul class="sub">
							<li><a href="../member/login.jsp">로그인</a></li>
							<li><a href="../member/member_input.jsp">회원가입</a></li>
						</ul>
					</c:if>
					<c:if test="${userid != null}">
						<c:if test="${userid != 'admin'}">
							<div>${username}님</div>
							<ul class="sub">
								<li><a href="../member/member_info.jsp">회원정보</a></li>
								<li><a href="../member/logout.jsp">로그아웃</a></li>
							</ul>
						</c:if>
						<c:if test="${userid == 'admin'}">
							<div>펜션 관리</div>
							<ul class="sub">
								<li><a href="../manager/reserve.jsp">예약관리</a></li>
								<li><a href="../manager/room.jsp">객실관리</a></li>
								<li><a href="../manager/member.jsp">회원관리</a></li>
								<li><a href="../member/member_info.jsp">관리자 정보</a></li>
								<li><a href="../member/logout.jsp">로그아웃</a></li>
							</ul>
						</c:if>
					</c:if>
				</li>
			</ul>
		</div>
	</div>