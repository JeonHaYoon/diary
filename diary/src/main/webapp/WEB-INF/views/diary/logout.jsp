<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout Page</title>
</head>
<body>
<form method="post" action="/diary/logout">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<button>로그아웃</button>
</form>
</body>
</html>