<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>first</title>
   <!-- Bootstrap -->
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
</head>
<body>

<%@ page import = "java.sql.*" %>  
<%@ page import = "java.util.*" %> <!-- array list ����ϱ� ���� import -->

<%
response.setCharacterEncoding("EUC-KR");
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");
String type = request.getParameter("type");

%>


<%
ArrayList list = new ArrayList();
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.
PreparedStatement pstmt = null;
ResultSet rs = null;
try{
String url="jdbc:oracle:thin:@localhost:1521:orcl";       // ����Ϸ��� �����ͺ��̽����� ������ URL ���
String id = "scott";                                                    // ����� ����
String pw = "tiger";                                                // ����� ������ �н�����

Class.forName("oracle.jdbc.driver.OracleDriver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
//Insert into Dept values (70, 'C', NULL);
String sql = "select * from test where test_type ='"+type+"'";                        // sql ����
pstmt = conn.prepareStatement(sql);                          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.

rs = pstmt.executeQuery();                                        // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.

while(rs.next()){                                                        // ����� �� �྿ ���ư��鼭 �����´�.
list.add(rs.getString("test_type")+"  "+rs.getString("test_question")+"  "+rs.getString("test_answer1")+"  "+rs.getString("test_answer2")+"  "+rs.getString("test_answer3")+"  "+rs.getString("test_answer4")+"  "+rs.getString("test_answer"));
%>


<%
}}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
e.printStackTrace();
out.println("test ���̺� ȣ�⿡ �����߽��ϴ�.");
}finally{                                                            // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
if(rs != null) try{rs.close();}catch(SQLException sqle){}            // Resultset ��ü ����
if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}   // PreparedStatement ��ü ����
if(conn != null) try{conn.close();}catch(SQLException sqle){}   // Connection ����
}
%>
<form action = "result.jsp">
<table width="550" border="1">
<%
for(int i = 0, j = 0; i < list.size() ; i++) {
   %>
<tr width="100">
   <td><%=list.get(i)%></td>
   <td><input type = "radio" name = <%=i %> value = 1></td>
   <td><input type = "radio" name = <%=i %> value = 2></td>
   <td><input type = "radio" name = <%=i %> value = 3></td>
   <td><input type = "radio" name = <%=i %> value = 4></td>
</tr>
   <%
}
%> 
</table>
<br>
<input type= "submit" value="submit">
</form>
</body>
</html>