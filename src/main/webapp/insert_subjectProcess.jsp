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
      String sql = "Insert into sub1019 values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);    //첫번째 물음표에 id가 넘어감
      pstmt.setString(2, subject_name);  
      pstmt.setString(3, credit);
      pstmt.setString(4, lecturer);
      pstmt.setString(5, week);
      pstmt.setString(6, start_hour);
      pstmt.setString(7, end_hour);

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("교과목 등록이 완료되었습니다!");
      location.href="subjectSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>