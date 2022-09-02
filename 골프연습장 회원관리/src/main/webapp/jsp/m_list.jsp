<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_DB.DBConnect" %>
    
<%

	String sql = "select substr(c.resist_month, 1, 4)||'년'||substr(c.resist_month, 5, 2)||'월' resist_month, m.c_no c_no, m.c_name c_name, decode(c.teacher_code, '100', '초급반', '200', '중급반', '300', '고급반', '400', '심화반') teacher_code, c.class_area class_area, '￦'||to_char(c.tuition, '999,999') tuition, m.grade grade from tbl_member_202201 m, tbl_class_202201 c where m.c_no = c.c_no";
	
	Connection conn =  DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h2>회원정보조회</h2>
		<table>
			<tr>
				<th>수강월</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>강의명</th>
				<th>강의장소</th>
				<th>수강료</th>
				<th>등급</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("resist_month") %></td>
				<td><%= rs.getString("c_no") %></td>
				<td><%= rs.getString("c_name") %></td>
				<td><%= rs.getString("teacher_code") %></td>
				<td><%= rs.getString("class_area") %></td>
				<td><%= rs.getString("tuition") %></td>
				<td><%= rs.getString("grade") %></td>
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