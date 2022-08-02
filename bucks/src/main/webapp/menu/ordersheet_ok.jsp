<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dao.CartDao" %>
<%
	CartDao cdao = new CartDao();
	cdao.get_cart(request, session);
%>
<c:if test="${userid == null}">
	<%-- <c:redirect url="../common/warning/member_only.jsp" /> --%>
</c:if>
<!-- 주문서 최종확인 -->
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
	
	/* 결제수단 */
	#payment {
		
	}
	
	/* 쿠폰 및 할인 */
	#discount {
	
	}
	
	/* 주문 내역 */
	#orderList {
	
	}
	#orderList .container {
		width:80%;
		margin:auto;
		background:#f6f5ef;
	}
	
	/* 최종금액 확인 */
	#totalfare {
	
	}
</style>
<div id="section">
	
	<h2>결제 진행</h2>
	
	<form name="ordermadeForm" method="post" action="ordersheet_finish.jsp">
	<div id="payment">
		<h3>결제 수단</h3>
		<div>
			<input type="radio" name="howToPay" value=""><img src="" alt="신용카드">
			<input type="radio" name="howToPay" value=""><img src="" alt="SSG PAY">
		</div>
	</div>
	
	<div id="discount">
		<h3>쿠폰 및 할인</h3>
		<div>
			<ul>
				<li>쿠폰</li>
				<li>선물</li>
				<li>통신사 제휴 할인</li>
			</ul>
		</div>
	</div>
	
	<div id="orderList">
		<h3>주문 내역</h3>
		<!-- 주문 내역 리스트 -->
		<div class="container">
		<c:forEach items="${list}" var="orderitems">
			<div class="item">
				<div class="first"><img src="">(img)</div>
				<div class="second">
					<div>
						${orderitems.prod_code}
						<input type="hidden" name="prod_code" value="${orderitems.prod_code}">
					</div>
					<div>
						Size:${orderitems.prod_size} | Unit:${orderitems.prod_unit}
						<input type="hidden" name="prod_size" value="${orderitems.prod_size}">
						<input type="hidden" name="prod_unit" value="${orderitems.prod_unit}">
					</div>
				</div>
				<div class="third">
					<div>${orderitems.prod_cost}할인적용금액</div>
					<div>${orderitems.prod_cost}단품가격</div>
					<%-- <c:if test=""><div>-할인가</div></c:if> --%>
					<input type="hidden" name="prod_cost" value="${orderitems.prod_cost}">
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="totalfare">
		<table>
			<tr>
				<td>주문금액</td>
				<td><span>${total_cost}</span>원</td>
			</tr>
			<tr>
				<td>할인금액</td>
				<td><span></span>원</td>
			</tr>
			<tr>
				<td>최종 결제 금액</td>
				<td><span>${total_cost}</span>원</td>
			</tr>
		</table>
		<input type="hidden" name="total_cost" value="${total_cost}">
	</div>
	
	<input type="submit" value="결제하기">
	
	</form>
	
</div>
<c:import url="../common/footer.jsp" />