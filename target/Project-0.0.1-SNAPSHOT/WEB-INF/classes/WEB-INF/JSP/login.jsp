<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
 .input-group {
    position: relative;
    display: table;
    border-collapse: separate;
    padding-left: 250px;
    padding-right: 250px;
}

.checkbox label, .radio label {
    min-height: 20px;
    margin-bottom: 0;
    font-weight: 400;
    cursor: pointer;
    padding-left: 280px;
    padding-top: 7px;
}
 .checkbox, .radio {
    min-height: 27px;
    font-size: 16px;
}
</style>
</head>
<body background="${pageContext.request.contextPath}/resources/Images/art-gallery.jpg">
<div class="container">
  <form action="${pageContext.request.contextPath}/login" method="post">
  <div class="container">   
  <center>    
  <br><br><br>    
  <img src="${pageContext.request.contextPath}/resources/Images/download.png" class="img-circle" alt="profile-pic" width="180" height="180"> 
  </center>
</div>
<br><br>
    <div class="input-group form-group">
      <span class="input-group-addon input-lg"><i class="glyphicon glyphicon-user"></i></span>
      <input id="username" type="text" class="form-control input-lg" name="uname" placeholder="Username">
    </div>
    <br>
    <div class="input-group form-group">
      <span class="input-group-addon input-lg"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control input-lg" name="psw" placeholder="Password">
    </div>
    <div class="checkbox">
    <label><input type="checkbox">Remember me</label>
  </div>
  <br>
    <div class="container">    
  <center><button type="submit" class="btn btn-success btn-lg">Login</button></center>
</div>
  </form>
</div>
</body>
</html>