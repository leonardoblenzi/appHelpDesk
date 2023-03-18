<%@page import="br.com.DAO.UsuarioDAO"%>
<%@page import="br.com.DTO.UsuarioDTO"%>
<%@page import="br.com.DTO.ChamadoDTO"%>
<%@page import="br.com.DAO.ChamadoDAO"%>
<%@page import="java.util.ArrayList"%>

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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

	        <div class="card-consultar-chamado">
	          <div class="card">
	            <div class="card-header">
	              Consulta de chamado
	            </div>
	            
	           
	    <%
		
			try{
				UsuarioDAO usuarioDAO = new UsuarioDAO();
				
				ChamadoDAO objChamadoDAO = new ChamadoDAO();
				//lista de chamadoDTO recebe metodo de pesquisar que retorna a lista de chamados
				ArrayList<ChamadoDTO> lista = objChamadoDAO.pesquisarChamado();
				//obj stringBuilder para armazenar o html e variaveis
				StringBuilder chamadosHTML = new StringBuilder();
		
				
				 for(int posicao=0; posicao<lista.size(); posicao++){
					int idUsuario = lista.get(posicao).getId_usuario();
					UsuarioDTO usuario = usuarioDAO.buscarUsuarioId(idUsuario);
					
					chamadosHTML.append("<div class=row>");
					chamadosHTML.append("<div class='card-body'>");
			     	chamadosHTML.append("<div class='card mb-3 bg-light'>");
			        chamadosHTML.append("<div class='card-body'>");
			        chamadosHTML.append("<label class=font-weight-bold>Titulo</label>");
			        chamadosHTML.append("<p>" + lista.get(posicao).getTitulo() + "</p>");
			        chamadosHTML.append("<label class=font-weight-bold>Categoria</label>");
			        chamadosHTML.append("<p>" + lista.get(posicao).getCategoria() + "</p>");
			        chamadosHTML.append("<label class=font-weight-bold>Descricao</label>");
			        chamadosHTML.append("<p>" + lista.get(posicao).getDescricao() + "</p>");
			        //dados do usuario
			        chamadosHTML.append("<label class=font-weight-bold>ID Usuario: </label>");
					chamadosHTML.append(lista.get(posicao).getId_usuario() + " ");
					chamadosHTML.append("<label class=font-weight-bold> Nome: </label>");
					chamadosHTML.append(usuario.getNome() + " ");
					chamadosHTML.append("<label class=font-weight-bold> Email: </label>");
					chamadosHTML.append(usuario.getEmail() + " ");
			        
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
	                <a href="../home.jsp">
	                	<button class="btn btn-lg btn-warning btn-block" type="submit">Voltar</button>
	                </a>
	                </div>
	              </div>
	              
	            </div>
	          </div>
	        </div>
	      </div>
	   

	
	


</body>
</html>