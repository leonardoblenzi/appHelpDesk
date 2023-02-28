<%@page import="br.com.DTO.ChamadoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <link rel="stylesheet" type="text/css" href="../style/estilo.css">

    <style>
      .card-consultar-chamado {
        padding: 30px 0 0 0;
        width: 100%;
        margin: 0 auto;
      }
    </style>
</head>
<body>
	
	
	   <nav class="navbar navbar-dark bg-dark">
	      <a class="navbar-brand" href="#">
	        <img src="../style/imagens/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
	        App Help Desk
	      </a>
	    </nav>

	    <div class="container">    
	      <div class="row">

	        <div class="card-consultar-chamado">
	          <div class="card">
	            <div class="card-header">
	              Consulta de chamado
	            </div>
	            
	           
	    <%
		
			try{
			
				
				ChamadoDAO objChamadoDAO = new ChamadoDAO();
				//lista de chamadoDTO recebe metodo de pesquisar que retorna a lista de chamados
				ArrayList<ChamadoDTO> lista = objChamadoDAO.pesquisarChamado();
				//obj stringBuilder para armazenar o html e variaveis
				StringBuilder chamadosHTML = new StringBuilder();
		
				
				 for(int posicao=0; posicao<lista.size(); posicao++){
					chamadosHTML.append("<div class=row>");
					chamadosHTML.append("<div class='card-body'>");
			     	chamadosHTML.append("<div class='card mb-3 bg-light'>");
			        chamadosHTML.append("<div class='card-body'>");
			        chamadosHTML.append("<h5 class='card-title'>" + lista.get(posicao).getTitulo() + "</h5>");
			        chamadosHTML.append("<h6 class='card-subtitle mb-2 text-muted'>" + lista.get(posicao).getCategoria() + "</h6>");
			        chamadosHTML.append("<p class='card-text'>" + lista.get(posicao).getDescricao() + "</p>");
			        chamadosHTML.append("</div>");
			        chamadosHTML.append("</div>");
			        chamadosHTML.append("</div>");
			        chamadosHTML.append("<div class='col-1 icones'>");
			        chamadosHTML.append("<a href='editarChamadoVIEW.jsp?id=" + lista.get(posicao).getId_chamado() + "'>");
			        chamadosHTML.append("<img src='../style/imagens/edit.png'> </a>");
			        chamadosHTML.append("</div>");
			        chamadosHTML.append("<div class='col-1 icones'>");
			        chamadosHTML.append("<a href='excluirChamadoVIEW.jsp?id=" + lista.get(posicao).getId_chamado() + "'>");
			        chamadosHTML.append("<img src='../style/imagens/excluir.png'> </a>");
			        chamadosHTML.append("</div>");
			        chamadosHTML.append("</div>");

			        }
				 
				 
			     out.print(chamadosHTML.toString());
			}
			catch(Exception e){
				e.getMessage();
			}
	%>

	              <div class="row mt-5">
	                <div class="col-6">
	                <a href="../index.html">
	                	<button class="btn btn-lg btn-warning btn-block" type="submit">Voltar</button>
	                </a>
	                </div>
	              </div>
	              
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>

	
	


</body>
</html>