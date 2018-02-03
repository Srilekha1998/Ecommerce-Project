<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
				<th>Add to cart</th>
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
				<th>Add to cart</th>
			</tr>
		</tfoot>
	</table>
	<script type="text/javascript">
			$('#myTable').DataTable({
				ajax :{
					url : 'http://localhost:8000/Project/testing',
					dataSrc:''
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
						    return '<a class="btn btn-success btn-sm" href=${pageContext.request.contextPath}/user/addToCartItems/' + data + '>' + 'Add to cart' + '</a>';
						  }
				}]
			});
			</script>
</body>
</html>