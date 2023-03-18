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
						
				//convertendo id obtido do get para int e setando para o objetoDTOinIndesbj
				int id_chamado = Integer.parseInt(request.getParameter("id_chamado"));
				objChamadoDTO.setId_chamado(id_chamado);
				
				//instanciando objeto DAO
				ChamadoDAO objChamadoDAO = new ChamadoDAO();
				
				//chamando metodo de excluir chamado por id e passando o objeto DTO como parametro
				objChamadoDAO.excluirChamado(objChamadoDTO);
				
				out.print(objChamadoDTO.getId_chamado());
				response.sendRedirect("listarChamadoVIEW.jsp");

			}
			catch(Exception e){
				e.getMessage();
			}
			
			
			%>

</body>
</html>