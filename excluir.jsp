<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            //recebe o codigo digitado no formulario
            int cod;
            cod=Integer.parseInt(request.getParameter("id_jogos"));
            try{
                //conecta ao banco de dados chamado bancojsp_a
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url="jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
                String user="root";
                String password="root";
                conecta=DriverManager.getConnection(url,user,password);
                //excluindo o produto de codigo informado   
                String sql=("DELETE FROM jogos WHERE id_jogos=?");
                st=conecta.prepareStatement(sql);
                st.setInt(1,cod);
                int resultado = st.executeUpdate();//executa o DELETE
                if (resultado == 0){
                out.print("Este Jogo não está cadastrado");
            }else{
            %>
            <p>O Jogo foi excluído com sucesso</P>
                <%
            }
            } catch (Exception erro) {
                 String mensagemErro = erro.getMessage();
                 out.print ("<p style='color:blue;font-size:25px'>Entre em contato com o suporte '+ mensagemErro </p>");
            }
            %>
    </body>
</html>