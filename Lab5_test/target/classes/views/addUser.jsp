<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Users</title>
<!-- Thêm thẻ link để tải Bootstrap CSS từ một phiên bản CDN -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<base href="/Lab5/">
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header bg-warning text-white">
            <h2 class="card-title">Add User</h2>
            <h2 class="card-subtitle">${message}</h2>
        </div>
        <div class="card-body">
            <form class="user/add" method="POST">
                <div class="mb-3">
                    <label for="userId" class="form-label"><i class="zmdi zmdi-account material-icons-name"></i> Username:</label>
                    <input type="text" id="userId" name="id" class="form-control" placeholder="Username" />
                </div>
                <div class="mb-3">
                    <label for="userPassword" class="form-label"><i class="zmdi zmdi-lock"></i> Password:</label>
                    <input type="password" id="userPassword" name="password" class="form-control" placeholder="Password" />
                </div>
                <div class="mb-3">
                    <label for="userFullname" class="form-label"><i class="zmdi zmdi-account-box"></i> Fullname:</label>
                    <input type="text" id="userFullname" name="fullname" class="form-control" placeholder="Fullname" />
                </div>
                <div class="mb-3">
                    <label for="userEmail" class="form-label"><i class="zmdi zmdi-email"></i> Your Email:</label>
                    <input type="email" id="userEmail" name="email" class="form-control" placeholder="Your Email" />
                </div>
                <div class="mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="userType" id="adminRadio" value="true">
                        <label class="form-check-label" for="adminRadio">
                            Admin
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="userType" id="userRadio" value="false" checked>
                        <label class="form-check-label" for="userRadio">
                            User
                        </label>
                    </div>
                </div>
                <div class="mb-3">
                    <button type="submit" name="addUserButton" class="btn btn-primary">Add User</button>
                </div>
            </form>
            <form action="userList" method="get">
                <button type="submit" class="btn btn-secondary">List of Users</button>
            </form>
        </div>
    </div>
</div>

<!-- Thêm thẻ script để tải Bootstrap JavaScript từ một phiên bản CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
