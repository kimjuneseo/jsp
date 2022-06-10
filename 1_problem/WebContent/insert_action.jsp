<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/db_connect.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String sql = "insert into TBL_ENTRY_202104 values(?,?,?,?,?,?)";
	
	PreparedStatement psmt = con.prepareStatement(sql);
	psmt.setString(1, request.getParameter("num"));
	psmt.setString(2, request.getParameter("name"));
	psmt.setString(3, request.getParameter("birth"));
	psmt.setString(4, request.getParameter("sex"));
	psmt.setString(5, request.getParameter("tt"));
	psmt.setString(6, request.getParameter("add"));
	psmt.executeUpdate();
	response.sendRedirect("/select1.jsp");
%>
