<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.MenuDao" %>
<%
	MenuDao dao = new MenuDao();
	dao.get_price(request, out);
%>