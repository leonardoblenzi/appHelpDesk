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
				
		int id = Integer.parseInt(request.getParameter("id"));
		
		objChamadoDTO.setId_chamado(id);
		
		objChamadoDTO.setTitulo(request.getParameter("titulo"));
		objChamadoDTO.setCategoria(request.getParameter("categoria"));
		objChamadoDTO.setDescricao(request.getParameter("descricao"));
		
		//instanciando objeto DAO
		ChamadoDAO objChamadoDAO = new ChamadoDAO();
		//chamando metodo de excluir chamado por id e passando o objeto DTO como parametro
		objChamadoDAO.editarChamado(objChamadoDTO);
			
		response.sendRedirect("listarChamado.jsp");

	}
	catch(Exception e){
		e.getMessage();
	}
	
	
	%>


</body>
</html>