<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap -->
    <link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>

</head>
<body>
                  
<%
Connection conn = null;                                        // null�� �ʱ�ȭ �Ѵ�.

try{

String url = "jdbc:oracle:thin:@localhost:1521:orcl";        // ����Ϸ��� �����ͺ��̽����� ������ URL ���

String id = "scott";                                                    // ����� ����

String pw = "tiger";                                                // ����� ������ �н�����



Class.forName("oracle.jdbc.driver.OracleDriver");                       // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.

conn=DriverManager.getConnection(url,id,pw);              // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

out.println("����� ����Ǿ����ϴ�.");                            // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�.



}catch(Exception e){                                                    // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.

e.printStackTrace();

}

%>
</body>
</html> 