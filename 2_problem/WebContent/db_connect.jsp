<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:@//localhost:1521/xe","system","1234");
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	//Connection con = 
%>
