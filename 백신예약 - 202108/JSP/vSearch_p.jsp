<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="cbq_001.DBConnect"%>

<%
	request.setCharacterEncoding("UTF-8");

	String sql = "select v.resvno resvno, j.name name, case substr(j.jumin,8,1) when '1' then '남자' when '2' then '여자' end gender, h.hospname hospname, to_char(v.resvdate,'yyyy\"년\"mm\"월\"dd\"일\"') resvdate, lpad(v.resvtime,4,0) resvtime, case substr(v.vcode,4,1) when '1' then 'A백신' when '2' then 'B백신' when '3' then 'C백신' end vcode, case h.hospaddr when '10' then '서울' when '20' then '대전' when '30' then '대구' when '40' then '광주' end hospaddr"
			+ " from tbl_vaccresv_202108 v, tbl_jumin_202108 j, tbl_hosp_202108 h"
			+ " where v.jumin = j.jumin and v.hospcode = h.hospcode and v.resvno = ?";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("v_resvno")));
	ResultSet rs = pstmt.executeQuery();
	int SearchInput = Integer.parseInt(request.getParameter("v_resvno"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
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
				<%
					if(rs.next()) {
				%>
		<h2>
			예약번호<%= SearchInput %>
			님의 예약조회
		</h2>
		<table class="ResultTable">
			<tr style="text-align: center;">
				<th>예약번호</th>
				<th>성명</th>
				<th>성별</th>
				<th>병원이름</th>
				<th>예약날짜</th>
				<th>예약시간</th>
				<th>백신코드</th>
				<th>병원지역</th>
			</tr>
			<tr style="text-align: center;">
				<td><%=rs.getString("resvno") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("gender") %></td>
				<td><%=rs.getString("hospname") %></td>
				<td><%=rs.getString("resvdate") %></td>
				<td><%=rs.getString("resvtime") %></td>
				<td><%=rs.getString("vcode") %></td>
				<td><%=rs.getString("hospaddr") %></td>
			</tr>

		</table>
		<div class="reButton">
		<a href="vSearch.jsp"><input type="button" value="돌아가기" style="padding: 10px;"></a>
		</div>
		<% } else { %>
		<h2><%= SearchInput%>로 조회된 결과가 없습니다.</h2>
		<div class="reButton"><a href="index.jsp"><input type="button" value="홈으로" style="padding: 10px;"></a></div>
		<% } %>
	</section>


	<footer id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>