package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.BeanCursoJsp;
import connection.SingleConnection;

/*
 * Classe DaoUsuario
 * Classe Que Provê os Métodos e Validações Para Manipular Dados, e Acesso e Manipulação do BD
 */
public class DaoUsuario {

    private Connection connection;

    /*
     * Construtor DaoUsuario() Recebe um Objeto connection da Classe SingleConnection
     */
    public DaoUsuario() {
        connection = SingleConnection.getConnection();
    }

    /*
     * Método salvar() Responsável Por Fazer a Inserção de Dados (INSERT) no BD
     * 
     * @param BeanCursoJsp usuario = Objeto Usuário da Classe BeanCursoJsp
     */
    public void salvar(BeanCursoJsp usuario) {
        try {
            String sql =
                    "INSERT INTO usuario(login, senha, nome, telefone, cep, rua, bairro, cidade, estado, ibge, fotobase64, contenttype, curriculobase64, contenttypecurriculo, fotobase64miniatura) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement insert = connection.prepareStatement(sql);
            insert.setString(1, usuario.getLogin());
            insert.setString(2, usuario.getSenha());
            insert.setString(3, usuario.getNome());
            insert.setString(4, usuario.getTelefone());
            insert.setString(5, usuario.getCep());
            insert.setString(6, usuario.getRua());
            insert.setString(7, usuario.getBairro());
            insert.setString(8, usuario.getCidade());
            insert.setString(9, usuario.getEstado());
            insert.setString(10, usuario.getIbge());
            insert.setString(11, usuario.getFotoBase64());
            insert.setString(12, usuario.getContentType());
            insert.setString(13, usuario.getCurriculoBase64());
            insert.setString(14, usuario.getContentTypeCurriculo());
            insert.setString(15, usuario.getFotoBase64Miniatura());
            insert.execute();
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }

    /*
     * Método listar() Responsável Por Listar Todos os Usuários do Sistema
     */
    public List<BeanCursoJsp> listar() throws Exception {
        List<BeanCursoJsp> listar = new ArrayList<BeanCursoJsp>();
        String sql = "SELECT * FROM usuario where login <> 'admin'";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
            beanCursoJsp.setId(resultSet.getLong("id"));
            beanCursoJsp.setLogin(resultSet.getString("login"));
            beanCursoJsp.setSenha(resultSet.getString("senha"));
            beanCursoJsp.setNome(resultSet.getString("nome"));
            beanCursoJsp.setTelefone(resultSet.getString("telefone"));
            beanCursoJsp.setCep(resultSet.getString("cep"));
            beanCursoJsp.setRua(resultSet.getString("rua"));
            beanCursoJsp.setBairro(resultSet.getString("bairro"));
            beanCursoJsp.setCidade(resultSet.getString("cidade"));
            beanCursoJsp.setEstado(resultSet.getString("estado"));
            beanCursoJsp.setIbge(resultSet.getString("ibge"));
            beanCursoJsp.setContentType(resultSet.getString("contenttype"));
            // beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
            beanCursoJsp.setFotoBase64Miniatura(resultSet.getString("fotobase64miniatura"));
            beanCursoJsp.setCurriculoBase64(resultSet.getString("curriculobase64"));
            beanCursoJsp.setContentTypeCurriculo(resultSet.getString("contenttypecurriculo"));
            listar.add(beanCursoJsp);
        }
        return listar;
    }

    /*
     * Método delete() Responsável Por Fazer a Exclusão (Delete) no BD
     * 
     * @param String id = Atributo ID do Usuário
     */
    public void delete(String id) {
        if (id != null && !id.isEmpty()) {
            try {
                String sql = "DELETE FROM usuario WHERE id = '" + id + "' and login <> 'admin'";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.execute();
                connection.commit();
            } catch (SQLException e) {
                e.printStackTrace();
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    /*
     * Método consultar() Responsável Por Fazer Consultas (SELECT) no BD
     * 
     * @param String id = Atributo ID do Usuário
     */
    public BeanCursoJsp consultar(String id) throws Exception {
        String sql = "SELECT * FROM usuario WHERE id = '" + id + "' and login <> 'admin'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            BeanCursoJsp beanCursoJsp = new BeanCursoJsp();
            beanCursoJsp.setId(resultSet.getLong("id"));
            beanCursoJsp.setLogin(resultSet.getString("login"));
            beanCursoJsp.setSenha(resultSet.getString("senha"));
            beanCursoJsp.setNome(resultSet.getString("nome"));
            beanCursoJsp.setTelefone(resultSet.getString("telefone"));
            beanCursoJsp.setCep(resultSet.getString("cep"));
            beanCursoJsp.setRua(resultSet.getString("rua"));
            beanCursoJsp.setBairro(resultSet.getString("bairro"));
            beanCursoJsp.setCidade(resultSet.getString("cidade"));
            beanCursoJsp.setEstado(resultSet.getString("estado"));
            beanCursoJsp.setIbge(resultSet.getString("ibge"));
            beanCursoJsp.setFotoBase64(resultSet.getString("fotobase64"));
            beanCursoJsp.setFotoBase64Miniatura(resultSet.getString("fotobase64miniatura"));
            beanCursoJsp.setContentType(resultSet.getString("contenttype"));
            beanCursoJsp.setCurriculoBase64(resultSet.getString("curriculobase64"));
            beanCursoJsp.setContentTypeCurriculo(resultSet.getString("contenttypecurriculo"));
            return beanCursoJsp;
        }
        return null; /* fotobase64, contenttype */
    }

    /*
     * Método validarLogin Responsável Por Validar Login(Não Pode Existir 1 Mesmo Login Para 2 Usuários Diferentes)
     * 
     * @param String login = Atributo Login do Usuário
     */
    public boolean validarLogin(String login) throws Exception {
        String sql = "SELECT COUNT(1) as qtde FROM usuario WHERE login = '" + login + "'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt("qtde") <= 0;
        }
        return false;
    }

    public boolean validarLoginUpdate(String login, String id) throws Exception {
        String sql = "SELECT COUNT(1) as qtde FROM usuario WHERE login = '" + login + "' and id <> " + id;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt("qtde") <= 0;
        }
        return false;
    }

    /*
     * Método validarSenha Responsável Por Validar Senha(Não Pode Existir 1 Mesma Senha Para 2 Usuários Diferentes)
     * 
     * @param String senha = Atributo Senha do Usuário
     */
    public boolean validarSenha(String senha) throws Exception {
        String sql = "SELECT COUNT(1) as qtde FROM usuario WHERE senha = '" + senha + "'";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            return resultSet.getInt("qtde") <= 0;
        }
        return false;
    }

    /*
     * Método atualizar() Método Responsável Por Atualizar os Dados (UPDATE) no BD
     * 
     * @param BeanCursoJsp usuario = Objeto usuario da Classe BeanCursoJsp
     */
    public void atualizar(BeanCursoJsp usuario) {
        try {
            StringBuilder sql = new StringBuilder();

            sql.append(" UPDATE usuario SET login = ?, senha = ?, nome = ?, telefone = ");
            sql.append(" ?, cep = ?, rua = ?, bairro = ?, cidade = ?, ");
            sql.append(" estado = ?, ibge = ?");

            if (usuario.isAtualizarImage()) {
                sql.append(", fotobase64 =?, contenttype = ? ");
            }

            if (usuario.isAtualizarPdf()) {
                sql.append(", curriculobase64 = ?, contenttypecurriculo = ? ");
            }

            if (usuario.isAtualizarImage()) {
                sql.append(", fotobase64miniatura = ? ");
            }

            sql.append(" WHERE id = " + usuario.getId());

            // fotobase64, contenttype, curriculobase64, contenttypecurriculo
            PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());
            preparedStatement.setString(1, usuario.getLogin());
            preparedStatement.setString(2, usuario.getSenha());
            preparedStatement.setString(3, usuario.getNome());
            preparedStatement.setString(4, usuario.getTelefone());
            preparedStatement.setString(5, usuario.getCep());
            preparedStatement.setString(6, usuario.getRua());
            preparedStatement.setString(7, usuario.getBairro());
            preparedStatement.setString(8, usuario.getCidade());
            preparedStatement.setString(9, usuario.getEstado());
            preparedStatement.setString(10, usuario.getIbge());

            if (usuario.isAtualizarImage()) {
                preparedStatement.setString(11, usuario.getFotoBase64());
                preparedStatement.setString(12, usuario.getContentType());
            }

            if (usuario.isAtualizarPdf()) {

                if (usuario.isAtualizarPdf() && !usuario.isAtualizarImage()) {
                    preparedStatement.setString(11, usuario.getCurriculoBase64());
                    preparedStatement.setString(12, usuario.getContentTypeCurriculo());
                } else {
                    preparedStatement.setString(13, usuario.getCurriculoBase64());
                    preparedStatement.setString(14, usuario.getContentTypeCurriculo());
                }

            } else {
                if (usuario.isAtualizarImage()) {
                    preparedStatement.setString(13, usuario.getFotoBase64Miniatura());
                }
            }

            if (usuario.isAtualizarImage() && usuario.isAtualizarPdf()) {
                preparedStatement.setString(15, usuario.getFotoBase64Miniatura());
            }

            preparedStatement.executeUpdate();
            connection.commit();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }
}
