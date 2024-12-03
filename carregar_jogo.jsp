<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            //recebe o codigo do produto e alterar e armazena
            //na variavel "c" abaixo
            
            int c;
            c = Integer.parseInt(request.getParameter("id_jogos"));
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
                String user="root";
                String password="root";
                conecta=DriverManager.getConnection(url,user,password);
            
                String sql="SELECT * FROM jogos WHERE  id_jogos=?";
                st = conecta.prepareStatement(sql);
                //result set serve para trazer aquilo trazido do BD
               st.setInt(1, c);
               //st.executeQuer(); execute o select
               ResultSet resultado = st.executeQuery();
               if(!resultado.next()){
               //verifica se o produto de codigo informado
               //foi encontrado
               out.print("Este produto não foi encontrado");
            } else{ //se econtrou produto na tabela, vamos carregar estes dados dentro de um formulario
            
            }
            
            %>
            <form action="alterar_jogo.jsp" method="post" >
                <nav class="div_alterar_dois">
                    <h3>Alterar jogo</h3>
                    <p>
                        <label for="id_jogos">id:</label>
                        <input id="id_jogos" type="number" name="id_jogos" value="<%= resultado.getString("id_jogos")%>" readonly>
                        <!-- randoly: propriedade somente de leitura, não permite alterar o valor do campo, pois é chave pk-->
                    </p>
                    <p>
                        <label for="nm_jogos">Nome:</label>
                        <input id="nm_jogos" type="text" name="nm_jogos" value="<%=resultado.getString("nm_jogos")%>">
                    </p>

                    <p>
                        <label for="nm_empresas">Empresa:</label>
                        <input id="nm_empresas" type="text" name="nm_empresas" value="<%=resultado.getString("nm_empresas")%>">
                    </p>

                     <p>
                        <label for="lancamentos">Lançamentos:</label>
                        <input id="lancamentos" type="text" name="lancamentos" value="<%=resultado.getString("lancamentos")%>">
                    </p>

                    <p>
                        <input type="submit" value="Salvar" id="salvar">
                    </p>
                </nav>
            </form>
            <%
                
            %>
    </body>
</html>
