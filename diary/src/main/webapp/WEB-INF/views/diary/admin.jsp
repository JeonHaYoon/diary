<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin 페이지</title>
</head>
<body>
<h1> /diary/admin</h1>

<p>principal : <sec:authentication property="principal"/></p>
 <p>MemberVO : <sec:authentication property="principal.member"/></p>
<p>사용자이름 : <sec:authentication property="principal.member.memberId"/></p>
<p>사용권한목록 : <sec:authentication property="principal.member.authList"/></p>

<form method="post" action="/diary/logout">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<button>로그아웃</button>
</form>
</body>
</html>