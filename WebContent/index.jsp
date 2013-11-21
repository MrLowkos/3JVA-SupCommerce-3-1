<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Welcome - HTML Page</title>
	<!-- CSS bootstrap 3.0 --> 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">					
</head>
					
<body>
				
	<div id="header" class="navbar navbar-fixed-top navbar-inverse">
		<div class="container">
			<header class="navbar-header">
				<button class="navbar-toggle collapsed" data-target=".navbar-collapse" data-toggle="collapse" type="button">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/SupCommerce-3-1">SupCommerce 3.1</a>
			</header>
			<nav class="navbar-collapse collapse" style="height: 0.8px;">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/SupCommerce-3-1"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
					<li><a href="/SupCommerce-3-1/listProduct"><span class="glyphicon glyphicon-list"></span>&nbsp; Products List</a></li>
					<li><a href="/SupCommerce-3-1/auth/basicInsert"><span class="glyphicon glyphicon-random"></span>&nbsp; Random Product</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<section id="main-container" class="container">
		<div class="row">
			<div class="jumbotron">
				<h1>Welcome to SupCommerce<br/>
				<small>A product's manager site.</small></h1>
			</div>
		</div>
	</section>
					
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
</body>
					
</html>