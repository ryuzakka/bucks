<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dao.MenuDao" %>
<%
	MenuDao dao = new MenuDao();
	dao.content(request);
 %>
<!-- 메뉴/음료/상세 -->
<c:import url="../common/top.jsp" />
<style>
	#section {
		width:auto;
		height:auto;
		margin:30px auto 80px auto;
		text-align:center;
	}
	#section h2 {
		display:inline-block;
		width:1000px;
		text-align:left;
		/* margin-left:80px; */
		font-size:30px;
	}
	#section .container {
		width:1000px;
		margin:0 auto;
		padding:35px 0 45px 0;
		border:1px solid darkgreen;
		display:flex;
		flex-flow:row wrap;
		justify-content:space-evenly;
	}
	#section .container .img {
		width:450px;
		height:100%;
	}
	#section .container .desc {
		width:450px;
	}
	#section .container .desc .menuName {
		text-align:left;
		font-size:18px;
		font-weight:bolder;
		margin-bottom:22px;
	}
	#section .container .desc table {
		width:450px;
		border-spacing:0px;
	}
	#section .container .desc table tr:first-child td {
		padding:5px 0;
	}
	#section .container .desc table tr td {
		padding:20px 0 20px 0;
	}
	
	#section .container .desc input[type='button'] {
		margin:43px 0 0 0;
		padding:12px 0;
		width:450px;
		border-radius:10px;
		background:#006633;
		color:white;
	}
	
</style>
<div id="section">
	
	<h2>${category}</h2>
	<div class="container">
		<div class="img">
			<img src="img/${param.name}.jpg" alt="">
		</div>
		<div class="desc">
			<div class="menuName">${param.name}</div>
			<table border="1">
				<tr>
					<td><strong>Type</strong></td>
					<td><strong>Size</strong></td>
					<td><strong>Price</strong></td>
				</tr>
				<c:forEach items="${list}" var="drink">
					<tr>
						<td>
							<c:if test="${drink.type == 1}">
								<span style="color:red;">Hot</span>
							</c:if>
							<c:if test="${drink.type == 2}">
								<span style="color:blue;">Ice</span>
							</c:if>
						</td>
						<td>${drink.size}</td>
						<td><fmt:formatNumber value="${drink.price}" type="number" /></td>
					</tr>
				</c:forEach>
			</table>
			<p><input type="button" onclick="javascript:location='../cart/ordersheet.jsp?name=${param.name}'" value="주문하기"></p>
		</div>
	</div>
	
</div>
<c:import url="../common/footer.jsp" />