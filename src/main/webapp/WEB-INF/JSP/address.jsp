<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.form-horizontal .form-group {
    margin-right: -15px;
    margin-left: -15px;
    padding-left: 150px;
    padding-right: 150px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    padding-top: 90px;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/resources/Images/art-gallery1.jpg">
<div class="container">
<form:form class="form-horizontal" action="${pageContext.request.contextPath}/addaddress/${register.id}" modelAttribute="address">
  <div class="form-group">
      <label class="control-label col-sm-2 input-lg" for="fname">Door No:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter door no" path="doorno"/>
        <form:errors path = "doorno"/>
      </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2 input-lg" for="fname">Street Name:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter street name" path="streetname"/>
        <form:errors path = "streetname"/>
      </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2 input-lg" for="fname">Area Name:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter area name" path="areaname"/>
        <form:errors path = "areaname"/>
      </div>
  </div>
   <div class="form-group">
      <label class="control-label col-sm-2 input-lg" for="fname">City:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter city" path="city"/>
        <form:errors path = "city"/>
      </div>
  </div>
  <div class="form-group">
      <label class="control-label col-sm-2 input-lg" for="fname">Pin code:</label>
      <div class="col-sm-10">
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter pincode" path="pincode"/>
        <form:errors path = "pincode"/>
      </div>
  </div>
  <br>
	   <center><button type="submit" class="btn btn-success btn-lg">Submit</button></center> 
	</form:form>
</div>
</body>
</html>