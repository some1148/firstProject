<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <%@ page import="java.sql.*"%>
   <%@ page import="java.util.*"%>
   <%
      response.setCharacterEncoding("EUC-KR");
      String allqt = request.getParameter("allqt");
      int intAllqt = Integer.valueOf(allqt);
      int score = 0;
      String qtAnswer = null;
      String userAnswer = null;
      int pass;
      //���� ä��
      for(int i=0; i<intAllqt; i++){
         qtAnswer = request.getParameter("answer"+i);
         userAnswer = request.getParameter(""+i);

         System.out.println("���"+qtAnswer);
         System.out.println("����"+userAnswer);
         if(qtAnswer.equals(userAnswer)){
            score++;
         }
      }
      
      //�հݿ��� �Ǵ�
      if(score>=7){
    	  pass = 1;
      }else{
    	  pass = 0;
      }
      
      Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // ����Ϸ��� �����ͺ��̽����� ������ URL ���
         String id = "scott"; // ����� ����
         String pw = "tiger"; // ����� ������ �н�����

         Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
         conn = DriverManager.getConnection(url, id, pw); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

         /* �������� ��ȸ */
         String sql = "INSERT INTO pass(pass_index, pass_date, pass_type, pass_score) VALUES (pass_pass_index.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), "+pass+", "+score+")"; // sql ����
         pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
         rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
         
      } catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
         e.printStackTrace();
         out.println("member ���̺� ȣ�⿡ �����߽��ϴ�.");
      } finally { // ������ ���� �Ǵ� ���п� ������� ����� �ڿ��� ���� �Ѵ�.  (�����߿�)
         if (rs != null)
            try {
               rs.close();
            } catch (SQLException sqle) {
            } // Resultset ��ü ����
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException sqle) {
            } // PreparedStatement ��ü ����
         if (conn != null)
            try {
               conn.close();
            } catch (SQLException sqle) {
            } // Connection ����
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