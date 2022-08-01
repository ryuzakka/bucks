<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 -->
<c:import url="../common/top.jsp" />
<style>
	#section {
		width:800px;
		height:auto;
		margin-top:85px;
		margin:auto;
		padding-bottom:85px;
		text-align:left;
	}
	#section h2 {
		margin:102px 0px 71px 0px;
	}
	#section #intro {
		margin:0 0 70px 0;
	}
	#section #intro #logo {
		margin-bottom:17px;
	}
	#section #intro #welcome h3 {
		margin:12px 0 6px 0;
	}
	#section #login-form {
		
	}
	#section #login-form input {
		padding:12px 0;
	}
	#section #login-form input[type="text"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#section #login-form input[type="password"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#section #login-form input[type='submit'] {
		width:300px;
		border-radius:10px;
		background:#006633;
		color:white;
	}
	#section #login-form #support-btn {
		padding-left:0px;
		margin-bottom:40px;
	}
	#section #login-form #support-btn li {
		list-style:none;
		display:inline-block;
		margin:0 7px;
	}
	#section #login-form #support-btn a {
		text-decoration:none;
		color:#555555;
		font-size:12px;
	}
</style>
<div id="section">
	
	<h2>STARBUCK</h2>
	
	<div id="intro">
		<div id="logo"><img src="../common/img/sb_logo.png" alt="starbucks"></div>
		<div id="welcome">
			<h3>안녕하세요. 스타벅스입니다.</h3>
			<span>회원 서비스 이용을 위해 로그인 해주세요.</span>
		</div>
	</div>
	
	<div id="login-form">
		<form method="post" action="login_ok.jsp">
			<input type="text" name="userid" placeholder="아이디" required><p>
			<input type="password" name="pwd" placeholder="비밀번호" required><p>
			<ul id="support-btn">
				<li><a href="">아이디 찾기</a></li>
				<li> | </li>
				<li><a href="">비밀번호 찾기</a></li>
				<li> | </li>
				<li><a href="">회원가입</a></li>
			</ul>
			<p>
			<input type="submit" value="로 그 인 하 기">
		</form>
		
	</div>
	
	
</div>
<c:import url="../common/footer.jsp" />