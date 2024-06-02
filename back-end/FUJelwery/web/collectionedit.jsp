
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
                const postImageInput = document.querySelector('input[name="collectionImage"]');
                const imageUrl = postImageInput.value;

                if (!isValidImageUrlFormat(imageUrl)) {
                    alert('Invalid image URL. It must start with "https://" and end with one of the following extensions: .jpg, .jpeg, .png, .gif, .bmp, .webp.');
                    return false;
                }
                return true;
            }
        </script>
        <jsp:include page="/menu.jsp" flush="true" />

        <h1>Collection Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./CollectionController" method="POST" onclick="return validateForm()">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.collection.collectionID}" required="Please enter" type="hidden"</td></tr>
                <tr><td>Collection Name</td><td><input name="collectionName" value="${requestScope.collection.collectionName}" required="Please enter" </td></tr>
                <tr><td>Collection Image</td><td><input name="collectionImage" value="${requestScope.collection.collectionImage}" required="Please enter"</td></tr>
                <tr><td>Description</td><td><input name="description" value="${requestScope.collection.collectionDescription}" required="Please enter"</td></tr>
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>
