package br.com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.protocol.Resultset;

import br.com.DTO.ChamadoDTO;

public class ChamadoDAO {
	//conexao
	Connection con;
	//preparo de conexao
	PreparedStatement pstm;
	//variavel que armazena os valores do banco
	ResultSet rs;
	//lista que vai armazenar todas as linhas da tabela de chamado
	ArrayList<ChamadoDTO> lista_chamado = new ArrayList<>();
	
	
	//recebe o chamadoDTO para acessar os atributos do objeto
	public void CriarChamado(ChamadoDTO objChamadoDTO) throws ClassNotFoundException {
		//comando sql
		String sql = "INSERT INTO chamado(titulo_chamado, categoria_chamado, descricao) VALUES(?,?,?)";
		//faz a conexao
		con = new ConexaoDAO().conexaoBD();
		
		try {
			//recebe a conexao preparada com o comando sql
			pstm = con.prepareStatement(sql);
			//setando valores para o comando sql
			pstm.setString(1, objChamadoDTO.getTitulo());
			pstm.setString(2, objChamadoDTO.getCategoria());
			pstm.setString(3, objChamadoDTO.getDescricao());

			//executa o comando sql com o pstm
			pstm.execute();
			//fecha o pstm
			pstm.close();
			
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
	}
	
	public ArrayList<ChamadoDTO> pesquisarChamado(){
		String sql = "select * from chamado";
		con = new ConexaoDAO().conexaoBD();
		
		try {
			//recebe a conexao preparada com o comando sql
			pstm = con.prepareStatement(sql);
			//armazendo resultado da consulta sql na variavel do tipo ResultSet
			rs = pstm.executeQuery(sql);
			
			//enquanto rs tiver proximo valor(linha)
			while(rs.next()) {
				//instanciando classe chamado dto
				ChamadoDTO objChamadoDTO = new ChamadoDTO();
				//setando valores do BD(ResultSet) para o objeto (usar os nomes dos campos no bd)
				objChamadoDTO.setId_chamado(rs.getInt("id_chamado"));
				objChamadoDTO.setTitulo(rs.getString("titulo_chamado"));
				objChamadoDTO.setCategoria(rs.getString("categoria_chamado"));
				objChamadoDTO.setDescricao(rs.getString("descricao"));
				
				//ao final do bloco adiciono os valores do objeto para uma lista com todos os chamados
				lista_chamado.add(objChamadoDTO);
			}
			
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
		//retorna a lista com todos os chamados
		return lista_chamado;
		
	}
	
	
	
	//recebe o chamadoDTO para acessar os atributos do objeto
	public void excluirChamado(ChamadoDTO objChamadoDTO) throws ClassNotFoundException {
		//comando sql para deletar
		String sql = "delete from chamado where id_chamado = ?";
		//faz a conexao
		con = new ConexaoDAO().conexaoBD();
		
		try {
			//recebe a conexao preparada com o comando sql
			pstm = con.prepareStatement(sql);
			//setando id ? recuperando id do objetoDTO
			pstm.setInt(1, objChamadoDTO.getId_chamado());
			//executa o comando sql com o pstm
			pstm.execute();
			//fecha o pstm
			pstm.close();
			
		}
		catch(SQLException e) {
			e.getStackTrace();
		}
	}
	
	
	
	public ChamadoDTO buscarChamadoPorId(int id) throws SQLException {
		con = new ConexaoDAO().conexaoBD();
		
	    String sql = "SELECT * FROM chamado WHERE id_chamado = ?";
	    pstm = con.prepareStatement(sql);
	    pstm.setInt(1, id);
	    rs = pstm.executeQuery();

	    ChamadoDTO chamado = null;
	    if (rs.next()) {
	        chamado = new ChamadoDTO();
	        chamado.setId_chamado(rs.getInt("id_chamado"));
	        chamado.setTitulo(rs.getString("titulo_chamado"));
	        chamado.setCategoria(rs.getString("categoria_chamado"));
	        chamado.setDescricao(rs.getString("descricao"));
	    }

	    rs.close();
	    pstm.close();
	    return chamado;
	}
	
	public void editarChamado(ChamadoDTO objChamadoDTO) {
		
				//comando sql para alterar dados onde id tem que ser igual id recuperado do objeto
				String sql = "update chamado set titulo_chamado = ?, categoria_chamado = ?, descricao = ? where id_chamado = ?";
				
				//faz a conexao
				con = new ConexaoDAO().conexaoBD();
				
				try {
					//recebe a conexao preparada com o comando sql
					pstm = con.prepareStatement(sql);
					
					//setando id ? recuperando id do objetoDTO
					pstm.setString(1, objChamadoDTO.getTitulo());
					pstm.setString(2, objChamadoDTO.getCategoria());
					pstm.setString(3, objChamadoDTO.getDescricao().trim());
					pstm.setInt(4, objChamadoDTO.getId_chamado());

					
					
					//executa o comando sql com o pstm
					pstm.executeUpdate();
					
					System.out.print(pstm);

					//fecha o pstm
					pstm.close();
					
				}
				catch(SQLException e) {
					e.getStackTrace();
				}
			}
	
	
		
	}
	

	
	
	
	
	
	

