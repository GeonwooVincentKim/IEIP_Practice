<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_member.DBConnect" %>
<%

	String sql = "select e.custno custno, m.custname custname,"
			+ " decode(m.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade,"
			+ " sum(e.price) price"
			+ " from member_tbl_02 m, money_tbl_02 e"
			+ " where m.custno = e.custno"
			+ " group by e.custno, m.custname, grade"
			+ " order by price desc";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
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
		<h2>회원매출조회</h2>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr>
				<td><%= rs.getString("custno") %></td>
				<td><%= rs.getString("custname") %></td>
				<td><%= rs.getString("grade") %></td>
				<td><%= rs.getString("price") %></td>
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