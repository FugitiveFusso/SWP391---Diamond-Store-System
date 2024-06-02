
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function validateForm() {
                const postImageInput = document.querySelector('input[name="certificateImage"]');
                const imageUrl = postImageInput.value;

                if (!isValidImageUrlFormat(imageUrl)) {
                    alert('Invalid image URL. It must start with "https://" and end with one of the following extensions: .jpg, .jpeg, .png, .gif, .bmp, .webp.');
                    return false;
                }
                return true;
            }
        </script>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Certificate Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./CertificateController" method="POST" onclick="return validateForm()">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.certificate.certificateID}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Certificate Image</td><td><input name="certificateImage" value="${requestScope.certificate.certificateImage}" required="Please enter"</td></tr>
                <tr><td>Description</td><td><input name="description" value="${requestScope.certificate.certificateDescription}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>
