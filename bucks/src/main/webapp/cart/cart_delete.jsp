<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.CartDao" %>
<%
	CartDao dao = new CartDao();
	dao.cart_delete(request);
%>