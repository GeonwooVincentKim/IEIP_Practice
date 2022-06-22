<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<%@ page import="cbq_001.DBConnect" %>

<%

	String sql = "select h.hospaddr, decode(h.hospaddr, '10', '서울', '20', '대전', '30', '대구', '40', '광주') hosploc, count(v.resvno) cnt"
			+	" from tbl_hosp_202108 h, tbl_vaccresv_202108 v"
			+	" where h.hospcode = v.hospcode(+) group by h.hospaddr order by cnt desc";

	String sql2 = "select count(*) cnt2 from tbl_vaccresv_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
	ResultSet rs = pstmt.executeQuery();
	ResultSet rs2 = pstmt2.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
</style>
</head>
<body>
	<header id="header">
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	<nav id="nav">
		<jsp:include page="../include/nav.jsp"></jsp:include>
	</nav>
	<section id="section">
		<h2>백신예약현황</h2>
		<table class="vSearchAbout">
			<tr style="text-align: center;">
				<th>병원지역</th>
				<th>병원지역명</th>
				<th>접종예약건수</th>
			</tr>
			<%
				while(rs.next()) {
			%>
			<tr style="text-align: center;">
				<td><%= rs.getString("hospaddr")%></td>
				<td><%= rs.getString("hosploc")%></td>
				<td><%= rs.getString("cnt")%></td>
			</tr>
			<%
				}
			%>
			<%
				while(rs2.next()) {
			%>
			<tr style="text-align: center;">
			<td colspan="2">총합</td>
			<td><%= rs2.getString("cnt2")%></td>
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