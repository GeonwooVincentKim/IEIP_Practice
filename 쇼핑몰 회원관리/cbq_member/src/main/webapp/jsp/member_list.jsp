<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_member.DBConnect" %>
<%

	String sql = "select custno, custname, phone, address, to_char(joindate, 'yyyymmdd') joindate, decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city from member_tbl_02";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
	<header id="header">
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<nav id="nav">
		<jsp:include page="../include/nav.jsp"></jsp:include>
	</nav>
	
	<section class="section">
		<h2>회원목록조회/수정</h2>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><a href="update.jsp?custno=<%= rs.getString("custno") %>"><%= rs.getString("custno") %></a></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("phone") %></td>
				<td><%= rs.getString("address") %></td>
				<td><%= rs.getString("joindate") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("city") %></td>
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