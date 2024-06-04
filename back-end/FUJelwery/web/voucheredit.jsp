<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function validateForm() {
                const voucherImageInput = document.querySelector('input[name="voucherImage"]');
                const imageUrl = voucherImageInput.value;

                if (!isValidImageUrlFormat(imageUrl)) {
                    alert('Invalid image URL. It must start with "https://" and end with one of the following extensions: .jpg, .jpeg, .png, .gif, .bmp, .webp.');
                    return false;
                }
                return true;
            }
        </script>
        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('id')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>Voucher Edit </h1>
        <p> Login user: ${sessionScope.salessession.username}</p>

        <% String error1 = (String) request.getAttribute("error"); %>
        <% if (error1 != null) {%>
        <h4 style="color: red; text-align: center"> <%= error1%> </h4>
        <% }%>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) {%>
        <h4 style="color: green; text-align: center"> <%= success%> </h4>
        <% }%>



        <form action="./VoucherController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="number" name="id" value="${requestScope.voucher.id}" min="1" required></td>
                </tr>
                <tr><td>Voucher Name</td><td><input name="voucherName" value="${requestScope.voucher.name}" required="Please enter" </td></tr>
                <tr><td>Voucher Image</td><td><input name="voucherImage" value="${requestScope.voucher.image}" required="Please enter" </td></tr>
                <tr><td>Description</td><td><input name="description" value="${requestScope.voucher.description}" required="Please enter"</td></tr>
                <tr><td>Coupon</td><td><input name="coupon" value="${requestScope.voucher.coupon}" required="Please enter" </td></tr>
                <tr><td>Percentage</td><td><input name="percentage" value="${requestScope.voucher.percentage}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
        <form action="VoucherController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>
    </body>
</html>