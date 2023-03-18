package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import br.com.DAO.ConexaoDAO;
import br.com.DTO.ChamadoDTO;
import br.com.DTO.UsuarioDTO;
import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

public class UsuarioDAO {
		//conexao
		Connection con;
		//preparo de conexao
		PreparedStatement pstm;
		//variavel que armazena os valores do banco
		ResultSet rs;
		
		//lista que armazena todos usuarios
		ArrayList<UsuarioDTO> lista_usuario = new ArrayList<>();

		
		public Boolean login(UsuarioDTO usuarioDTO, HttpSession session) throws SQLException {
			String sql = "select * from usuario where email = ? and senha = ?";
			con = new ConexaoDAO().conexaoBD();
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, usuarioDTO.getEmail());
				pstm.setString(2, usuarioDTO.getSenha());
				
				//armazenando resultado
				rs = pstm.executeQuery();
				
				//atribuindo valores recuperados da consulta
				if(rs.next()) {
					// Cria uma nova instância do UsuarioDTO e preenche com os dados do ResultSet
					UsuarioDTO usuario = new UsuarioDTO();
		            usuario.setId(rs.getInt("id_usuario"));
		            usuario.setNome(rs.getString("nome"));
		            usuario.setEmail(rs.getString("email"));
		            usuario.setSenha(rs.getString("senha"));
		            usuario.setFuncao(rs.getString("funcao"));
		            
		            //Armazena o usuário na session
		            session.setAttribute("usuarioLogado", usuario);
		            //sessão expira em 30 minutos
		            session.setMaxInactiveInterval(1800); 
		            return true;
				}	
		        pstm.close();
			}
			
			catch(SQLException e) {
				e.getStackTrace();
			}
			
			return false;
			
		}
		
		public UsuarioDTO buscarUsuarioId(int id) throws SQLException {
			con = new ConexaoDAO().conexaoBD();
			
		    String sql = "SELECT * FROM usuario WHERE id_usuario = ?";
		    pstm = con.prepareStatement(sql);
		    pstm.setInt(1, id);
		    rs = pstm.executeQuery();

		    UsuarioDTO usuario = null;
		    if (rs.next()) {
		        usuario = new UsuarioDTO();
		        usuario.setFuncao(rs.getString("funcao"));
		        usuario.setNome(rs.getString("nome"));
		        usuario.setEmail(rs.getString("email"));
		        usuario.setId(rs.getInt("id_usuario"));
		    }

		    rs.close();
		    pstm.close();
		    return usuario;
		}
		
		
}
