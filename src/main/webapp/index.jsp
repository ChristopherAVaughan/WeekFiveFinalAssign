<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.ghosts.*"%>

<!DOCTYPE html>
<html lang="en">



<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">



<title>Haunted Home and Ghost Tours</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">

<!-- Theme CSS -->
<link href="css/grayscale.min.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<!-- Navigation -->
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-main-collapse">
					Menu <i class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top"> <i
					class="fa fa-play-circle"></i> <span class="light">Home</span>
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div
				class="collapse navbar-collapse navbar-right navbar-main-collapse">
				<ul class="nav navbar-nav">
					<!-- Hidden li included to remove active class from about link when scrolled up past about section -->
					<li class="hidden"><a href="#page-top"></a></li>
					<li><a class="page-scroll" href="#about">View List</a></li>
					<li><a class="page-scroll" href="#download">Previous Tour
							Experiences</a></li>
					<li><a class="page-scroll" href="#contact">Schedule Tour</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Intro Header -->
	<header class="intro">
		<div class="intro-body">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="brand-heading">Haunted Adventure</h1>
						<p class="intro-text">
							The world's premier paranormal tour company. We got the ghosts! <br>
						</p>
						<a href="#about" class="btn btn-circle page-scroll"> <i
							class="fa fa-angle-double-down animated"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- About Section -->
	<section id="about" class="container content-section text-center">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Past Experiences:</h2>
				<table style="width: 80%;" class="table-bordered">
					<tr>
						<th>ID</th>
						<th>Experience Title</th>
						<th>Year</th>
						<th>City</th>
						<th>State/Country</th>
						<th>Description of Exp</th>
					</tr>

					<% DAO.readFromDB(); %>
					<%! Locations readToWebsite = new Locations(); %>
					<% for(int i = 0; i < DAO.hauntedPlaces.size(); i++) {
					readToWebsite = DAO.hauntedPlaces.get(i); %>
					<tr>
						<td><%= readToWebsite.getLocationID() %></td>
						<td><%= readToWebsite.getNameOfLocation() %></td>
						<td><%= readToWebsite.getYearVisited() %></td>
						<td><%= readToWebsite.getCityName() %></td>
						<td><%= readToWebsite.getStateCountry() %></td>
						<td height:50px><%= readToWebsite.getBriefDesExp() %></td>

					</tr>
					<% } DAO.hauntedPlaces.clear();%>
				</table>
			</div>
		</div>
	</section>
	<section id="download" class="content-section text-center">
		<div class="download-section">
			<div class="container">
				<div class="col-lg-8 col-lg-offset-2">

					<div class="container">
						<h2>Tell us about your experience with us!</h2>
						<p>
							We value our customer and your feedback matters to us.<br />
							Please click the link below to give us your feedback.
						</p>
						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-info btn-lg"
							data-toggle="modal" data-target="#myModal">Click Here</button>

						<!-- Modal -->
						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content" style="background-color: gray;">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h2 class="modal-title">Tell Us About Your Experience</h2>
									</div>
									<div class="modal-body" style="background-color: gray;">
										<form action="addToDB" method="post">
											What is name/location you has the supernatural experience?:<br>
											<input type="text" name="name_of_location"
												style="color: black"> <br> In what year did you
											have this experience?:<br> <input type="text"
												name="year_visited" style="color: black"> <br>
											In what city did you have this experience?:<br> <input
												type="text" name="city" style="color: black"> <br>
											In what state did this happen, enter in country if it
											occurred outside the USA?:<br> <input type="text"
												name="state_or_country" style="color: black"> <br>
											Please briefly describe your encounter?<br> <input
												type="text" name="description_of_experience"
												style="color: black"> <br> <br> <input
												type="submit" value="Submit">
										</form>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact Section -->
	<section id="contact" class="container content-section text-center">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2">
				<h2>Schedule a Guided Tour</h2>
				<p>We offer one of a kind guided tours of the world's notable
					and lesser known haunted locations. Our experienced guides will
					lead you on an intimate and up close tour whether it's a guided
					walk or overnight ghost hunt. Contact using the links below:</p>
				<p>
					Phone: 1-866-UNDEAD1<br /> <a
						href="mailto:scheduletour@HauntedAdventure.com">mailto:ScheduleTour@HauntedAdventure.com</a>
				</p>
				<ul class="list-inline banner-social-buttons">
					<li><a href="https://twitter.com/SBootstrap"
						class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i>
							<span class="network-name">Twitter</span></a></li>

					<li><a href="https://plus.google.com/+Startbootstrap/posts"
						class="btn btn-default btn-lg"><i
							class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
					</li>
				</ul>
			</div>
		</div>
	</section>

	<!-- Map Section -->
	<div id="map"></div>

	<!-- Footer -->
	<footer>
		<div class="container text-center">
			<p>Copyright &copy; Your Website 2016</p>
		</div>
	</footer>

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

	<!-- Theme JavaScript -->
	<script src="js/grayscale.min.js"></script>

</body>

</html>
