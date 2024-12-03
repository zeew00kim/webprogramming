<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>장바구니</title>
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

    .welcome-message {
      color: black;
      font-weight: bold;
    }

    .button {
      padding: 10px 20px;
      background-color: #B8D0FA;
      border: none;
      cursor: pointer;
      color: black;
      font-weight: bold;
      border-radius: 5px;
    }

    .button:hover {
      background-color: Skyblue;
      color: purple;
      transform: scale(1.05);
    }

    .cart-table {
      width: 80%;
      margin: 20px auto;
      border-collapse: collapse;
      border: solid silver 2px;
    }

    .cart-table th, .cart-table td {
      border: solid silver 2px;
      padding: 10px;
      text-align: center;
      font-size: 20px;
    }

    .cart-table th {
      background-color: #B8D0FA;
      font-weight: bold;
      border: solid silver 2px;
    }

    .cart-item img {
      width: 100px;
      height: auto;
    }

    .total-section {
      text-align: right;
      margin-right: 10%;
      font-size: 1.5em;
      font-weight: bold;
      margin-top: 20px;
    }
  </style>
</head>
<body>
  <div class="wrap">
    <header class="header">
      <div class="h1">
        <% 
          // 세션에서 로그인한 사용자 이름을 가져옵니다.
          String userName = (String) session.getAttribute("userName");
          if (userName != null) {
        %>
          <p class="welcome-message"><%= userName %>님 반갑습니다 😊</p>
          <form action="cart.jsp" method="post" style="display: inline;">
            <button type="submit" name="logout" class="button">로그아웃</button>
          </form>
        <% } else { %>
          <a href="register.jsp" class="button">회원가입</a>
          <a href="login.jsp" class="button">로그인</a>
        <% } %>
      </div>
      <div class="h2">
        <a href="index.jsp">
          <img src="../webservice/image/스크린샷 2024-11-28 210005.png" width="289" height="103" alt="로고">
        </a>
      </div>
      <nav class="h3">
        <div class="h3_center">
          <a href="all_item.jsp">전체상품</a>&nbsp;
          <a href="lotion.jsp">로션/크림</a>&nbsp;
          <a href="cleansing.jsp">클렌징</a>&nbsp;
          <a href="ampoule.jsp">앰플/세럼</a>&nbsp;
          <a href="board_list.jsp">Q&A 게시판</a>
        </div>
      </nav>
    </header>

    <main class="main">
      <h1 class="m1">장바구니</h1>
      <table class="cart-table">
        <thead>
          <tr>
            <th>이미지</th>
            <th>제품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>합계</th>
            <th>삭제</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="cart-item">
              <img src="../webservice/image/KakaoTalk_20241128_194419059_16.jpg" alt="제품 1">
            </td>
            <td>샘플 제품 1</td>
            <td>15000원</td>
            <td>2</td>
            <td>30000원</td>
            <td>
              <button type="button" class="button"><span style="font-size: 16px;">제품 삭제</span></button>
            </td>
          </tr>
          <tr>
            <td class="cart-item">
              <img src="../webservice/image/KakaoTalk_20241128_194419059_08.jpg" alt="제품 2">
            </td>
            <td>샘플 제품 2</td>
            <td>20000원</td>
            <td>1</td>
            <td>20000원</td>
            <td>
              <button type="button" class="button"><span style="font-size: 16px;">제품 삭제</span></button>
            </td>
          </tr>
          <tr>
            <td class="cart-item">
              <img src="../webservice/image/KakaoTalk_20241128_194419059_15.jpg" alt="제품 3">
            </td>
            <td>샘플 제품 3</td>
            <td>10000원</td>
            <td>3</td>
            <td>30000원</td>
            <td>
              <button type="button" class="button"><span style="font-size: 16px;">제품 삭제</span></button>
            </td>
          </tr>
        </tbody>
      </table>

      <div class="total-section">
        총 결제 금액: 80000원
      </div>
    </main>

    <footer class="footer">
      <span style="font-weight: bold">웹프로그래밍응용 Team_Project</span>
    </footer>
  </div>

  <% 
    // 로그아웃 처리
    if (request.getParameter("logout") != null) {
        session.invalidate();  // 세션 종료
        response.sendRedirect("index.jsp");  // 로그아웃 후 index.html로 리다이렉트
    }
  %>
</body>
</html>
