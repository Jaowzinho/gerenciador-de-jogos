<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar</title>
    </head>
    <body>
        <%
            int id_jogos;
            String nm_jogos,nm_empresas,lancamentos;
            id_jogos=Integer.parseInt(request.getParameter("id_jogos"));
            nm_jogos=request.getParameter("nm_jogos");
            nm_empresas=request.getParameter("nm_empresas");
            lancamentos=request.getParameter("lancamentos");
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/gerenciador_jogos";
            String user="root";
            String password="root";
            conecta=DriverManager.getConnection(url,user,password);
            String sql=("UPDATE jogos SET nm_jogos=?, nm_empresas=?, lancamentos=? WHERE id_jogos=?");
            st= conecta.prepareStatement(sql);
            st.setString(1,nm_jogos);
            st.setString(2,nm_empresas);
            st.setString(3,lancamentos);
            st.setInt(4,id_jogos);
            st.executeUpdate();
            out.print("Os dados do "+ nm_jogos +" foram alterados");
        %>
    </body>
</html>
