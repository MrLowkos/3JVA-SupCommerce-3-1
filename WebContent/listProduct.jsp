<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.supinfo.sun.supcommerce.bo.SupProduct"%>
<%@ page import="com.supinfo.sun.supcommerce.doa.SupProductDao" %>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>

<%
String error = "No product registered !";
final DecimalFormat priceFormat = new DecimalFormat("0.00 €");
final List<SupProduct> products = SupProductDao.getAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
 				
<head>
 	<meta charset="UTF-8">
 	<meta content="IE=edge" http-equiv="X-UA-Compatible">
 	<meta content="width=device-width, initial-scale=1.0" name="viewport">
 	<title>ListProduct - JSP</title>
 	<%-- CSS bootstrap 3.0 --%> 
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
 	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style.css">					
</head>
 					
<body>

<%@include file="/WEB-INF/template/header.jsp" %>

<section id="main-container" class="container">
	<div class="row">
		<h1 class="col-sx-12 col-sm-12 col-md-12 col-lg-12">Product List</h1>
		<% if(products.isEmpty()) { %>
			<div class="alert alert-danger col-sx-12 col-sm-12 col-md-12 col-lg-12">
				<h3><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= error %></h3>
			</div>			
		<% } else { %>
			<% for(SupProduct p : products) { %>
				<div class="col-sx-12 col-sm-6 col-md-4 col-lg-3">
					<article class="panel panel-primary">												
						<header class="panel-heading">
							<h3>
								<a href="<%= application.getContextPath() %>/showProduct.jsp?id=<%= p.getId()%>">
									<span class="glyphicon glyphicon-tag"></span>&nbsp; Product Id: <%= p.getId() %>
								</a>
							</h3>
						</header>
						<section class="panel-body">
					       <p>Product name: <%= p.getName() %></p>
					       <p>Product description: <%= p.getContent() %></p>
					       <p>Product price: <%=  priceFormat.format(p.getPrice()) %></p>
					    </section>
				    </article>
			   </div>
		   <% } %>	
		<% } %>		
	</div>
</section>
		 
<%@include file="/WEB-INF/template/footer.jsp" %>

</body>
</html>