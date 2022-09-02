<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_DB.DBConnect" %>
    
<%

	String sql = "select t.teacher_code, t.class_name, t.teacher_name, '￦'||to_char(sum(c.tuition), '999,999') tuition from tbl_teacher_202201 t, tbl_class_202201 c where t.teacher_code = c.teacher_code group by t.teacher_code, t.class_name, t.teacher_name, c.teacher_code";
	
	Connection conn =  DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
		<header id="header">
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<nav id="nav">
		<jsp:include page="../include/nav.jsp"></jsp:include>
	</nav>
	
	<section id="section">
		<h2>강사매출현황</h2>
		<table>
			<tr>
				<th>강사코드</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>총매출</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("teacher_code") %></td>
				<td><%= rs.getString("class_name") %></td>
				<td><%= rs.getString("teacher_name") %></td>
				<td><%= rs.getString("tuition") %></td>
			</tr>
			<%
				}
			%>
		</table>
	</section>
	
	<footer id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>