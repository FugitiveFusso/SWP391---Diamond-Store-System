/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.controller;

import com.khac.swp.fuj.category.CategoryDAO;
import com.khac.swp.fuj.category.CategoryDTO;
import com.khac.swp.fuj.certificate.CertificateDAO;
import com.khac.swp.fuj.certificate.CertificateDTO;
import com.khac.swp.fuj.collection.CollectionDAO;
import com.khac.swp.fuj.collection.CollectionDTO;
import com.khac.swp.fuj.diamond.DiamondDAO;
import com.khac.swp.fuj.diamond.DiamondDTO;
import com.khac.swp.fuj.diamondprice.DiamondPriceDAO;
import com.khac.swp.fuj.diamondprice.DiamondPriceDTO;
import com.khac.swp.fuj.order.OrderDAO;
import com.khac.swp.fuj.order.OrderDTO;
import com.khac.swp.fuj.posts.PostDAO;
import com.khac.swp.fuj.posts.PostDTO;
import com.khac.swp.fuj.ring.RingDAO;
import com.khac.swp.fuj.ring.RingDTO;
import com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDAO;
import com.khac.swp.fuj.ringplacementprice.RingPlacementPriceDTO;
import com.khac.swp.fuj.users.UserDAO;
import com.khac.swp.fuj.users.UserDTO;
import com.khac.swp.fuj.voucher.VoucherDAO;
import com.khac.swp.fuj.voucher.VoucherDTO;
import com.khac.swp.fuj.warranty.WarrantyDAO;
import com.khac.swp.fuj.warranty.WarrantyDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phucu
 */
public class DashboardController extends HttpServlet {

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
            PostDAO postDAO = new PostDAO();
            UserDAO userDAO = new UserDAO();
            RingDAO ringDAO = new RingDAO();
            VoucherDAO voucherDAO = new VoucherDAO();
            CollectionDAO collectionDAO = new CollectionDAO();
            CategoryDAO categoryDAO = new CategoryDAO();
            CertificateDAO certificateDAO = new CertificateDAO();
            OrderDAO orderDAO = new OrderDAO();
            WarrantyDAO warrantyDAO = new WarrantyDAO();
            DiamondDAO diamondDAO = new DiamondDAO();
            String action = request.getParameter("action");
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            String sortCol = request.getParameter("colSort");
            if (sortCol == null) {
                sortCol = "";
            }
            String pageStr = request.getParameter("page");
            int page = 1;
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }
            int pageSize = 10; // Set the number of posts per page
            int pageSize_a = 5;

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("managersession") == null) {
                response.sendRedirect("managerlogin.jsp");
                return;
            } else if (action == null || action.equals("list")) {//lists
                //Users
                UserDAO userDao = new UserDAO();
                List<UserDTO> usList = userDao.listStatistics();
                request.setAttribute("uslist", usList);
                //Staffs
                List<UserDTO> usListStaff = userDao.listStaff();
                request.setAttribute("usliststaff", usListStaff);
                //Categories
                CategoryDAO categoyrDao = new CategoryDAO();
                List<CategoryDTO> caList = categoyrDao.listStatistics();
                request.setAttribute("calist", caList);
                //Collections
                CollectionDAO collectionDao = new CollectionDAO();
                List<CollectionDTO> coList = collectionDao.listStatistics();
                request.setAttribute("colist", coList);
                //Vouchers
                VoucherDAO voucherDao = new VoucherDAO();
                List<VoucherDTO> vouList = voucherDao.listStatistics();
                request.setAttribute("voulist", vouList);
                //Posts
                PostDAO postDao = new PostDAO();
                PostDTO post = postDao.loadStatistics();
                request.setAttribute("post", post);
                //Certificates
                CertificateDAO certificateDao = new CertificateDAO();
                List<CertificateDTO> certList = certificateDao.listStatistics();
                request.setAttribute("certlist", certList);
                //DiamondPrices
                DiamondPriceDAO diamondPriceDao = new DiamondPriceDAO();
                DiamondPriceDTO diamondPrice = diamondPriceDao.loadStatistics();
                request.setAttribute("diamondprice", diamondPrice);
                //Diamonds
                DiamondDAO diamondDao = new DiamondDAO();
                List<DiamondDTO> diaList = diamondDao.listStatistics();
                request.setAttribute("dialist", diaList);
                //RPPs1
                RingPlacementPriceDAO ringPlacementPriceDao = new RingPlacementPriceDAO();
                RingPlacementPriceDTO rppa = ringPlacementPriceDao.loadStatisticsA();
                request.setAttribute("rppa", rppa);
                //RPPs2
                List<RingPlacementPriceDTO> rppListA = ringPlacementPriceDao.getStatisticsA();
                request.setAttribute("rpplista", rppListA);
                //RPPs3
                List<RingPlacementPriceDTO> rppListB = ringPlacementPriceDao.getStatisticsB();
                request.setAttribute("rpplistb", rppListB);
                //Warranties
                WarrantyDAO warrantyDao = new WarrantyDAO();
                WarrantyDTO warranty = warrantyDao.loadStatistics();
                request.setAttribute("warranty", warranty);
                //Top5Highest
                RingDAO ringDao = new RingDAO();
                List<RingDTO> ringListHighest = ringDao.listHighest();
                request.setAttribute("ringlisthighest", ringListHighest);
                //Top5Lowest
                List<RingDTO> ringListLowest = ringDao.listLowest();
                request.setAttribute("ringlistlowest", ringListLowest);
                //TotalRings
                RingDTO ringTotal = ringDao.loadTotalRings();
                request.setAttribute("ringtotal", ringTotal);
                //Top5Sales
                List<RingDTO> ringListTopSales = ringDao.listTopSales();
                request.setAttribute("ringlisttopsales", ringListTopSales);
                //Number of Orders for Home Delivery/Store Pickup
                OrderDAO orderDao = new OrderDAO();
                List<OrderDTO> listA = orderDao.listStatisticA();
                request.setAttribute("lista", listA);
                //Number of orders in a week/month by order date
                List<OrderDTO> listB = orderDao.listStatisticB();
                request.setAttribute("listb", listB);
                List<OrderDTO> listC = orderDao.listStatisticC();
                request.setAttribute("listc", listC);
                //List of weekly transactions
                List<OrderDTO> listD = orderDao.listStatisticD();
                request.setAttribute("listd", listD);
                //Revenue for Week have change
                List<OrderDTO> listE = orderDao.listStatisticE();
                request.setAttribute("liste", listE);
                //Revenue for Month have change
                List<OrderDTO> listF = orderDao.listStatisticF();
                request.setAttribute("listf", listF);
                //Revenue for Week
                List<OrderDTO> listG = orderDao.listStatisticG();
                request.setAttribute("listg", listG);
                //Revenue for Month
                List<OrderDTO> listH = orderDao.listStatisticH();
                request.setAttribute("listh", listH);
                //Order Count for each method
                List<OrderDTO> listI = orderDao.listStatisticI();
                request.setAttribute("listi", listI);
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            } else if (action.equals("listofposts")) {//lists
                int totalPosts = postDAO.getTotalPosts(keyword);
                int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<PostDTO> list = postDAO.getAllPost(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("postlist", list);

                request.getRequestDispatcher("manager_postlist.jsp").forward(request, response);

            } else if (action.equals("listofwarranty")) {//lists

                int totalWarranties = warrantyDAO.getTotalWarranties(keyword);
                int totalPages = (int) Math.ceil((double) totalWarranties / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<WarrantyDTO> list = warrantyDAO.getAllWarranties(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("warrantylist", list);

                request.getRequestDispatcher("manager_warrantylist.jsp").forward(request, response);

            } else if (action.equals("listofcertificates")) {//lists
                int totalCertificates = certificateDAO.getTotalCertificates(keyword);
                int totalPages = (int) Math.ceil((double) totalCertificates / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<CertificateDTO> list = certificateDAO.listCertificates(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("certificatelist", list);
                request.setAttribute("certificatelist", list);

                request.getRequestDispatcher("manager_certificatelist.jsp").forward(request, response);

            } else if (action.equals("listofrings")) {//lists

                RingDAO dao = new RingDAO();
                int totalRings = ringDAO.getTotalRingCount(keyword);
                int totalPages = (int) Math.ceil((double) totalRings / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<RingDTO> list = ringDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("ringlist", list);

                request.getRequestDispatcher("manager_ringlist.jsp").forward(request, response);

            } else if (action.equals("listofdiamonds")) {//lists

                int totalDiamond = diamondDAO.getTotalDiamonds(keyword);
                int totalPages = (int) Math.ceil((double) totalDiamond / pageSize);

                // Ensure page is within valid range
                if (page < 1) {
                    page = 1;
                } else if (page > totalPages) {
                    page = totalPages;
                }

                List<DiamondDTO> list = diamondDAO.list(keyword, sortCol, page, pageSize);
                request.setAttribute("currentPage", page);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("pageSize", pageSize);
                request.setAttribute("sortCol", sortCol);
                request.setAttribute("keyword", keyword);
                request.setAttribute("diamondlist", list);

                request.getRequestDispatcher("manager_diamondlist.jsp").forward(request, response);

            } else if (action.equals("warrantydetails")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                WarrantyDTO warranty = null;
                if (id != null) {
                    warranty = warrantyDAO.load(id);
                }

                request.setAttribute("warranty", warranty);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_warrantydetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("diamonddetails")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                DiamondDTO diamond = null;
                if (id != null) {
                    diamond = diamondDAO.load(id);
                }

                request.setAttribute("diamond", diamond);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_diamonddetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("postdetails")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                PostDTO post = null;
                if (id != null) {
                    post = postDAO.load(id);
                }

                request.setAttribute("post", post);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_postdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("userdetails")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                UserDTO user = null;
                if (id != null) {
                    user = userDAO.load_Normal(id);
                }
                request.setAttribute("user", user);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_userdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("ringdetails")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                RingDTO ring = null;
                if (id != null) {
                    ring = ringDAO.load(id);
                }

                request.setAttribute("ring", ring);//object
                request.getRequestDispatcher("manager_ringdetails.jsp").forward(request, response);
            } else if (action.equals("voucherdetails")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                VoucherDTO voucher = null;
                if (id != null) {
                    voucher = voucherDAO.load(id);
                }

                request.setAttribute("voucher", voucher);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_voucherdetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("collectiondetails")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                RingDTO ring = null;
                CollectionDTO collection = null;
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    collection = collectionDAO.load(id);
                    int totalRCs = dao_1.getTotalRingCountByCollection(id);
                    int totalPages = (int) Math.ceil((double) totalRCs / pageSize_a);

                    // Ensure page is within valid range
                    if (page < 1) {
                        page = 1;
                    } else if (page > totalPages) {
                        page = totalPages;
                    }

                    List<RingDTO> ring_1 = dao_1.listByCollection(id, page, pageSize_a);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageSize", pageSize);
                    request.setAttribute("sortCol", sortCol);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("id", id);
                    request.setAttribute("ringclist", ring_1);
                }

                request.setAttribute("collection", collection);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_collectiondetails.jsp");
                rd.forward(request, response);
            } else if (action.equals("categorydetails")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CategoryDTO category = null;
                if (id != null) {
                    RingDAO dao_1 = new RingDAO();
                    int totalRCs = dao_1.getTotalRingCountByCategory(id);
                    int totalPages = (int) Math.ceil((double) totalRCs / pageSize_a);

                    // Ensure page is within valid range
                    if (page < 1) {
                        page = 1;
                    } else if (page > totalPages) {
                        page = totalPages;
                    }

                    List<RingDTO> ring_1 = dao_1.listByCategory(id, page, pageSize_a);
                    request.setAttribute("currentPage", page);
                    request.setAttribute("totalPages", totalPages);
                    request.setAttribute("pageSize", pageSize);
                    request.setAttribute("sortCol", sortCol);
                    request.setAttribute("keyword", keyword);
                    request.setAttribute("id", id);
                    request.setAttribute("ringclist", ring_1);
                    category = categoryDAO.load(id);
                }

                request.setAttribute("category", category);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_categorydetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("certificatedetails")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                CertificateDTO certificate = null;
                if (id != null) {
                    certificate = certificateDAO.load(id);
                }

                request.setAttribute("certificate", certificate);//object
                RequestDispatcher rd = request.getRequestDispatcher("manager_certificatedetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("orderdetails")) {
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                OrderDTO saleshistory = null;
                if (id != null) {
                    saleshistory = orderDAO.loadBillDetail(id);
                }

                request.setAttribute("salesorder", saleshistory);//object
                request.getRequestDispatcher("/manager_orderdetails.jsp").forward(request, response);
            }

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
