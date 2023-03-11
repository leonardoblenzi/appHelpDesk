<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="br.com.DAO.UsuarioDAO"%>
<%@page import="br.com.DTO.UsuarioDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		//instanciando usuario DTO
		UsuarioDTO usuarioDTO = new UsuarioDTO();
		
		usuarioDTO.setEmail(request.getParameter("email"));
		usuarioDTO.setSenha(request.getParameter("senha"));
		
		UsuarioDAO usuarioDAO = new UsuarioDAO();
		
		//chamando metodo de login recebendo o resultado do metodo true ou false
		Boolean login = usuarioDAO.login(usuarioDTO, request.getSession());
		
		if(login){
			response.sendRedirect("../home.jsp");
		}
		else{
			response.sendRedirect("../index.jsp?auth");
			
		}
		

	
	%>



</body>
</html>