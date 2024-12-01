<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>회원가입 페이지</title>
  <link href="layout1.css" rel="stylesheet" type="text/css">
  <style type="text/css">
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

    .radio-group {
      display: flex;
      justify-content: center; 
      align-items: center; 
      gap: 20px; 
      margin-bottom: 10px;
    }

    .error-message {
      color: red;
      font-weight: bold;
      margin-bottom: 10px;
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
          <a href="ampoul.jsp">앰플/세럼</a>&nbsp;
          <a href="events.jsp">진행중 이벤트</a>
        </div>
        <div class="h3_right">
          <img src="../webservice/image/free-icon-font-search-17767794.png" width="24" height="24" alt="검색">
          <img src="../webservice/image/free-icon-font-user-17766671.png" width="24" height="24" alt="사용자">
        </div>
      </div>
    </div>

    <div class="main">
      <h1 class="m1">회원가입</h1>
      <div class="m2">
        <%
          // 에러 메시지 처리
          String error = request.getParameter("error");
          if ("passwordMismatch".equals(error)) {
        %>
          <div class="error-message">비밀번호가 일치하지 않습니다. 다시 입력해주세요.</div>
        <%
          }
        %>
        <form action="registerProcess.jsp" method="post" class="signup-form">
          <input type="text" name="name" placeholder="아이디를 입력하세요" required><br>
          <input type="password" name="password" placeholder="비밀번호를 입력하세요" required><br>
          <input type="password" name="confirm_password" placeholder="비밀번호 확인" required><br>
          <div class="radio-group">
            <label>
              <input type="radio" name="gender" value="male" required> 남성
            </label>
            <label>
              <input type="radio" name="gender" value="female" required> 여성
            </label>
          </div>
          <input type="submit" value="회원가입">
        </form>
      </div>
    </div>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>
</body>
</html>
