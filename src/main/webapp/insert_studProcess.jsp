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
   String studno = request.getParameter("studno");   //학번 데이터
   String name = request.getParameter("name");
   String dept = request.getParameter("dept");
   String position = request.getParameter("position");
   String address = request.getParameter("address");
   String phone = request.getParameter("phone");

   String[] val = request.getParameterValues("hobby");
   String hobby="";
   if(val != null) {
	   for(int i=0; i<val.length; i++) {
		   if(i == (val.length-1)) {
			   hobby += val[i];
		   }else{
			   hobby += val[i] + ",";
		   }
	   }
   }
   


   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into stud1019 values(?,?,?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, studno);    
      pstmt.setString(2, name);         
      pstmt.setString(3, dept);
      pstmt.setString(4, position);
      pstmt.setString(5, address);
      pstmt.setString(6, phone);
      pstmt.setString(7, hobby); 
      

      pstmt.executeUpdate();
      
      %>
      <script>
      alert("저장 완료되었습니다");
      location.href="studSelect.jsp";
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