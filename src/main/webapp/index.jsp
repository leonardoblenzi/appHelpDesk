<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<html>
  <head>
    <meta charset="utf-8" />
    <title>App Help Desk</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

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

        <div class="card-login">
          <div class="card">
            <div class="card-header">
              Login
            </div>
            <div class="card-body">
              <form action="Usuario/loginUsuario.jsp" method="post">

                <div class="form-group">
                  <input name="email" type="email" class="form-control" placeholder="E-mail" required="required">
                </div>
                <div class="form-group">
                  <input name="senha" type="password" class="form-control" placeholder="Senha" required="required">
                </div>
                
                <%
                	String auth = request.getParameter("auth");
            		String denied = request.getParameter("denied");

                	if(auth != null){
                		StringBuilder mensagem = new StringBuilder();
                		mensagem.append("<div class=text-danger>");
                		mensagem.append("Usuário ou senha inválidos");
                		mensagem.append("</div>");
                		out.print(mensagem);
                	}
                	
                	if(denied != null){
                		StringBuilder mensagem = new StringBuilder();
                		mensagem.append("<div class=text-danger>");
                		mensagem.append("Acesso não permitido");
                		mensagem.append("</div>");
                		out.print(mensagem);
                	}
                %>
                
                
                
                <button class="btn btn-lg btn-info btn-block" type="submit">Entrar</button>
              </form>
            </div>
          </div>
        </div>
    </div>
    </div>
  </body>
</html>