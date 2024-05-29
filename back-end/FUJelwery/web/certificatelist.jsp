<%-- 
    Document   : certificatelist
    Created on : May 29, 2024, 5:45:13 PM
    Author     : Dell
--%>

<%@page import="com.khac.swp.fuj.certificate.CertificateDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="/menu.jsp" %>
        <form action='' method=GET id="searchbox"> 
            <input name=keyword type=text value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>">
            <input type=submit value=Search >
        </form>
        <style>
            #searchbox{
                margin-top: 5px;
            }
            body{
                font-size: 16px;
                font-family: Arial, Helvetica, sans-serif;
            }
            table{
                margin-top: 10px;
                    width: 100%;
            }
            table, tr, td{
                border-collapse: collapse;
                border: 1px solid black;
                text-align: center;
            }
            tr,td{
                padding: 6px 10px;
            }
        </style>
        <table>
            <tr>
                <td>Certificate ID</td>
                <td>Image</td>
                <td>Description</td>
            </tr>
            <%
                List<CertificateDTO> list = (List<CertificateDTO>) request.getAttribute("certificatelist");
                for (CertificateDTO certificate : list) {
                    pageContext.setAttribute("certificate", certificate);
            %>
            <tr>
                <td>
                    <a href="CertificateController?action=details&id=${certificate.certificateID}">   ${certificate.certificateID}</td>
                <td><img src=${certificate.certificateImage} width="300px" height="300px"></td>
                <td>${certificate.certificateDescription}</td>
                <td>
                    <form action="CertificateController" method="POST">
                        <input name="action" value="delete" type="hidden">
                        <input name="id" value="${certificate.certificateID}" type="hidden">
                        <input type="submit" value="Delete">
                    </form>
                </td>

            </tr>
            <%
                }
            %>    
            <tr><td colspan="10">
                    <form action="CertificateController" method="POST">
                        <input name="action" value="create" type="hidden">
                        <input type="submit" value="Create">
                    </form>
                </td></tr>
        </table>
    </body>
</html>
