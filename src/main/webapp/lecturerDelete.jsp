<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   String idx = request.getParameter("idx");
   PreparedStatement pstmt = null;
   try {
	   String sql = "delete from lecturer1019 where idx=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, idx); 
	   pstmt.executeUpdate();
	   %>
	   <script>
	       alert("삭제 완료");
	       location.href = "lecturerSelect.jsp";
	   </script>
	   <%
   }catch(Exception e) {
	   System.out.println("삭제 실패:" +e.getMessage());
   }
%>

</body>
</html>