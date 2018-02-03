<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#div1 {
     border: 5px solid #ccc;
     padding-top: 13px;
    padding-left: 50px;
    margin-left:300px;
    margin-right:30px;
}
#div2
{
    padding-bottom: 20px;
    padding-top: 20px;
}
h1 {
    padding-bottom: 16px;
}
</style>
</head>
<body>
<h1><center>REGISTER</center></h1>
<div id="div1">
<form:form action="registration" modelAttribute="register">
<div id="div2">
<label><b>Fname:</b></label>
<form:input type="text" name="fname" path="fname"/>
<form:errors path="fname"/><br><br>
<label><b>Lname:</b></label>
<form:input type="text" name="lname" path="lname"/><br><br>
<label><b>Email:</b></label>
    <form:input type="text" name="email" path="email"/>
    <form:errors path="email"/><br><br>
<label><b>Phone-Number:</b></label>
    <form:input type="text" name="phoneNumber" path="phoneNumber"/>
    <form:errors path="phoneNumber"/><br><br>
<label><b>Uname:</b></label>
    <form:input type="text" name="uname" path="uname"/>
    <form:errors path="uname"/><br><br>

    <label><b>Password:</b></label>
    <form:input type="password" name="psw"  path="psw"/>
    <form:errors path="psw"/><br><br>

    <label><b>Confirm Password:</b></label>
    <input type="password" name="psw-repeat"/><br><br>
    <button type="button" class="cancelbtn">Cancel</button>
    <button type="submit" class="signupbtn">Register</button>
    </div>
</form:form>
</div>
</body>
</html>