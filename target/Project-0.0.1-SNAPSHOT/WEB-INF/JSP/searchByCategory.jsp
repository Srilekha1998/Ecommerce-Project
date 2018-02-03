<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

<style>
img {
    vertical-align: middle;
    width: 200px;
}
</style>

</head>
<body>
      <form:form action="${pageContext.request.contextPath}/admin/searchProduct" modelAttribute="product">
      <tr>
			    <td>Category:</td>
			    <td><form:select path="category.id">
			   	
			    	<form:options items="${categoryList}" itemLabel="cname" itemValue="id" ></form:options>
			    
			    </form:select>
			</tr>
			<tr>
				<td><input type="submit" value="Search" class="btn btn-primary"/></td>
			</tr>
      </form:form>
      
      <table id="myTable" class="display table table-hover" cellspacing="0"
		width="100%">
		<thead>
			<tr>
				<th>Id</th>
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Cost</th>
				<th>Category</th>
				<th>Image</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>
		

		<tfoot>
			<tr>
				<th>Id</th>
				<th>Product Name</th>
				<th>Product Description</th>
				<th>Cost</th>
				<th>Category</th>
				<th>Image</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
			$('#myTable').DataTable({
				ajax :{
					url : 'http://localhost:8000/Project/searching/${cid}',
					dataSrc:'',
					//data:'category.id'
				},
				columns : [ {
					data : 'id'
				}, {
					data : 'pname'
				}, {
					data : 'pdescription'
				}, {
					data : 'cost'
				}, {
					data : 'category.cname'
				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<img src="${pageContext.request.contextPath}/resources/Images/' + data + '.jpg">';
						  }

				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/updateproduct/' + data + '>' + 'Edit' + '</a>';
						  }
				},
				{
					data: 'id',
					bSortable : 'false' ,
					mRender : function(data, type, full) {
						    return '<a class="btn btn-info btn-sm" href=${pageContext.request.contextPath}/admin/deleteproduct/' + data + '>' + 'Delete' + '</a>';
						  }
				}]
			});
			</script>
      
</body>
</html>