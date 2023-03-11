<%@page import="br.com.DTO.UsuarioDTO"%>
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
    </nav>

    <div class="container">    
      <div class="row">

        <div class="card-abrir-chamado">
          <div class="card">
            <div class="card-header">
              Abertura de chamado
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col">
                  
                  <form action="criarChamado.jsp" method="POST">
                  
                    <div class="form-group">
                      <label>Título</label>
                      <input type="text" class="form-control" placeholder="Título" name="titulo" required="required">
                    </div>
                    
                    <div class="form-group">
                      <label>Categoria</label>
                      
                      <select class="form-control" name="categoria" required="required">
                        <option>Criar Usuário</option>
                        <option>Impressora</option>
                        <option>Hardware</option>
                        <option>Software</option>
                        <option>Rede</option>
                      </select>
                      
                    </div>
                    
                    <div class="form-group">
                      <label>Descrição</label>
                      <textarea class="form-control" rows="3" name="descricao" required="required"></textarea>
                    </div>
                    
                 

                    <div class="row mt-5">
                      <div class="col-6">
                      	<a href="../home.jsp">
                      		<button class="btn btn-lg btn-warning btn-block" type="button">Voltar</button>
                      	</a>
                        
                      </div>

                      <div class="col-6">
                        <button class="btn btn-lg btn-info btn-block" type="submit">Abrir</button>
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