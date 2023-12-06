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

<h1>강사 리스트</h1>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
int cnt=0;

	 String sql = "select count(*) from lecturer1019";
	 pstmt = conn.prepareStatement(sql);
	 rs = pstmt.executeQuery();
	 if(rs.next()) {
		 cnt=rs.getInt(1);
	 }
%>
총 <%=cnt %>명의 강사가 있습니다
<table border=1 id="tab1">
<tr>
    <th>강사코드</th>
    <th>강사명</th>
    <th>전공</th>
    <th>세부전공</th>
    <th>관리</th>
 
</tr>

<%
     try{
    	 sql = "select*from lecturer1019";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String idx = rs.getString("idx");
    		 String name= rs.getString("name");
    		 String major = rs.getString("major");
    		 String field = rs.getString("field");
  
%>

<tr>
    <td><%=idx %> </td>
    <td><%=name %> </td>
    <td><%=major %> </td>
    <td><%=field %> </td>


    <td>
     <a href="lecturerUpdate.jsp?idx=<%=idx %>"> 수정</a>/
    
     <a href="lecturerDelete.jsp?idx=<%=idx %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 5  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_lecturer.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>