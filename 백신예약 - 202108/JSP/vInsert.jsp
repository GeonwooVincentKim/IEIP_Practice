<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<%@ page import="cbq_001.DBConnect" %>
<%

	String sql = "select max(resvno) from tbl_vaccresv_202108";

	Connection conn = DBConnect.getConnection();
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	rs.next();
	int maxResvno = rs.getInt(1) + 1;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
	function chkVal() {
		if(!document.vInsert.resvno.value) {
			alert("예약번호를 입력하지 않았습니다");
			document.vInsert.resvno.focus();
			return false;
		} else if(!document.vInsert.jumin.value) {
			alert("주민번호를 입력하지 않았습니다");
			document.vInsert.jumin.focus();
			return false;
		} else if(document.vInsert.vcode.value == "none") {
			alert("백신코드가 선택되지 않았습니다");
			document.vInsert.vcode.focus();
			return false;
		} else if(!document.vInsert.hospcode.value) {
			alert("병원이 선택되지 않았습니다");
			return false;
		} else if(!document.vInsert.resvdate.value) {
			alert("예약날짜를 입력하지 않았습니다");
			document.vInsert.resvdate.focus();
			return false;
		} else if(!document.vInsert.resvtime.value) {
			alert("예약시간을 입력하지 않았습니다");
			document.vInsert.resvtime.focus();
			return false;
		}
		
		alert("예약이 완료되었습니다.");
		return true;
	}
	
	function Cancel() {
		alert("등록을 취소하고 메인화면으로 돌아갑니다.");
		location.href="index.jsp";
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
		<h2>백신예약</h2>
		<form name="vInsert" method="post" onsubmit="return chkVal()" action="vInsert_p.jsp">
			<table class="vInsertTable">
				<tr>
					<th>예약번호</th>
					<td><input type="text" name="resvno" size="40" value="<%= maxResvno %>" style="padding: 5px; background-color: lightgray;" readonly><span> 예) 20210011</span></td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="jumin" size="40"  style="padding: 5px"><span> 예)790101-1111111</span></td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td>
						<select name="vcode" size="" style="padding: 5px">
							<option value="none">백신선택</option>
							<option value="V001">A백신</option>
							<option value="V002">B백신</option>
							<option value="V003">C백신</option>
						</select>
					<span> 예) V001, V002, V003</span></td>
				</tr>
				<tr>
					<th>병원코드</th>
					<td>
					<input type="radio" name="hospcode" value="H001" size="40" style="padding: 5px"> 가_병원&nbsp;
					<input type="radio" name="hospcode" value="H002" size="40" style="padding: 5px"> 나_병원&nbsp;
					<input type="radio" name="hospcode" value="H003" size="40" style="padding: 5px"> 다_병원&nbsp;
					<input type="radio" name="hospcode" value="H004" size="40" style="padding: 5px"> 라_병원&nbsp;
					</td>
				</tr>
				<tr>
					<th>예약날짜</th>
					<td><input type="text" name="resvdate" size="40"  style="padding: 5px"><span> 예) 20210101</span></td>
				</tr>
				<tr>
					<th>예약시간</th>
					<td><input type="text" name="resvtime" size="40"  style="padding: 5px"><span> 예) 0930, 1130</span></td>
				</tr>
				<tr style="text-align: center;">
					<td colspan="2">
						<input type="submit" value="등록" style="padding: 10px;">
						<input type="button" value="취소" onclick="return Cancel()" style="padding: 10px;">
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