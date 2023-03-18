<%@page import="br.com.DTO.UsuarioDTO"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@page import="br.com.DTO.ChamadoDTO"%>
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
<!DOCTYPE html>
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
      <form class="form-inline" action="Usuario/logoutUsuario.jsp">
			<button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Deslogar</button>
		</form>
    </nav>

    <div class="container">    
      <div class="row">

        <div class="card-abrir-chamado">
          <div class="card">
            <div class="card-header">
              Editar chamado
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col">
                  
                  <form action="editarChamado.jsp" method="POST">
                  
                  <%
		            String idChamado = request.getParameter("id");
                  
		            ChamadoDAO chamadoDAO = new ChamadoDAO();
		            ChamadoDTO chamadoDTO = new ChamadoDTO();
		            
		            chamadoDTO = chamadoDAO.buscarChamadoPorId(Integer.parseInt(idChamado));
		            %>
            
                  
                    <div class="form-group">
                    <!-- pegando id no BD -->
                      <label>ID</label>
                      <input type="text" class="form-control" placeholder="ID" name="id" value="<%=chamadoDTO.getId_chamado()%>">
                    </div>
          
                    
                    <div class="form-group">
                    <!-- pegando titulo no BD -->
                      <label>Título</label>
                      <input type="text" class="form-control" placeholder="Título" name="titulo" value="<%=chamadoDTO.getTitulo()  %>">
                    </div>
                    
                    <div class="form-group">
                      <label>Categoria</label>
                      
                      <!-- pegando categoria selected no BD -->
                      <select class="form-control" name="categoria">
                        <%
					        String[] categorias = {"Criar Usuário", "Impressora", "Hardware", "Software", "Rede"};
					        for (String categoria : categorias) {
					            if (categoria.equals(chamadoDTO.getCategoria())) {
					                out.println("<option selected>" + categoria + "</option>");
					            } else {
					                out.println("<option>" + categoria + "</option>");
					            }
					        }
					      %>
                      </select>
                      
                    </div>
                    <!-- pegando descição do BD e removendo espaços em branco -->
                    <div class="form-group">
                      <label>Descrição</label>
                      <textarea class="form-control" rows="3" name="descricao"><%=chamadoDTO.getDescricao().trim() %>
                      </textarea>
                    </div>

					<!-- botao para voltar -->
                    <div class="row mt-5">
                      <div class="col-6">
	                      <a href="listarChamadoVIEW.jsp">
	                      	<button class="btn btn-lg btn-warning btn-block" type="button">Voltar</button>
	                      </a>
                        
                      </div>


					<!-- botao que envia os dados do formulario -->
                      <div class="col-6">
                     	
                        <button class="btn btn-lg btn-info btn-block" type="submit">Editar</button>
                      </div>
                      
                      
                      
                      
                    </div>
                    
                    
                    
                    
                  </form>
				</div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
  </body>
</html>