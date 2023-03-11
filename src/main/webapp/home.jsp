<%
	session = request.getSession(false); //Obtém a sessão atual, mas não cria uma nova se ela não existir
	if(session == null || session.getAttribute("usuarioLogado") == null) {
		response.sendRedirect("index.jsp?denied");
	} 
		
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>App Help Desk</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="style/estilo.css">

  </head>

  <body>

    <nav class="navbar navbar-dark bg-dark">
      <a class="navbar-brand" href="#">
        <img src="style/imagens/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
        App Help Desk
      </a>
    </nav>

    <div class="container">    
      <div class="row">
        <div class="card-home">
          <div class="card">
            <div class="card-header">
              Menu
            </div>

            <div class="card-body">
              <div class="row">

                <div class="col-6 d-flex justify-content-center">

                  <img src="style/imagens/formulario_abrir_chamado.png" width="70" height="70">
                <div class="col align-self-center">

                  <a href="Chamado/criarChamadoVIEW.jsp">
                    <h5 class="lead">Abrir chamado</h5>
                  </a>
                </div>

                </div>
                <div class="col-6 d-flex align-items-end">

                  <img src="style/imagens/formulario_consultar_chamado.png" width="70" height="70">
                  <div class="align-self-center">

                    <a href="Chamado/listarChamadoVIEW.jsp">
                      <h5 class="lead">Consultar chamados</h5>
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