<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ghosts.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Haunted Adventures</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>


		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Erin's Zoo - Read</h1>

						<table style="width: 80%;">
							<tr>
								<th>Experience #</th>
								<th>Title of Exp</th>
								<th>Year</th>
								<th>City</th>
								<th>State/Country (if not in US)</th>
								<th>Brief Description of Experience</th>
							</tr>
							
							<% DAO.readFromDB();  %>
							
							<% 
							for(int i = 0; i < DAO.hauntedPlaces.size(); i++) { 
								Locations readToJSP = DAO.hauntedPlaces.get(i);
							%>
							<tr>
								<td><%= readToJSP.getLocationID() %></td>
								<td><%= readToJSP.getNameOfLocation() %></td>
								<td><%= readToJSP.getYearVisited() %></td>
								<td><%= readToJSP.getCityName() %></td>
								<td><%= readToJSP.getStateCountry() %></td>
								<td><%= readToJSP.getBriefDesExp() %></td>
								
								
							</tr>
							<% } DAO.hauntedPlaces.clear();%>
						</table>

					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>


</body>
</html>