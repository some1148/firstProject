<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>result</title>
</head>
<body>
   <%
      response.setCharacterEncoding("EUC-KR");
   	  String allqt = request.getParameter("allqt");
   	  int intAllqt = Integer.valueOf(allqt);
   	  int score = 0;
  
   	  String qtAnswer = null;
   	  String userAnswer = null;
   	  
   	  for(int i=0; i<intAllqt; i++){
   		  qtAnswer = request.getParameter("answer"+i);
   		  userAnswer =  request.getParameter(""+i);
   		  if(qtAnswer.equals(userAnswer)){
   			  score++;
   			  
   		  }
   		  
   	  }
 
   %>
   
 ���� : <%=score %><br>
   <%
      if(score>=7){
         %>
         �����մϴ� �հ��Դϴ�
         <%
      }else{
         %>
         ���հ��Դϴ�
         <%
         
      }
   %>
  
  
  
</body>
</html>