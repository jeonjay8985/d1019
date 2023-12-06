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
		document.frm.name.focus(); 
		return false;  
	}
	if(document.frm.major.value==""){
		alert("전공을 입력하세요");
		document.frm.major.focus(); 
		return false;  
	}
	if(document.frm.field.value==""){
		alert("세부전공을 입력하세요");
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
<h1>강사 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String idx = request.getParameter("idx"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from lecturer1019 where idx=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, idx); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
		   String major = rs.getString("major");
		   String field = rs.getString("field");

		   /*
			 if(position.equals("1")){
				 position="1급";
    		 }else if(position.equals("2")){
    			 position="2급";
    		 }
    		 else if(position.equals("3")){
    			 position="3급";
    		 }
    		 else if(position.equals("4")){
    			 position="4급";
    		 }
    		 else if(position.equals("5")){
    			 position="5급";
    		 }*/
		
		   
%>
<form name="frm" method="post" action="lecturerUpdateProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>강사ID</th>
      <td><input type="text" name="idx" id=in1 value="<%=idx%>"></td>
</tr>
<tr> 
      <th>강사명</th>
      <td><input type="text" name="name" id=in1 value="<%=name%>"></td>
</tr>

<tr> 
      <th>전공</th>
      <td><input type="text" name="major" id=in1 value="<%=major%>"></td>
</tr>

<tr> 
      <th>세부 전공</th>
      <td><input type="text" name="field" id=in1 value="<%=field%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>

</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>