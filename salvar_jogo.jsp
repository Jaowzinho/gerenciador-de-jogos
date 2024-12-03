<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            String nm_jogos;
            String nm_empresas;
            String lancamentos;

            nm_jogos = request.getParameter("nm_jogos");
            nm_empresas = request.getParameter("nm_empresas");
            lancamentos = request.getParameter("lancamentos");

            // Fazendo a conexão com o BD
            try {
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
                String user = "root";
                String password = "root";
                conecta = DriverManager.getConnection(url, user, password);

                // Inserindo dados na tabela jogo do BD
                String sql = "INSERT INTO jogos  (nm_jogos, nm_empresas, lancamentos) VALUES (?, ?, ?)";
                st = conecta.prepareStatement(sql);
                st.setString(1, nm_jogos);
                st.setString(2, nm_empresas);
                st.setString(3, lancamentos);
                st.executeUpdate(); // Executa o comando INSERT
                out.print("<p style='color:blue;font-size:25px'>Jogo cadastrado com sucesso..</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:blue;font-size:25px'>Este jogo já está cadastrado</p>");
                } else {
                    out.print("<p style='color:red;font-size:25px'>Mensagem de erro: " + erro + "</p>");
                }
            }
        %>
    </body>
</html>
