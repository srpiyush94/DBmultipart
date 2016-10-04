<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en-US">
<head>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 --></head>
<title>Spring 4 MVC + Hibernate</title>
<body>

	<c:url var="addAction" value="addItem"></c:url>

	<form:form action="${addAction}" modelAttribute="item" id="btn-add"
		enctype="multipart/form-data" method="POST">
		<h3>
			<c:if test="$(item.id==0}">
		       Add New Item
	            </c:if>
			<c:if test="${!empty Item.id}">
		      Update Item for Id: <c:out value="${item.id}" />
				<%--  <form:hidden path="id"/> --%>
			</c:if>
			</h3>

			<table >

				<tr>
					<c:if test="${item.id!=0}">
						<td>Id:</td>
						<td><form:input path="id" /></td>
					</c:if>
				<tr>
					<td>Name:</td>
					<td><form:input path="name" /></td>
				<tr>
					<td>Description:</td>
					<td><form:input path="description" /></td>
				<tr>
					<td>Price:</td>
					<td><form:input path="price" /></td>
				<tr>
					<td>Image<input type="file" name="file" id="image"></input></td>
				<tr>
					<td colspan="2"><c:if test="${item.id==0}">
							<input type="submit" value="Add" id="btn-add">
						</c:if> <c:if test="${item.id!=0}">
							<input type="submit" value="Update" id="btn-update">
						</c:if></td>
				<tr>
					<td colspan="2" class="success-msg"><c:out value="${msg}" /></td>
			</table>
			<table>
			

   <div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
       
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
        <thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Description</th>
					<th>Price</th>
					<th>Image</th>
					<th colspan="2">Action</th>
				</tr>
				<c:forEach var="obj" items="${allData}">
					<tr>
						<td><c:out value="${obj.id}" /></td>
						<td><c:out value="${obj.name}" /></td>
						<td><c:out value="${obj.description}" /></td>
						<td><c:out value="${obj.price}" /></td>
<td><img src="/springmvc/myImage/imageDisplay?id=${obj.id}" alt="" width="124" height="90" /></td>


						 <td><a href="deleteById/${obj.id}" class="btn-default btn">Delete </a> |
						  <a href="ItemById/${obj.id}" button type="button" class="btn btn-primary">Edit</a></td> 
							<!-- <button type="button" class="btn btn-primary">Primary</button> -->
					</tr>
					
				</c:forEach>
				
			</table>
			</div></div></div></div></table>
	</form:form>
 
	</table>



</body>
</html>
