<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<base href="/Lab5/">
</head>
<body>
<div class="container mt-5">
<div class="card">
  <div class="card-header bg-warning text-light">Update User</div>
  <div class="card-body">
      <form class="user/edit" method="POST">
        <div class="mb-3">
            <label for="userId" class="form-label"><i class="zmdi zmdi-account material-icons-name"></i> User ID:</label>
            <input type="hidden" id="userId" name="id" value="${user.id}" />
            <span>${user.id}</span>
        </div>
        <div class="mb-3">
            <label for="userPassword" class="form-label"><i class="zmdi zmdi-lock"></i> Password:</label>
            <input type="password" id="userPassword" name="password" class="form-control" placeholder="Password" value="${user.password}" />
        </div>
        <div class="mb-3">
            <label for="userFullname" class="form-label"><i class="zmdi zmdi-account-box"></i> Fullname:</label>
            <input type="text" id="userFullname" name="fullname" class="form-control" placeholder="Fullname" value="${user.fullname}" />
        </div>
        <div class="mb-3">
            <label for="userEmail" class="form-label"><i class="zmdi zmdi-email"></i> Your Email:</label>
            <input type="email" id="userEmail" name="email" class="form-control" placeholder="Your Email" value="${user.email}" />
        </div>
        <div class="mb-3" style="margin-left: 35px">
            <label class="form-check-label">
                <input type="radio" name="userType" value="true" class="form-check-input" ${user.admin?"checked":""} /> Admin
            </label>
            <label class="form-check-label ml-3">
                <input type="radio" name="userType" value="false" class="form-check-input" ${!user.admin?"checked":""} /> User
            </label>
        </div>
        <div class="mb-3">
            <input type="submit" name="updateUserButton" class="btn btn-primary" value="Edit User" formaction="user/edit" />
        </div>
    </form>
    <a href="userList" class="btn btn-secondary">List of Users</a>
  </div>

</div>
  </div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
