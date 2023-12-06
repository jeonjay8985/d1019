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
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String idx = request.getParameter("idx");   //강사ID(idx) 데이터
   String name = request.getParameter("name");
   String major = request.getParameter("major");
   String field = request.getParameter("field");
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update lecturer1019 set name=?, major=?, field=? where idx=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(4, idx);    
      pstmt.setString(1, name);  
      pstmt.setString(2, major);
      pstmt.setString(3, field);

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="lecturerSelect.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>