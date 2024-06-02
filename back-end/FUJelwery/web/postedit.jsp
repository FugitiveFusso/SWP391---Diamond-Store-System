
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
        
        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function validateForm() {
                const postImageInput = document.querySelector('input[name="postImage"]');
                const imageUrl = postImageInput.value;

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
        <div class="title">
            <h1>Post Edit</h1>
            <p> Login user: ${sessionScope.adminsession.username}</p>
        </div>


        <div class="container content">
            <div class="row content-info">
                <div class="col-md-6 content-left">
                    <div class="info-input">
                        <h2>Post Name</h2>
                        <input name="postName" value="${requestScope.post.name}" required="Please enter" class="form-control">
                    </div>
                    <div class="info-input">
                        <h2>Description</h2>
                        <input name="description" value="${requestScope.post.description}" required="Please enter" class="form-control">
                    </div>
                </div>
                <div class="col-md-6 content-right">
                    <div class="info-input">
                        <h2>Post Image</h2>
                        <input name="postImage" value="${requestScope.post.image}" required="Please enter" class="form-control">
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
            </div>
        </div>



        <!--        <form action="./PostController" method="POST" onsubmit="return validateForm()">
                    <table>
        
                        <tr><td></td><td><input name="id" value="${requestScope.post.id}" required="Please enter" type="hidden"</td></tr>
                        <tr><td>Post Name</td><td><input name="postName" value="${requestScope.post.name}" required="Please enter" </td></tr>
                        <tr><td>Post Image</td><td><input name="postImage" value="${requestScope.post.image}" required="Please enter" </td></tr>
                        <tr><td>Description</td><td><input name="description" value="${requestScope.post.description}" required="Please enter"</td></tr>
        
                        <tr><td colspan="2">
                                <input name="action" value="${requestScope.nextaction}" type="hidden">
                                <input type="submit" value="Save">
                            </td></tr>
                    </table>
        
                </form>-->
    </body>
</html>
