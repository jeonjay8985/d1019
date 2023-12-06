<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.studno.value==""){
		alert("학번을 입력하세요");
		document.frm.studno.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.name.value==""){
		alert("성명을 입력하세요");
		document.frm.name.focus(); 
		return false; }
	
	if(document.frm.address.value==""){
		alert("주소를 입력하세요");
		document.frm.address.focus(); 
		return false; }
	
	if(document.frm.phone.value==""){
		alert("연락처를 입력하세요");
		document.frm.phone.focus(); 
		return false; }
	
	document.frm.submit(); //type="submit"바로 액션으로 넘어감, type="button" 하나하나 체크 다 끝나고 서브밋가능
}
</script>


</head>

<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>학사정보 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>
<%
   String studno = request.getParameter("studno"); //studUpdate.jsp?id의 id
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   
   try{
	   String sql="select * from stud1019 where studno=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, studno); //String의 studno랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String name = rs.getString("name");
		   String dept = rs.getString("dept");
			
		   String position = rs.getString("position");
		   String address = rs.getString("address");
		   String phone = rs.getString("phone");
		   String hobby="";
		   hobby = rs.getString("hobby");
		   String arr[] = hobby.split(",");
 		   
%>
<form name="frm" method="post" action="studUpdateProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>학번</th>
      <td><input type="text" name="studno" id=in1 value="<%=studno%>"></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in1 value="<%=name%>"></td>
</tr>

<tr> 
      <th>학과</th>
    <td>

      <select name = "dept" id=in3>
      <option value ="1" <% if(dept.equals("1")){ %>selected <%}%>> 컴퓨터공학과</option>
      <option value ="2" <% if(dept.equals("2")){ %>selected <%}%>> 기계공학과</option>
      <option value ="3" <% if(dept.equals("3")){ %>selected <%}%>> 전자과</option>
      <option value ="4" <% if(dept.equals("4")){ %>selected <%}%>> 영문학과</option>
      <option value ="5" <% if(dept.equals("5")){ %>selected <%}%>> 일어과</option>
      <option value ="6" <% if(dept.equals("6")){ %>selected <%}%>> 경영학과</option>
      <option value ="7" <% if(dept.equals("7")){ %>selected <%}%>> 무역학과</option>
      <option value ="8" <% if(dept.equals("8")){ %>selected <%}%>> 교육학과</option>
      </select>
    </td>
</tr>

<tr> 
      <th>학년</th>
      <td>
         <input type="Radio" name="position" value="1"<%=position.equals("1") ? "checked" :""%>>1학년
         <input type="Radio" name="position" value="2"<%=position.equals("2") ? "checked" :""%>>2학년
         <input type="Radio" name="position" value="3"<%=position.equals("3") ? "checked" :""%>>3학년
         <input type="Radio" name="position" value="4"<%=position.equals("4") ? "checked" :""%>>4학년
      </td>
</tr>

<tr> 
       <th>취미</th>
 
       <td><input type="checkbox" name="hobby" value="프로그램"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("프로그램")) out.print("checked");} %>>프로그램 
       <input type="checkbox" name="hobby" value="독서"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("독서")) out.print("checked");} %>>독서 
       <input type="checkbox" name="hobby" value="등산"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("등산")) out.print("checked");} %>>등산
       <input type="checkbox" name="hobby" value="여행"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("여행")) out.print("checked");} %>>여행
       <input type="checkbox" name="hobby" value="낚시"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("낚시")) out.print("checked");} %>>낚시
       <input type="checkbox" name="hobby" value="영화보기"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("영화보기")) out.print("checked");} %>>영화보기
       <input type="checkbox" name="hobby" value="잠자기"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("잠자기")) out.print("checked");} %>>잠자기
       <input type="checkbox" name="hobby" value="멍때리기"<%for(int i=0; i<arr.length; i++){if(arr[i].equals("멍때리기")) out.print("checked");} %>>멍때리기</td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in1 value="<%=address%>"></td>
</tr>

<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in1 value="<%=phone%>"></td>
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