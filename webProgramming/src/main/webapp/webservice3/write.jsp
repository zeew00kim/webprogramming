<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>글 작성하기</h2>
<%@ include file="header.jsp" %>

<form action="write_process.jsp" method="post">
    <label>제목: <input type="text" name="title" required></label><br><br>
    <label>작성자: <input type="text" name="author" required></label><br><br>
    <label>내용:</label><br>
    <textarea name="content" rows="10" cols="50" required></textarea><br><br>
    <input type="submit" value="글 작성">
</form>

    <%@ include file="footer.jsp" %>

