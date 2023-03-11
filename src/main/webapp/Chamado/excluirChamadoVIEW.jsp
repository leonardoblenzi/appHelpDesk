<%@page import="br.com.DTO.UsuarioDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@page import="br.com.DTO.ChamadoDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//verificando se usuario esta logado
	session = request.getSession(false); //Obtém a sessão atual, mas não cria uma nova se ela não existir
	if(session == null || session.getAttribute("usuarioLogado") == null) {
		response.sendRedirect("../index.jsp?denied");
	} 
	//verificando se usuario é administrador para acessar pagina restrita
	UsuarioDTO usuarioLogado = (UsuarioDTO) session.getAttribute("usuarioLogado");
	String funcao = usuarioLogado.getFuncao();
	if(!funcao.equals("Administrador")){
		response.sendRedirect("../home.jsp?denied");
	}
		
%>
<html>
  <head>
    <meta charset="utf-8" />
    <title>App Help Desk</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    <link rel="stylesheet" type="text/css" href="../style/estilo.css">

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
            <form action="excluirChamado.jsp" method="GET">
            
            
	            <div class="row"><!--inicio linha-->
	
	              <div class="col-md-12 card-body"><!--coluna 1 - chamado-->
	                <div class="card mb-3 bg-light">
	                
	                  <div class="card-body">
	                  
	                  <div class="form-group">
	                  <label class="font-weight-bold">ID Chamado</label>
                      <input type="text" readonly class="form-control-plaintext" name="id_chamado" value="<%=chamadoDTO.getId_chamado() %>">
                   	 </div>
          
	                  
	                  <div class="form-group">
	                  	<label class="font-weight-bold">Titulo</label>
	                  	<input type="text" readonly class="form-control-plaintext" name="titulo" value="<%=chamadoDTO.getTitulo() %>">
	                  </div>
	                    
	                  <div class="form-group">
	                  <label class="font-weight-bold">Categoria</label>
	                  	  <input type="text" readonly class="form-control-plaintext" name="categoia" value="<%=chamadoDTO.getCategoria() %>">
	                  </div>
	  
	                  <div class="form-group">
	                  	<label class="font-weight-bold">Descricao</label>
	                 		<input type="text" readonly class="form-control-plaintext" name="descricao" value="<%=chamadoDTO.getDescricao() %>">
	                  </div>
	                  
	                  <div class="form-group">
	                  	<label class="font-weight-bold">ID Usuario</label>
	                 		<input type="text" readonly class="form-control-plaintext" name="id_usuario" value="<%=chamadoDTO.getId_usuario() %>">
	                  </div>
	  	
	                 </div>
	                </div>
            		</div>
            	</div><!--fim linha-->
            
            
           

              <div class="row mt-5">
              
                <div class="col-6">
                <a href="listarChamadoVIEW.jsp">
                	<button class="btn btn-lg btn-warning btn-block" type="button">Voltar</button>
                </a>
	               		                		                
                </div>
                
                <div class="col-6">
	               	<button class="btn btn-lg btn-danger btn-block" type="submit">Confirmar exclusão</button>                	  
                </div>
                
                </div>
                
                </form>
                
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>