<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbConnection.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
	String jumin =  request.getParameter("jumin").replace("-", "");
	String sql = "update MEM_TBL_202205 set name = ?,jumin = ?,indate=? ,grade=? where id = ?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	String date = request.getParameter("date").replace("-", " ");
	psmt.setString(1, request.getParameter("name"));
	psmt.setString(2, jumin);
	psmt.setString(3, date);
	psmt.setString(4, request.getParameter("g"));
	psmt.setInt(5, id);
	int rs = psmt.executeUpdate();
%>

<script>alert("수정이 완료되었습니다");</script>
<%response.sendRedirect("select1.jsp");%>