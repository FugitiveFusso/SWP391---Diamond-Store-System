<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Voucher Management Page </title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        

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

        <div class="title">
            <h1>Voucher Edit</h1>
            <p> Login user: ${sessionScope.salessession.username}</p>
        </div>

        <% String error1 = (String) request.getAttribute("error"); %>
        <% if (error1 != null) {%>
        <h4 style="color: red; text-align: center"> <%= error1%> </h4>
        <% }%>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) {%>
        <h4 style="color: green; text-align: center"> <%= success%> </h4>
        <% }%>

        <div class="container content">
            <form action="./VoucherController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Voucher ID</h2>
                            <input type="number" name="id" value="${requestScope.voucher.id}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Voucher Image</h2>
                            <input name="voucherImage" value="${requestScope.voucher.image}" required="Please enter" class="form-control">
                        </div> 
                        <div class="info-input">                          
                            <h2>Voucher Coupon</h2>
                            <input name="coupon" value="${requestScope.voucher.coupon}" required="Please enter" class="form-control">                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Voucher Name</h2>
                            <input name="voucherName" value="${requestScope.voucher.name}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Voucher Description</h2>
                            <input name="description" value="${requestScope.voucher.description}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Voucher Percentage</h2>
                            <input name="percentage" value="${requestScope.voucher.percentage}" required="Please enter" class="form-control">                           
                        </div>

                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-4">
                        <div class="button text-center">
                            <input name="action" value="${requestScope.nextaction}" type="hidden">
                            <input type="submit" value="Save" class="btn btn-primary">
                        </div>
                    </div>

            </form>

            <div class="col-md-4">
                <div class="button text-center">
                    <form action="VoucherController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
                </div>
            </div>
        </div>

    </div>

<!--    <form action="./VoucherController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
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

    </form>-->
<!--    <form action="VoucherController" style="padding-top: 10px">
        <input type=hidden name="action" value="list">
        <input type=submit value="Return" ></form>-->
</body>
</html>