<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_DB.DBConnect" %>
<%
	request.setCharacterEncoding("UTF-8");
	String sql = "insert into tbl_class_202201 values(?, ?, ?, ?, ?)";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	
	pstmt.setString(1, request.getParameter("resist_month"));
	pstmt.setString(2, request.getParameter("c_no"));
	pstmt.setString(3, request.getParameter("class_area"));
	pstmt.setInt(4, Integer.parseInt(request.getParameter("tuition")));
	pstmt.setString(5, request.getParameter("class_name"));
	
	pstmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>