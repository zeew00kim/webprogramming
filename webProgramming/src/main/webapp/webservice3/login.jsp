<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page import="webprogramming.WebDAO" %>

<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>로그인 페이지</title>
  <link href="layout1.css" rel="stylesheet" type="text/css">
  <style>
    html, body {
      margin: 0;
      padding: 0;
      overflow-x: hidden;
      width: 100%;
      box-sizing: border-box;
    }

    * {
      box-sizing: inherit;
    }
    a {
      text-decoration: none;
      font-weight: bold; 
      color: black;
    }
    a:hover {
      text-decoration: underline;
      color: purple !important;
      transform: scale(1.05);
    }
    .error {
      color: red;
      font-weight: bold;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <div class="wrap">
    <div class="header">
      <div class="h1">
        <a href="register.jsp">회원가입&nbsp;</a>
        <a href="login.jsp">로그인&nbsp;</a>
        <a href="cart.jsp">장바구니</a>
      </div>
      <div class="h2">
        <a href="index.jsp">
          <img src="../webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="로고">
        </a>
      </div>
      <div class="h3">
        <div class="h3_center">
          <a href="all_item.jsp">전체상품</a>&nbsp;
          <a href="lotion.jsp">로션/크림</a>&nbsp;
          <a href="cleansing.jsp">클렌징</a>&nbsp;
          <a href="ampoule.jsp">앰플/세럼</a>&nbsp;
          <a href="board_list.jsp">Q&A 게시판</a>
        </div>
        <div class="h3_right">
          <img src="../webservice/image/free-icon-font-search-17767794.png" width="24" height="24" alt="검색">
          <img src="../webservice/image/free-icon-font-user-17766671.png" width="24" height="24" alt="사용자">
        </div>
      </div>
    </div>

    <div class="main">
      <h1 class="m1">로그인</h1>
      <div class="m2">
        <div class="login-area">
          <form method="post">
            <input type="text" name="memberId" placeholder="아이디 또는 이메일" required><br>
            <input type="password" name="password" placeholder="비밀번호" required><br>
            <input type="submit" value="로그인"><br>
            <a href="register.jsp">회원가입</a>&nbsp;
          </form>

          <!-- 로그인 실패 시 에러 메시지 출력 -->
          <%
            String error = request.getParameter("error");
            if ("invalid".equals(error)) {
          %>
            <p class="error">등록되지 않은 계정입니다 😢</p>
          <%
            }
          %>

          <%
            // 로그인 처리
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String memberId = request.getParameter("memberId").trim();  // 공백 제거
                String password = request.getParameter("password").trim(); // 공백 제거

                WebDAO dao = new WebDAO();
                boolean isValidUser = dao.isValidUser(memberId, password);

                if (isValidUser) {
                    // 로그인 성공 시 세션에 사용자 정보를 저장
                    session.setAttribute("userName", memberId);  // 세션에 아이디 저장
                    response.sendRedirect("index.jsp");  // 로그인 성공 시 index.jsp로 이동
                } else {
                    response.sendRedirect("login.jsp?error=invalid");  // 로그인 실패 시 다시 login.jsp로 리다이렉트
                }
            }
          %>
        </div>
      </div>
    </div>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>
</body>
</html>
