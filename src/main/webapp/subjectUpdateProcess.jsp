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
   String id = request.getParameter("id");   
   String subject_name = request.getParameter("subject_name");
   String credit = request.getParameter("credit");
   String lecturer = request.getParameter("lecturer");
   String week = request.getParameter("week");
   

	  String start_hour = request.getParameter("start_hour");
	  String end_hour = request.getParameter("end_hour");

   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update sub1019 set subject_name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, id);    
      pstmt.setString(1, subject_name);  
      pstmt.setString(2, credit);
      pstmt.setString(3, lecturer);
      pstmt.setString(4, week);
      pstmt.setString(5, start_hour); 
      pstmt.setString(6, end_hour); 

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="subjectSelect.jsp";
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