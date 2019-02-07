/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unitn.aa1718.webprogramming.servlets;

import it.unitn.aa1718.webprogramming.connection.DAOFactory;
import it.unitn.aa1718.webprogramming.connection.MySQLDAOFactory;
import it.unitn.aa1718.webprogramming.dao.MyCookieDAO;
import it.unitn.aa1718.webprogramming.dao.entities.MySQLMyCookieDAOImpl;
import it.unitn.aa1718.webprogramming.extra.Library;
import it.unitn.aa1718.webprogramming.friday.MyCookie;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author leo97
 */
public class indexServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet indexServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet indexServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            
            (request.getSession()).setAttribute("emailSession", null);
            (request.getSession()).setAttribute("cookieIDSession", null);
            (request.getSession()).setAttribute("nameUserSession", null);

            String DBUrl = MySQLDAOFactory.getDBUrl();
            String DBUser = MySQLDAOFactory.getDBUser();
            String DBPass = MySQLDAOFactory.getDBPass();
            String DBDriver = MySQLDAOFactory.getDBDriver();

            (request.getSession()).setAttribute("DBUrlSession", DBUrl);
            (request.getSession()).setAttribute("DBUserSession", DBUser);
            (request.getSession()).setAttribute("DBPassSession", DBPass);
            (request.getSession()).setAttribute("DBDriverSession", DBDriver);

            Cookie[] cookies = request.getCookies();
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet result = null;
            boolean boolEmailSession = false;

            try {
                connection = MySQLDAOFactory.createConnection();
                preparedStatement = connection.prepareStatement("SELECT * FROM cookies;");
                preparedStatement.execute();
                result = preparedStatement.getResultSet();

                if(cookies != null){

                    while (result.next()) {

                        for(int i=0; i<cookies.length; i++){

                            System.out.println("browser cookie = "+cookies[i].getValue()+"  db cookie = "+result.getString("cookieID"));
                            if((cookies[i].getValue()).equals(result.getString("cookieID"))){

                                String emailSession = result.getString("Email");
                                (request.getSession()).setAttribute("emailSession", emailSession);
                                (request.getSession()).setAttribute("cookieIDSession", result.getString("cookieID"));
                                (request.getSession()).setAttribute("deadlineSession", result.getString("Deadline"));
                                (request.getSession()).setAttribute("LIDSession", result.getString("LID"));
                                System.out.println("zao sono dentro l'if e usersession = "+(String)(request.getSession()).getAttribute("emailSession")+" cookieID = "+(String)(request.getSession()).getAttribute("cookieIDSession"));

                                if (emailSession.equals(null)){
                                    boolEmailSession = false;
                                } else {
                                    boolEmailSession = true;
                                }

                                (request.getSession()).setAttribute("boolEmailSessionScriptlet", boolEmailSession);

                            }
                        }
                    }

                    preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE Email = ?;");
                    preparedStatement.setString(1, (String)(request.getSession()).getAttribute("emailSession"));
                    preparedStatement.execute();
                    result = preparedStatement.getResultSet();

                    while (result.next()) {
                        (request.getSession()).setAttribute("nameUserSession", result.getString("Name"));
                        (request.getSession()).setAttribute("surnameUserSession", result.getString("Surname"));
                        (request.getSession()).setAttribute("avatarUserSession", result.getString("Avatar"));
                        (request.getSession()).setAttribute("adminUserSession", result.getBoolean("Admin"));
                        (request.getSession()).setAttribute("list_OwnerUserSession", result.getBoolean("List_Owner"));
                        (request.getSession()).setAttribute("confirmedUserSession", result.getBoolean("Confirmed"));
                    }
                    
                    preparedStatement = connection.prepareStatement("SELECT * FROM products order by RAND() LIMIT 5;");
                    preparedStatement.execute();
                    result = preparedStatement.getResultSet();
                    
                    result.last();
                    
                    String [][] prodottiRand = new String [result.getRow()][6];
                    
                    result.beforeFirst();
                    
                    int i = 0;
                    
                    while (result.next()) {
                        prodottiRand [i][0] = result.getString("PID");
                        prodottiRand [i][1] = result.getString("Name");
                        prodottiRand [i][2] = result.getString("Note");
                        prodottiRand [i][3] = result.getString("Logo");
                        prodottiRand [i][4] = result.getString("Photo");
                        prodottiRand [i][5] = result.getString("PCID");
                        
                        i++;
                    }
                    
                    (request.getSession()).setAttribute("prodottiRand", prodottiRand);
                    

                }

            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    result.close();
                } catch (Exception rse) {
                    rse.printStackTrace();
                }
                try {
                    preparedStatement.close();
                } catch (Exception sse) {
                    sse.printStackTrace();
                }
                try {
                    connection.close();
                } catch (Exception cse) {
                    cse.printStackTrace();
                }
            }
        
        response.sendRedirect("index.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}