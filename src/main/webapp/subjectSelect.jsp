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

<h1>교과목 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>강사코드</th>
    <th>담당강사</th>
    <th>과목코드</th>
    <th>과목명</th>
    <th>학점</th>
    <th>요일</th>
    <th>시작시간</th>
    <th>종료시간</th>
    <th>관리</th>
 
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no=0;
     try{
    	 String sql = "select b.idx, b.name, a.id, a.subject_name, a.credit, a.week, a. start_hour, a. end_hour from sub1019 a, lecturer1019 b where a.lecturer=b.idx order by b.idx";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String idx = rs.getString("idx");
    		 String name = rs.getString("name");
    		 String id = rs.getString("id");
    		 String subject_name= rs.getString("subject_name");
    		 String credit = rs.getString("credit");
    		 
    		 String week = rs.getString("week");
    		 if(week.equals("1")){
				 week="월";
    		 }else if(week.equals("2")){
    			 week="화";
    		 }
    		 else if(week.equals("3")){
    			 week="수";
    		 }
    		 else if(week.equals("4")){
    			 week="목";
    		 }
    		 else if(week.equals("5")){
    			 week="금";
    		 }
    		 else if(week.equals("6")){
    			 week="토";
    		 }
    		 String start_hour = rs.getString("start_hour");
    		 String end_hour = rs.getString("end_hour");
    		 
    		 no++;
%>

<tr>
    <th><%=no %></th>
    <td><%=idx %> </td>
    <td><%=name %> </td>
    <td><%=id %> </td>
    <td><%=subject_name %> </td>
    <td><%=credit %> </td>
    <td><%=week %> </td>
    <td><%=start_hour %> </td>
    <td><%=end_hour %> </td>


    <td>
     <a href="subjectUpdate.jsp?id=<%=id %>"> 수정</a>/
    
     <a href="subjectDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 10  align = center>
    <input id=bt1 type="button" value="작성" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_subject.jsp";
	}
    </script>
    </td>

</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>
</body>
</html>