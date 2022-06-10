<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mymember.MemberDAO" %>

<% request.setCharacterEncoding("utf-8");%>
<% 
   String id = (String)session.getAttribute("id");
   String passwd = request.getParameter("password");

   MemberDAO manager = MemberDAO.getInstance();
   int check = manager.userCheck(id, passwd);
   
   out.println(check);
%>