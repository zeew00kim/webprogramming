<%@ page import="webprogramming.WebDAO" %>
<%@ page pageEncoding="UTF-8" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm_password");
    String gender = request.getParameter("gender");
    int genderInt = "male".equals(gender) ? 1 : 2;

    WebDAO dao = new WebDAO();

    try {
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=passwordMismatch");
        } else if (dao.isDuplicateId(name)) {
            response.sendRedirect("register.jsp?error=duplicateId");
        } else if (dao.isDuplicatePassword(password)) {
            response.sendRedirect("register.jsp?error=duplicatePassword");
        } else {
            boolean isInserted = dao.insertUser(name, password, genderInt);
            if (isInserted) {
                response.sendRedirect("register.jsp?success=true");
            } else {
                response.sendRedirect("register.jsp?error=insertFailed");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("register.jsp?error=exception");
    }
%>
