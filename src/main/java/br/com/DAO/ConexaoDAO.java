package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//classe que faz a conexao com o banco
public class ConexaoDAO {
	
	public Connection conexaoBD() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sistemahelpdesk?user=root&password=";
			con = DriverManager.getConnection(url);
			
		}catch(SQLException e) {
			e.getMessage();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return con;
	}
}
