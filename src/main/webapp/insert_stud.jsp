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
<h1>학사 정보 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>
<form name="frm" method="post" action="insert_studProcess.jsp">
<table border=1 id="tab2">
<tr> 
      <th>학번</th>
      <td><input type="text" name="studno" id=in1></td>
</tr>

<tr> 
      <th>성명</th>
      <td><input type="text" name="name" id=in1></td>
</tr>


<tr> 
      <th>학과</th>
    <td>
      <select name = "dept" id=in1>
      <option value ="1" selected> 컴퓨터공학과</option>
      <option value ="2"> 기계공학과</option>
      <option value ="3"> 전자과</option>
      <option value ="4"> 영문학과</option>
      <option value ="5"> 일어과</option>
      <option value ="6"> 경영학과</option>
      <option value ="7"> 무역학과</option>
      <option value ="8"> 교육학과</option>
      </select>
    </td>
</tr>

<tr> 
      <th>학년</th>
      <td>
         <input type="Radio" name="position" value="1" onclick="position()">1학년
         <input type="Radio" name="position" value="2" onclick="position()">2학년
         <input type="Radio" name="position" value="3" onclick="position()">3학년
         <input type="Radio" name="position" value="4" onclick="position()">4학년
      </td>
</tr>

<tr> 
      <th>취미</th>
      <td><input type="checkbox" name="hobby" value="프로그램"> 프로그램
      <input type="checkbox" name="hobby" value="독서"> 독서
      <input type="checkbox" name="hobby" value="등산"> 등산
      <input type="checkbox" name="hobby" value="여행"> 여행
      <input type="checkbox" name="hobby" value="낚시"> 낚시
      <input type="checkbox" name="hobby" value="영화보기"> 영화보기
      <input type="checkbox" name="hobby" value="잠자기"> 잠자기
      <input type="checkbox" name="hobby" value="멍때리기"> 멍때리기</td>
</tr>

<tr> 
      <th>주소</th>
      <td><input type="text" name="address" id=in1></td>
</tr>

<tr> 
      <th>연락처</th>
      <td><input type="text" name="phone" id=in1></td>
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