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
                const warrantyImageInput = document.querySelector('input[name="warrantyImage"]');
                const imageUrl = warrantyImageInput.value;

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
                if (value === "" || isNaN(value) || parseInt(value) < 0) {
                    alert("Please enter a non-negative integer.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>Warranty Edit </h1>
        <p> Login user: ${sessionScope.salessession.username}</p>
        
        <% String error1 = (String) request.getAttribute("error"); %>
        <% if (error1 != null) {%>
        <h4 style="color: red; text-align: center"> <%= error1%> </h4>
        <% }%>
        
        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) {%>
        <h4 style="color: green; text-align: center"> <%= success%> </h4>
        <% }%>

        <form action="./WarrantyController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="number" name="id" value="${requestScope.warranty.id}" min="0" required></td>
                </tr>

                <tr><td>Name</td><td><input name="warrantyName" value="${requestScope.warranty.name}" required="Please enter" </td></tr>
                <tr><td>Image</td><td><input name="warrantyImage" value="${requestScope.warranty.image}" required="Please enter" </td></tr>
                <tr><td>Month</td><td><input name="warrantyMonth" value="${requestScope.warranty.month}" required="Please enter" </td></tr>
                <tr><td>Description</td><td><input name="warrantyDescription" value="${requestScope.warranty.description}" required="Please enter"</td></tr>
                <tr><td>Type</td><td><input name="warrantyType" value="${requestScope.warranty.type}" required="Please enter"</td></tr>
                <tr><td>Start Date</td><td><input name="startDate" value="${requestScope.warranty.startdate}" required="Please enter" </td></tr>
                <tr><td>Terms and Conditions</td><td><input name="termsAndConditions" value="${requestScope.warranty.termsandconditions}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>
