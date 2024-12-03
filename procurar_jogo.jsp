<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciador de jogos</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/tabela.css"/>
    </head>
    <body>

        <%
            String n;
            n=request.getParameter("nm_jogos");
            try{
            //fazer a conecxão com o banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
            String user="root";
            String password ="root";
            conecta = DriverManager.getConnection(url,user,password);
            //listando os dados da tabela produtos do banco
            String sql=("SELECT * FROM jogos WHERE nm_jogos LIKE ?");
            st=conecta.prepareStatement(sql);
            //ResultSet serve para gardar aquilo que é trazido do banco
            st.setString(1,"%"+ n +"%");
            //enquanto não chegar no final do arquivo, ele vai execultar o que estiver dentro do while vamos montar uma tabela html, criando o titulo da tabela e encerrando o codigo java
            ResultSet rs= st.executeQuery();
            
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
                    while (rs.next ()){

                %>
                <!--  
                finalizei o codigo java acima. Agora vamos criar uma tabela html para mostrar os dados trazidos do banco
                -->
                <tr>
                    <td>
                        <%= rs.getInt("id_jogos")%>
                    </td>
                    <td>
                        <%= rs.getString("nm_jogos")%>
                    </td>
                    <td>
                        <%= rs.getString("nm_jogos")%>
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
                }catch(Exception x){
                    out.print("Mensagem de erro: "+ x.getMessage());
                }
            %>

    </body>
</html>
