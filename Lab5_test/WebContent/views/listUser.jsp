<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="/Lab5/">
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<style>
    .table-bordered {
        border: 2px solid #000 !important;
    }
    .thead-dark {
        background-color: #343a40 !important;
        color: #fff !important;
    }
    .table td, .table th {
        border: 1px solid #000 !important;
    }
</style>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="mt-5 mb-3">LIST USERS</h2>
                <h2>${message }</h2>
                <h2><a href="user/add">Add new User</a></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered">
                    <thead class="bg-warning " style="color: white;">
                        <tr>
                            <th>No.</th>
                            <th>User ID</th>
                            <th>Fullname</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUsers}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${user.id}</td>
                                <td>${user.fullname}</td>
                                <td>${user.email}</td>
                                <td>${user.admin ? 'Admin' : 'User'}</td>
                                <td><a href="user/edit?id=${user.id}" style="color: green">Edit</a> | <a href="user/delete?id=${user.id}" style="color: red">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
