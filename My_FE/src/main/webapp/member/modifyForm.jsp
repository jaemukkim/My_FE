<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mymember.MemberDTO" %>
<%@ page import = "mymember.MemberDAO" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="../css/join.css"/>
    <script src="../js/jquery-1.12.3.js"></script>    
    <script src="../js/jquery-1.11.0.min.js"></script>
<script src="../js/script.js" defer type="text/javascript"></script>
<script src="modify.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

   <header>
       <div class="top">
           <div class="logo">
               <a href="mainM.jsp"><img src="../images/aswine.jpg" alt="로고"></a>
           </div>
           <nav class="menu">
               <ul class="navi">
                   <li><a href="#">Wine</a>
                       <ul class="submenu">
                           <li><a href="#">Red Wine</a></li>
                           <li><a href="#">White Wine</a></li>
                           <li><a href="#">Sparkling Wine</a></li>
                           <li><a href="#">Rose Wine</a></li>
                       </ul>
                   </li>
                   <li><a href="#">Whisky</a>
                       <ul class="submenu">
                           <li><a href="#">Malt Whisky</a></li>
                           <li><a href="#">Grain Whisky</a></li>
                           <li><a href="#">Blended Whisky</a></li>
                       </ul>
                   </li>
                   <li><a href="#">Country</a>
                       <ul class="submenu">
                           <li><a href="#">뉴질랜드</a></li>
                           <li><a href="#">프랑스</a></li>
                           <li><a href="#">스페인</a></li>
                           <li><a href="#">독일</a></li>
                           <li><a href="#">호주</a></li>
                           <li><a href="#">미국</a></li>
                       </ul>
                   </li>
                   <li><a href="#">Event</a>
                       <ul class="submenu">
                           <li><a href="#">원데이클래스</a></li>
                           <li><a href="#">오프라인 시음</a></li>
                           <li><a href="#">판매행사</a></li>
                           <li><a href="#">봄맞이행사</a></li>
                       </ul>
                   </li>
                   <li><a href="#">About</a>
                       <ul class="submenu">
                           <li><a href="#">회사 소개</a></li>
                           <li><a href="#">브랜드 소개</a></li>
                           <li><a href="#">온라인 예약</a></li>
                           <li><a href="#">매장안내</a></li>
                       </ul>
                   </li>
               </ul>
           </nav>
       </div>
       <div class="logotop"></div>  
       
       
    <header>
        <h2>회원정보 수정</h2>
    </header>

<% request.setCharacterEncoding("utf-8");%>

<% 
  String id = (String)session.getAttribute("id");
  String password = request.getParameter("password");

  MemberDAO manager = MemberDAO.getInstance();
  MemberDTO m = manager.getMember(id,password); 
    
  try{
%>
   			<div class="input-box" id="regForm">
              <input id="id" type="text" name="id" value=<%=id%> readonly disabled>
              <label for="id">아이디(*변경불가*)</label>
            </div>
            <div class="input-box">
              <input id="password" type="password" name="password" >
              <label for="password">비밀번호</label>
            </div>
            <div class="input-box">
                <input id="name" name="name" type="text" value="<%=m.getName()%>">
                <label for="name">이름</label>
            </div>
            <div class="input-box">
                <input id="address" name="address" type="text" value="<%=m.getAddress()%>">
                <label for="address">주소</label>
            </div>
            <div class="input-box">
                <input id="phone" name="phone" type="tel" value="<%=m.getPhone()%>">
                <label for="phone">전화번호</label>
            </div>
            <div class="label2">
             <button id="modifyProcess">수정</button>
          	 <button id="cancle">취소</button>
          	</div>
          
<%}catch(Exception e){}%>

