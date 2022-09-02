<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "cbq_DB.DBConnect" %>
<%
	String sql = "select c_no, c_name from tbl_member_202201";
	String sql2 = "select teacher_code, class_name from tbl_teacher_202201";

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
<title>수강신청</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<script type="text/javascript">
	function chkVal() {
		var reg = document.regForm;
		
		if(!reg.resist_month.value) {
			alert("수강월이 입력되지 않았습니다!");
			reg.resist_month.focus();
			return false;
		} else if(!reg.c_name.value=="none") {
			alert("회원명이 선택되지 않았습니다!");
			reg.c_name.focus();
			return false;
		} else if(!reg.class_area.value) {
			alert("강의장소가 입력되지 않았습니다!");
			reg.class_area.focus();
			return false;
		} else if(!reg.class_name.value=="none") {
			alert("강의가 선택되지 않았습니다!");
			reg.class_name.focus();
			return false;
		}
		
		return true;
		alert("수강신청이 완료되었습니다!");
	}
	
	function reVal() {
		alert("정보를 지우고 처음부터 다시 입력합니다!");
	}
	
	function vDisplay(code) {
		document.regForm.c_no.value = code;
		document.regForm.tuition.value = "";
		document.regForm.class_name.value = "none";
	}
	
	function calTuition(price) {
		var mbr = document.regForm.c_no.value;
		if(!mbr) {
			alert("회원명을 먼저 선택해주시길 바랍니다!");
			document.regForm.class_name.value = "none";
			document.regForm.c_name.focus();
		} else {
			var salePrice = 0;
			
			switch(price) {
			case "100":
				salePrice = 100000;
				break;
			case "200":
				salePrice = 200000;
				break;
			case "300":
				salePrice = 300000;
				break;
			case "400":
				salePrice = 400000;
				break;
			}
			
			if(mbr.charAt(0)=='2') {
				alert("수강료가 50% 할인되었습니다.");
				salePrice = salePrice/2;
			}
			
			document.regForm.tuition.value = salePrice;
		}
	}
</script>
</head>
<body>
	<header id="header">
		<jsp:include page="../include/header.jsp"></jsp:include>
	</header>
	
	<nav id="nav">
		<jsp:include page="../include/nav.jsp"></jsp:include>
	</nav>
	
	<section id="section">
		<h2>수강신청</h2>
		<form name="regForm" action="c_regi_p.jsp" method="post" onsubmit="return chkVal()">
			<table class="regTable">
				<tr>
					<th>수강월</th>
					<td>
						<input type="text" name="resist_month" size="25"><span> 2022년 03월 예) 202203</span>
					</td>
				</tr>
				<tr>
					<th>회원명</th>
					<td>
						<select name="c_name" style="float: left;" onchange="vDisplay(this.value)">
							<option value="none" selected>회원명</option>
							<%
								while(rs.next()) {
							%>
							<option value="<%= rs.getString("c_no") %>"><%= rs.getString("c_name")%></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td>
						<input type="text" name="c_no" size="25" value="" readonly style="background-color: lightgray;"><span> 예) 10001</span>
					</td>
				</tr>
				<tr>
					<th>강의장소</th>
					<td>
						<input type="text" name="class_area" size="25">
					</td>
				</tr>
				<tr>
					<th>강의명</th>
					<td>
						<select name="class_name" style="float: left;" onchange="calTuition(this.value)">
							<option value="none" selected>강의신청</option>
							<%
								while(rs2.next()){
									
							%>
								<option value="<%= rs2.getString("teacher_code")%>"><%= rs2.getString("class_name") %></option>
							<%
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>
						<input type="text" name="tuition" size="25" value="" readonly style="background-color: lightgray;">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수강신청" style="margin-left: 230px; color: black;">
						<input type="button" value="다시쓰기" onclick="reVal()" style="color: black;">
					</td>
				</tr>
				<tr>
					
				</tr>
			</table>
		</form>
	</section>
	
	<footer id="footer">
		<jsp:include page="../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>