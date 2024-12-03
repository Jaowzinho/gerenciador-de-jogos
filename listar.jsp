<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            try {
            // Fazer a conexao com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
            String user="root";
            String password="root";
            conecta=DriverManager.getConnection(url,user,password);
            // Lista os dados  da tabela produto do banco de dados
            String sql=("SELECT * FROM jogos ORDER BY id_jogos");
            st=conecta.prepareStatement(sql);
            // ResultSet serve para guardar aquilo que é traido do BD
            ResultSet rs=st.executeQuery();
            // Enquanto não chegar no final, ele vai executar
            // o que estiver dentro do while
            // vamos montar uma tabela html
            // criando o titulo da tabela 
            // encerrar o código Java            
        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Empresa</th>
                <th>Lançamento</th>
                <th>Excluir</th>
                <th>Alterar</th>

            </tr>
            <%
                while (rs.next()){                               
            %>
                <!--<!-- Finalizei o codigo java acima e agora vou 
                criar uma tabela html para mostrar os dados trazidos
                do BD-->
            <tr>
                <td>
                    <%= rs.getString("id_jogos")%>
                </td>
                <td>
                    <%= rs.getString("nm_jogos")%>
                </td>
                <td>
                    <%= rs.getString("nm_empresas")%>
                </td>
                <td>
                    <%= rs.getString("lancamentos")%>
                </td>
                <td>
                    <a href="excluir.jsp?id_jogos=<%=rs.getString("id_jogos")%>">Excluir</a>
                </td>
                <td>
                    <a href="carregar_jogo.jsp?id_jogos=<%=rs.getString("id_jogos")%>">Alterar</a>
                </td>

            </tr>
            <%
                }
                %>
        </table>
        <% 
            } catch (Exception x) {
                out.print ("Mensagem de erro: " + x.getMessage());
            }
        %>
        
    </body>
</html>