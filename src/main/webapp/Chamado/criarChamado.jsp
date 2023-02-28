<%@page import="java.sql.SQLException"%>
<%@page import="br.com.DAO.ConexaoDAO"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@page import="br.com.DTO.ChamadoDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
	
	try{
		
		
		//instanciando objeto DTO
		ChamadoDTO objChamadoDTO = new ChamadoDTO(); 
				
		//setando valores obtidos no post para o objeto
		objChamadoDTO.setTitulo(request.getParameter("titulo"));
		objChamadoDTO.setCategoria(request.getParameter("categoria"));
		objChamadoDTO.setDescricao(request.getParameter("descricao"));

		//instanciando objeto DAO
		ChamadoDAO objChamadoDAO = new ChamadoDAO();
		
		//chamando metodo de criar chamado e passando o objeto DTO como parametro
		objChamadoDAO.CriarChamado(objChamadoDTO);
			
		response.sendRedirect("../index.html");
	}
	catch(Exception e){
		e.getMessage();
	}
	
	
	%>


</body>
</html>