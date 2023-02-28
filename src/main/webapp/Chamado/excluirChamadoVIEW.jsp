<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@page import="br.com.DTO.ChamadoDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<html>
  <head>
    <meta charset="utf-8" />
    <title>App Help Desk</title>

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
              Tem certeza que deseja excluir esse chamado ?
            </div>
            
            <%
            String idChamado = request.getParameter("id");
            ChamadoDAO chamadoDAO = new ChamadoDAO();
            ChamadoDTO chamadoDTO = new ChamadoDTO();
            
            chamadoDTO = chamadoDAO.buscarChamadoPorId(Integer.parseInt(idChamado));
            %>
            
            <div class="row"><!--inicio linha-->

              <div class="col-md-12 card-body"><!--coluna 1 - chamado-->
                <div class="card mb-3 bg-light">
                  <div class="card-body">
                    <h5 class="card-title" name="id"><%=chamadoDTO.getTitulo() %></h5>
  
                    <h6 class="card-subtitle mb-2 text-muted"><%=chamadoDTO.getCategoria() %></h6>
                    <p class="card-text"><%=chamadoDTO.getDescricao() %></p>
  
                  </div>
                </div>
            </div>
            
            

               </div><!--fim linha-->

         
        
           

              <div class="row mt-5">
                <div class="col-6">
	                <a href="listarChamado.jsp">
	               		<button class="btn btn-lg btn-warning btn-block" type="submit">Voltar</button>                	
	                </a>
                </div>
                
                <div class="col-6">
	                <a href="excluirChamado.jsp?id=<%=chamadoDTO.getId_chamado()%>">
	               		<button class="btn btn-lg btn-danger btn-block" type="submit">Confirmar exclusão</button>                	
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