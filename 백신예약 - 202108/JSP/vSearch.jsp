<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<%@ page import="cbq_001.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신예약조회</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
	var focus = document.vSearchFrom.v_resvno.focus();
	function chkNo() {
		if(!document.vSearchForm.v_resvno.value) {
			alert("예약번호를 입력해주세요.")
			documnet.vSearchForm.v_resvno.focus();
			return false;
		}
		
		return true;
	}
</script>
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
		<h2>백신예약조회</h2>
		<form name="vSearchForm" method="post" action="vSearch_p.jsp" onsubmit="return chkNo()">
			<table class="vSearchTable">
			<tr>
				<th>예약번호</th>
				<td><input type="text" size="40" name="v_resvno" style="padding: 10px; margin-left: -220px;"></td>
				<tr style="text-align: center;">
					<td colspan="2">
						<input type="submit" value="조회하기" style="padding: 10px;">
						<input type="button" value="홈으로" onclick="location.href='index.jsp'" style="padding: 10px;">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<footer id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>