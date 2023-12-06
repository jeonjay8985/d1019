<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.name.value==""){
		alert("강사명을 입력하세요");
		document.frm.name.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.major.value==""){
		alert("전공을 입력하세요");
		document.frm.major.focus(); 
		return false; }	  	
	 	
	if(document.frm.field.value==""){
		alert("세부 전공을 입력하세요");
		document.frm.field.focus(); 
		return false;  
	}
		
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>강사 추가 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<% 
   PreparedStatement pstmt=null;
   ResultSet rs=null;
   String sql = "select max(idx) from lecturer1019";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int idx = 0;
   if(rs.next()) {
	   idx = rs.getInt(1)+1;
   }
%>

<form name="frm" method="post" action="insert_lecturerProcess.jsp">

<table border=1 id="tab2">

<tr> 
      <th>강사ID (자동생성)</th>
      <td><input type="text" name="idx" value="<%=idx %>" id=in1> 마지막번호+1</td>
</tr>


<tr> 
      <th>강사명</th>
      <td><input type="text" name="name" id=in1></td>
</tr>


<tr> 
      <th>전공</th>
      <td><input type="text" name="major" id=in1></td>
</tr>


<tr> 
      <th>세부전공</th>
      <td><input type="text" name="field" id=in1></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>

</html>