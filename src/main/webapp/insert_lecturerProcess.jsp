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
   String idx = request.getParameter("idx");   
   String name = request.getParameter("name");
   String major = request.getParameter("major");
   String field = request.getParameter("field");

   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into lecturer1019 values(?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, idx);    //첫번째 물음표에 idx가 넘어감
      pstmt.setString(2, name);  
      pstmt.setString(3, major);
      pstmt.setString(4, field);

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("강사등록이 완료되었습니다!");
      location.href="lecturerSelect.jsp";
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