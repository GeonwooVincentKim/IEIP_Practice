<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_DB.DBConnect" %>
<%
	String sql = "select teacher_code, teacher_name, class_name, '￦'||to_char(class_price, '999,999') class_price, substr(teach_resist_date, 1, 4)||'년'||substr(teach_resist_date, 5, 2)||'월'||substr(teach_resist_date, 7, 2)||'일' teach_resist_date from tbl_teacher_202201";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
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
		<h2>강사조회</h2>
		<table>
			<tr>
				<th>강사코드</th>
				<th>강사명</th>
				<th>강의명</th>
				<th>수강료</th>
				<th>강사자격취득일</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
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