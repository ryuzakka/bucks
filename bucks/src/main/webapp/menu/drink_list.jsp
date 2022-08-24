<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.MenuDao" %>
<%
	MenuDao dao = new MenuDao();
	dao.list(request);
%>
<!-- 메뉴/음료/리스트 -->
<c:import url="../common/top.jsp" />
<style>
	#section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	#section .list {
		width:900px;
		margin:auto;
		/* border:1px solid green; */
		display:flex;
		flex-flow:row wrap;
		justify-content:left;
	}
	#section .list .prod {
		width:285px;
		height:300px;
		display:inline-block;	
		padding:30px 0 30px 13px;
	}
	#section .list .prod .img {
		width:280px;
		height:280px;
		/* padding:10px 20px; */
	}
	#section .list .prod .img img {
		width:100%;
		height:100%;
	}
	#section .list .prod .name {
		width:300px;
	}
	#section .list .prod a {
		text-decoration:none;
		cursor:pointer;
		color:black;
	}
</style>
<div id="section">
	
	<h1>음료</h1>
	<div class="list">
	<c:forEach items="${list}" var="drink">
		<div class="prod">
			<a href="drink_content.jsp?name=${drink.name}">
				<div class="img"><img src="img/${drink.name}.jpg"></div>
				<div class="name">${drink.name}</div>
			</a>
		</div>
	</c:forEach>
	</div>
	
</div>
<c:import url="../common/footer.jsp" />