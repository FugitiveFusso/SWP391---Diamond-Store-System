package com.khac.swp.fuj.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;

@WebServlet("/vnpay_return")
public class VnpayReturnServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String vnp_HashSecret = "PYVH4JR5V8GQLIJQISKV6XRY3U0Q56E0";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Map<String, String> vnp_Params = new HashMap<>();
        request.getParameterMap().forEach((key, value) -> vnp_Params.put(key, value[0]));
        
        String vnp_SecureHash = vnp_Params.remove("vnp_SecureHash");
        String hashData = vnp_Params.entrySet().stream()
                .map(e -> e.getKey() + "=" + e.getValue())
                .reduce((a, b) -> a + "&" + b).orElse("");

        String calculatedHash = DigestUtils.sha256Hex(vnp_HashSecret + hashData);

        if (calculatedHash.equals(vnp_SecureHash)) {
            String vnp_ResponseCode = vnp_Params.get("vnp_ResponseCode");
            if ("00".equals(vnp_ResponseCode)) {
                response.getWriter().println("Payment success!");
            } else {
                response.getWriter().println("Payment failed: " + vnp_ResponseCode);
            }
        } else {
            response.getWriter().println("Invalid hash");
        }
    }
}
