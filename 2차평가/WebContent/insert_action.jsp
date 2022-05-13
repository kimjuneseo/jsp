<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String jumin =  request.getParameter("jumin").replace("-", "");
	String sql = "insert into MEM_TBL_202205 values(?,?,?,?,?)";
	PreparedStatement psmt = conn.prepareStatement(sql);
	String date = request.getParameter("date").replace("-", " ");
	psmt.setInt(1, id);
	psmt.setString(2, request.getParameter("name"));
	psmt.setString(3, jumin);
	psmt.setString(4, date);
	psmt.setString(5, request.getParameter("g"));
	int rs = psmt.executeUpdate();
%>

<%response.sendRedirect("select1.jsp");%>