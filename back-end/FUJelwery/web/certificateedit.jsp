
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <div class="title">
            <h1>Certificate Edit</h1>
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
            <form action="./CertificateController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Certificate ID</h2>
                            <input type="number" name="id" value="${requestScope.certificate.certificateID}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Certificate Description</h2>
                            <input name="description" value="${requestScope.certificate.certificateDescription}" required="Please enter" class="form-control">
                        </div> 
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Certificate Image</h2>
                            <input name="certificateImage" value="${requestScope.certificate.certificateImage}" min="1" required="Please enter" class="form-control">                           
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
                    <form action="CertificateController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
                </div>
            </div>
        </div>
        <!--            <div class="buttons">
                        <form action="CertificateController" style="padding-top: 10px">
                            <input type=hidden name="action" value="list">
                            <input type=submit value="Return" ></form>
        
                    </div>-->
    </div>

    <!--        <form action="./CertificateController" method="POST" onclick="return validateForm()">
                <table>
    
                    <tr><td></td><td><input name="id" value="${requestScope.certificate.certificateID}" required="Please enter" type="hidden"</td></tr>
                    <tr><td>Certificate Image</td><td><input name="certificateImage" value="${requestScope.certificate.certificateImage}" required="Please enter"</td></tr>
                    <tr><td>Description</td><td><input name="description" value="${requestScope.certificate.certificateDescription}" required="Please enter"</td></tr>
                    <tr><td colspan="2">
                            <input name="action" value="${requestScope.nextaction}" type="hidden">
                            <input type="submit" value="Save">
                        </td></tr>
                </table>
    
            </form>-->
</body>
</html>
