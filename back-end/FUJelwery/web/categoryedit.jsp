
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Editing Page</title>
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
        <jsp:include page="/menu.jsp" flush="true" />


        <div class="title">
            <h1>Category Edit</h1>
            <p> Login user: ${sessionScope.adminsession.username}</p>
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
            <form action="./CategoryController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Category ID</h2>
                            <input type="number" name="id" value="${requestScope.category.categoryID}" min="1" required="Please enter" class="form-control">                           
                        </div>                      
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                                                      
                            <h2>Category Name</h2>
                            <input name="categoryName" value="${requestScope.category.categoryName}" required="Please enter" class="form-control">
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
            </form>
            <form action="CategoryController" style="padding-top: 10px">
                <input type="hidden" name="action" value="list">
                <input type="submit" class="btn btn-primary" value="Return">
            </form>
        </div>

        <!--        <form action="./CategoryController" method="POST" onsubmit="return validateInput()">
                    <table>
        
                        <tr>
                            <td>ID</td>
                            <td><input type="number" name="id" value="${requestScope.category.categoryID}" min="1" required></td>
                        </tr>
                        <tr><td>Category Name</td><td><input name="categoryName" value="${requestScope.category.categoryName}" required="Please enter" </td></tr>
                        <tr><td colspan="2">
                                <input name="action" value="${requestScope.nextaction}" type="hidden">
                                <input type="submit" value="Save">
                            </td></tr>
                    </table>
        
                </form>-->
    </body>
</html>
