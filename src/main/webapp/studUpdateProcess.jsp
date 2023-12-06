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
   String studno = request.getParameter("studno");   //(학사번호)학번 데이터
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
      String sql = "Update stud1019 set name=?, dept=?, position=?, address=?, phone=?, hobby=? where studno=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(7, studno);    
      pstmt.setString(1, name);  
      pstmt.setString(2, dept);
      pstmt.setString(3, position);
      pstmt.setString(4, address);
      pstmt.setString(5, phone); 
      pstmt.setString(6, hobby); 

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="studSelect.jsp";
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