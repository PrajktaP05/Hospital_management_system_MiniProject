<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="pstyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body {
	background: #e985df;
	font-family: arial;
}

.container h1 {
	margin-top: 20vh;
	text-align: center;
}
table, th, td {
	border: 2px double black;
	text-align: left;
}
th, td {
	padding: 1vh;
}

.bg_color {
	background: white;
}
div{
padding:1vh;
}
</style>
</head>
<body>
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%
	String id = request.getParameter("id");
	String userID = null;
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "hospital_management";
	String userId = "root";
	String password = "Praju@0520";

	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}

	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
	%>

	<div class="container">
		<h1><b>ADMIN | DASHBOARD</b></h1>
	</div>
	<section>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-10 bg_color">
				<div class="row">
					<div class="col-md-4">
						<div class="container border border-dark" style="height: 33vh;">
							<center>
								<div class="icon"
									style="background: #7FB3D5; width: 5rem; padding: 1vh; margin-top: 1vh;">
									<i class="fa-regular fa-face-smile rounded"
										style="font-size: 3rem; margin-top: 1vh; color: white;"></i>
								</div>
								<h1 style="margin-top: 0;">
									Manage <br>Patients
								</h1>
								<%
								try {
									connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
									statement = connection.createStatement();
									String sql = "SELECT Count(*) FROM patient";
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
								%>
								<span><a href="patients_details.jsp">Total patients:<%=resultSet.getString("Count(*)")%></a></span>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</center>
						</div>
					</div>
					<div class="col-md-4">
						<div class="container border border-dark" style="height: 33vh;">
							<center>
								<div class="icon"
									style="background: #7FB3D5; width: 5rem; padding: 1vh; margin-top: 1vh;">
									<i class="fa-regular fa-face-smile rounded"
										style="font-size: 3rem; margin-top: 1vh; color: white;"></i>
								</div>
								<h1 style="margin-top: 0;">
									Manage <br>Doctors
								</h1>
								<%
								try {
									connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
									statement = connection.createStatement();
									String sql = "SELECT Count(*) FROM Doctor_info";
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
								%>
								<span><a href="doctor_details.jsp">Total Doctors:<%=resultSet.getString("Count(*)")%></a></span>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</center>
						</div>
					</div>
					<div class="col-md-4">
						<div class="container border border-dark" style="height: 33vh;">
							<center>
								<div class="icon"
									style="background: #7FB3D5; width: 5rem; padding: 1vh; margin-top: 1vh;">
									<i class="fa-regular fa-face-smile rounded"
										style="font-size: 3rem; margin-top: 1vh; color: white;"></i>
								</div>
								<h1 style="margin-top: 0;">Appointments</h1>
								<%
								try {
									connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
									statement = connection.createStatement();
									String sql = "SELECT Count(*) FROM Appoinment_info";
									resultSet = statement.executeQuery(sql);
									while (resultSet.next()) {
								%>
								<span><a href="apoint_details.jsp">Total patients:<%=resultSet.getString("Count(*)")%></a></span>
								<%
								}
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
							</center>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>