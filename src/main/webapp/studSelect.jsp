<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>학사 정보 조회</h1>
<table border=1 id="tab1">
<tr>
    <th>학번</th>
    <th>성명</th>
    <th>학과</th>
    <th>학년</th>
    <th>주소</th>
    <th>연락처</th>
    <th>취미</th>
    <th>관리</th>
 
    
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;

     try{
    	 String sql = "select*from stud1019";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String studno = rs.getString("studno");
    		 String name= rs.getString("name");
    		 String dept = rs.getString("dept");
    		 String position = rs.getString("position");
    		 String address = rs.getString("address");
    		 String phone = rs.getString("phone");
    		 String hobby = rs.getString("hobby");
    		
 
%>

<tr>
    <td><%=studno %> </td>
    <td><%=name %> </td>
    <td><%=dept %> </td>
    <td><%=position %> </td>
    <td><%=address %> </td>
    <td><%=phone %> </td>
    <td><%=hobby %> </td>

    <td>
     <a href="studUpdate.jsp?studno=<%=studno %>"> 수정</a>/
    
     <a href="studDelete.jsp?studno=<%=studno %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_stud.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>