<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.id.value==""){
		alert("교과목 코드를 입력하세요");
		document.frm.id.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.subject_name.value==""){
		alert("과목명을 입력하세요");
		document.frm.subject_name.focus(); 
		return false; }
	
	if(document.frm.credit.value==""){
		alert("학점을 입력하세요");
		document.frm.credit.focus(); 
		return false; }
	
	if(document.frm.start_hour.value==""){
		alert("시작 시간을 입력하세요");
		document.frm.start_hour.focus(); 
		return false; }
	if(document.frm.end_hour.value==""){
		alert("종료 시간을 입력하세요");
		document.frm.end_hour.focus(); 
		return false; }
	
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>교과목 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
    	 %>
    	 
<%
   String id = request.getParameter("id"); 
   
   try{
	   String sql="select * from sub1019 where id=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, id); //String의 studno랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   
		   String subject_name = rs.getString("subject_name");
		   String credit = rs.getString("credit");
		   
		   
		   String week = rs.getString("week");
			/*  if(week.equals("1")){
				 week="월";
    		 }else if(week.equals("2")){
    			 week="화";
    		 }
    		 else if(week.equals("3")){
    			 week="수";
    		 }
    		 else if(week.equals("4")){
    			 week="목";
    		 }
    		 else if(week.equals("5")){
    			 week="금";
    		 }
    		 else if(week.equals("6")){
    			 week="토";
    		 }
			  */
			 String start_hour=rs.getString("start_hour");
			 String end_hour=rs.getString("end_hour"); 
			 String lecturer=rs.getString("lecturer");
			 
			 
		
%>
<form name="frm" method="post" action="subjectUpdateProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>교과목 코드</th>
      <td><input type="text" name="id" id=in1 value="<%=id%>"></td>
</tr>

<tr> 
      <th>과목명</th>
      <td><input type="text" name="subject_name" id=in1 value="<%=subject_name%>"></td>
</tr>

<tr> 
      <th>학점</th>
      <td><input type="text" name="credit" id=in1 value="<%=credit%>"></td>
</tr>

<tr> 
      <th>담당강사</th>
    <td>
    <%
   	 sql = "select*from lecturer1019";
   	 pstmt = conn.prepareStatement(sql);
   	 rs = pstmt.executeQuery();
    %>
      <select name = "lecturer" required id=in1>
      <option value ="" height = "30px"> 담당강사선택</option>
      <% 
        while (rs.next()) {
        	
            String idx= rs.getString("idx");
            String name= rs.getString("name");
            String sel ="";
            if (lecturer.equals(idx)) {
            	sel = " selected";
            }
       %>
       <option value="<%=idx %>" <%=sel %>> <%=name %> </option>
       <% }
      %>
      </select>
    </td>
</tr>

<tr> 
      <th>수업요일</th>
      <td>
         <input type="Radio" name="week" value="1"<%=week.equals("1") ? "checked" :""%>>월
         <input type="Radio" name="week" value="2"<%=week.equals("2") ? "checked" :""%>>화
         <input type="Radio" name="week" value="3"<%=week.equals("3") ? "checked" :""%>>수
         <input type="Radio" name="week" value="4"<%=week.equals("4") ? "checked" :""%>>목
         <input type="Radio" name="week" value="5"<%=week.equals("5") ? "checked" :""%>>금
         <input type="Radio" name="week" value="6"<%=week.equals("6") ? "checked" :""%>>토
      </td>
</tr>

<tr> 
      <th>시작</th>
      <td><input type="text" name="start_hour" id=in1 value="<%=start_hour%>"></td>
</tr>

<tr> 
      <th>종료</th>
      <td><input type="text" name="end_hour" id=in1 value="<%=end_hour%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt2 type="button" value="수정" onclick="check()"> 
    <input id=bt1 type="button" value="목록" onclick="newPage()">
      <script>
     function newPage()  {
	 location.href="subjectSelect.jsp";
	}
     </script>
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