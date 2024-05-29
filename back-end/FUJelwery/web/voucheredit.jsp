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
    </head>
    <body>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Voucher Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./VoucherController" method="POST" onsubmit="return validateForm()">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.voucher.id}" required="Please enter" type="hidden"</td></tr>
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
    </body>
</html>
