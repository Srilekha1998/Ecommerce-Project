<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.form-horizontal .form-group {
    margin-right: -15px;
    margin-left: -15px;
    padding-left: 150px;
    padding-right: 150px;
}
.h1, h1 {
    font-size: 36px;
    padding-left: 85px;
}
.container {
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
    padding-top: 10px;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/resources/Images/art-gallery1.jpg">
<br>
<h1><center>SIGN UP</center></h1>
<div class="container">
<form:form class="form-horizontal" action="registration" modelAttribute="register">
  <div class="form-group">
     <!--<label class="control-label col-sm-2 input-lg" for="fname">Fname:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="fname" placeholder="Enter first name" path="fname"/>
        <form:errors path="fname"/>
     <!--</div>-->
  </div>
  <div class="form-group">
      <!--<label class="control-label col-sm-2 input-lg" for="lname">Lname:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="lname" placeholder="Enter last name" path="lname"/>
     <!-- </div>-->
  </div>
  <div class="form-group">
      <!--<label class="control-label col-sm-2 input-lg" for="email">Email:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="email" placeholder="Enter email id" path="email"/>
        <form:errors path="email"/>
      <!--</div>-->
  </div>
  <div class="form-group">
      <!-- <label class="control-label col-sm-2 input-lg" for="phoneNumber">Phone-Number:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="phoneNumber" placeholder="Enter phone number" path="phoneNumber"/>
        <form:errors path="phoneNumber"/>
      <!--</div>-->
  </div>
  <div class="form-group">
      <!--<label class="control-label col-sm-2 input-lg" for="uname">Uname:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="uname" placeholder="Enter user name" path="uname"/>
        <form:errors path="uname"/>
      <!--</div>-->
  </div>
  <div class="form-group">
      <!--<label class="control-label col-sm-2 input-lg" for="psw">Password:</label>
      <div class="col-sm-10">-->
        <form:input type="text" class="form-control input-lg" id="psw" placeholder="Enter password" path="psw"/>
        <form:errors path="psw"/>
      <!--</div>-->
  </div>
  <div class="form-group">
      <!-- <label class="control-label col-sm-2 input-lg" for="psw-repeat">Confirm Password:</label>
      <div class="col-sm-10">-->
        <input type="text" class="form-control input-lg" id="psw-repeat" placeholder="Re-enter password">
      <!--</div>-->
  </div>
  <div class="container">      
  <center><button type="submit" class="btn btn-success btn-lg">Sign Up</button></center>
</div>
</form:form>
</div>
</body>
</html>