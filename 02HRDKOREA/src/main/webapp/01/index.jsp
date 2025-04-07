<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
:root {
	
}

* {
	/* 	border: 1px solid; */
	box-sizing: border-box;
}

body {
	padding: 0;
	margin: 0;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
	color: black;
}

.wrapper {
	
}

.wrapper>header {
	height: 80px;
}

.wrapper>nav {
	height: 50px;
}

.wrapper>main {
	height: calc(100vh - 80px - 50px - 80px);
}
.wrapper>main h2 {
	text-align: center;
	font-size: 1.8rem;
	font-weight: 400;
	
}
.wrapper>main>table{
	border: 1px solid;
	border-collapse: collapse;
	min-width: 500px;
	min-height: 350px;
	margin: 0 auto;
}
.wrapper>main>table th{
	background-color: lightgray;
}
.wrapper>main>table th,
.wrapper>main>table td{
min-width: 80px !important;
min-height: 35px !important;
border: 1px solid;
text-align: center;
}
.wrapper>footer {
	height: 80px;
}
</style>
</head>
<body>
	<!--  
	select M.M_NO,M.M_NAME,P.P_NAME,M.p_school,m.m_jumin,M.M_City,p.p_tel1,p.p_tel2,p.p_tel3 
	from tbl_member_202005 M
	join tbl_party_202005 p
	on M.p_CODE=P.P_CODE;_
-->
	<%@page import="Utils.*,java.util.*"%>
	
	<%
		List<MemberDto> list = DBUtils.getInstance().selectAllMember();
	%>
	
	
	
	<div class="wrapper">
		<!--  -->
		<%@include file="/layouts/Header.jsp"%>

		<%@include file="/layouts/Nav.jsp"%>

		<main>
			<h2>후보조회</h2>
			<table>
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				</tr>
				<%
					for(MemberDto memberDto : list){
				%>
					
				<tr>
					<th><%=memberDto.getM_no() %></th>
					<th><%=memberDto.getM_name() %></th>
					<th><%=memberDto.getP_name() %></th>
					<% 
					String school = memberDto.getP_school();
					switch(school){
					case "1":
					out.print("<td>고졸</td>");
					break;
					case "2":
					out.print("<td>학사</td>");
					break;
					case "3":
					out.print("<td>석사</td>");
					break;
					case"4":
					out.print("<td>박사</td>");
					break;
					}
					%>
					<th><%=memberDto.getM_jumin() %></th>
					<th><%=memberDto.getM_city() %></th>
					<th><%=memberDto.getP_tel1() + memberDto.getP_tel2() + memberDto.getP_tel3()%></th>


				</tr>
					
				<%} %>
			</table>
		</main>

		<%@include file="/layouts/Footer.jsp"%>

	</div>

</body>
</html>