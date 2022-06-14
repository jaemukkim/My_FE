<%
  session.invalidate();//세션무효�
  response.sendRedirect("main.jsp");
%>