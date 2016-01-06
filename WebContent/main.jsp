<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>text login</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.4-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
<!-- google chart ��� -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

</head>
<style>
.start {
	padding: 10px 15px;
	text-align: center;
	color: inherit;
	margin-top: 100px;
	margin-bottom: 30px;
}

.login_box {
	padding: 10px 15px;
	text-align: center;
	border-radius: 6px;
	color: inherit;
	margin-bottom: 30px;
	background-color: #eee;
}

.button-submit {
	border: 1px solid #3079ed;
	color: #fff;
	text-shadow: 0 1px rgba(0, 0, 0, 0.1);
	background-color: #4d90fe;
	min-width: 46px;
	text-align: center;
	font-size: 14px;
	font-weight: 700;
	height: 36px;
	padding-top: 0px;
	padding-right: 8px;
	padding-bottom: 0px;
	padding-left: 8px;
	border-radius: 10px;
}

.circle-image {
	display: block;
	height: 96px;
	width: 96px;
	oveflow-x: hidden;
	oveflow-y: hidden;
	border-top-left-radius: 50%;
	border-top-right-radius: 50%;
	border-bottom-left-radius: 50%;
	border-bottom-right-radius: 50%;
	margin-left: auto;
	margin-right: auto;
	z-index: 100;
	margin-bottom: 10px;
	background-size: 96px;
	background-repeat: no-repeat;
	background-image:
		url(http://cache1.asset-cache.net/xc/495289236.jpg?v=2&c=IWSAsset&k=2&d=MNkv2nd0LYvnlHoZN2a_lUZkLRAgLYjJABL9b5Y6w8ynzgYZcwkWg4RPIvJWMq-R0);
	-webkit-transition: opacity 0.075s;
	-moz-transition: opacity 0.075s;
	-ms-transition: opacity 0.075s;
	-o-transition: opacity 0.075s;
	transition: opacity 0.075s
}
</style>

<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%
		ArrayList list = new ArrayList();
		ArrayList passlist = new ArrayList();
		Connection conn = null; // null�� �ʱ�ȭ �Ѵ�.
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int pass=0;
		int npass=0;
		
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:orcl"; // ����Ϸ��� �����ͺ��̽����� ������ URL ���
			String id = "scott"; // ����� ����
			String pw = "tiger"; // ����� ������ �н�����

			Class.forName("oracle.jdbc.driver.OracleDriver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
			conn = DriverManager.getConnection(url, id, pw); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.

			/* ���� ���� ��ȸ */
			String sql = "select * from qttype"; // sql ����
			pstmt = conn.prepareStatement(sql); // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
			rs = pstmt.executeQuery(); // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
			while (rs.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
				list.add(rs.getString("type_index"));
		}
			/* �հݷ� ��ȸ */
			sql = "select * from pass";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // ����� �� �྿ ���ư��鼭 �����´�.
				passlist.add(rs.getString("pass_type"));
			}
			
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
	
	<%
		for(int i=0; i<passlist.size();i++){
			if(passlist.get(i).equals("1")){
				pass++;
			}else{
				npass++;
			}
		}
		%>
		<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['�հ�',    <%=pass%>],
        
          ['���հ�', <%=npass%>],
        
        ]);

        var options = {
          title: '�հݷ�'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	<div class="container">

		<div class="start">
			<h1 class="hidden-big">Online Test</h1>
			&nbsp;
			<h4 class="hidden-small">���� ������� ���ǽ��� ���α׷��Դϴ�.</h4>
			<div class="login_box">
				<div class="circle-image"></div>
				<form action="first.jsp">
					<input name="email" type="text" placeholder="���̵� �Է�"><br>
					<br> <input name="password" type="password"
						placeholder="�н����� �Է�"><br>
					<br> <select name="type">
						<option value="blank">������ ���� ���� ����</option>
						
						<%for(int i=0; i<list.size();i++){
							%>
							 <option value = "<%=list.get(i)%>"><%=list.get(i) %></option>                   
							<% 
						}
						%>
					</select> <br>
					<br> <input type="submit" class="button-submit" value="����">
					<input type="reset" class="button-submit" value="�缳��">
				</form>
			</div>
		</div>
	</div>



</body>
</html>