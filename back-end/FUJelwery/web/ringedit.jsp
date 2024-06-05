
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Editing</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <script>
            const priceInput = document.querySelector('input[name="price"]');
            const priceNotification = document.getElementById('priceNotification');

            priceInput.addEventListener('input', function () {
                const price = parseFloat(this.value);
                if (price > 1000000000) {
                    priceNotification.textContent = 'Price must be less than or equal to 1000000000.';
                } else {
                    priceNotification.textContent = '';
                }
            });
        </script>
        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function validateForm() {
                const postImageInput = document.querySelector('input[name="ringImage"]');
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
        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('rpID')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('diamondID')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('collectionID')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
        <script type="text/javascript">
            function validateInput() {
                var input = document.getElementsByName('categoryID')[0];
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
            <h1>Ring Edit</h1>
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
            <form action="./RingController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Ring ID</h2>
                            <input type="number" name="id" value="${requestScope.ring.ringID}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Ring Image</h2>
                            <input name="ringImage" value="${requestScope.ring.ringImage}" required="Please enter" class="form-control">
                        </div> 
                        <div class="info-input">                          
                            <h2>Diamond ID</h2>
                            <input name="diamondID" type="number" value="${requestScope.ring.diamondID}" required="Please enter" min="1" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Collection ID</h2>
                            <input name="collectionID" type="number" value="${requestScope.ring.collectionID}" required="Please enter" min="1" class="form-control">                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Ring Name</h2>
                            <input name="ringName" value="${requestScope.ring.ringName}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Ring Placement ID</h2>
                            <input name="rpID" value="${requestScope.ring.rpID}" min="1" required="Please enter" class="form-control">                         
                        </div>
                        <div class="info-input">                          
                            <h2>Addition Price</h2>
                            <input type="number" name="price" value="${requestScope.ring.price}" required min="1000000" max="1000000000" class="form-control">                           
                            <span id="priceNotification" class="notification"></span>
                        </div>
                        <div class="info-input">                          
                            <h2>Category ID</h2>
                            <input name="categoryID" type="number" value="${requestScope.ring.categoryID}" required="Please enter" min="1" class="form-control">                           
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
                    <form action="RingController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
                </div>
            </div>
        </div>

    </div>

    <!--
    <form action="./RingController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
        <table>

            <tr><td>ID</td><td><input name="id" type="number" value="${requestScope.ring.ringID}" min="1" required="Please enter"</td></tr>
            <tr><td>Ring Name</td><td><input name="ringName" value="${requestScope.ring.ringName}" required="Please enter" </td></tr>
            <tr><td>Ring Image</td><td><input name="ringImage" value="${requestScope.ring.ringImage}" required="Please enter"</td></tr>
            <tr><td>Ring Placement ID</td><td><input name="rpID" type="number" value="${requestScope.ring.rpID}" min="1" required="Please enter"</td></tr>
            <tr><td>Diamond ID</td><td><input name="diamondID" type="number" value="${requestScope.ring.diamondID}" min="1" required="Please enter"</td></tr>
            <tr>
                <td>Addition Price</td>
                <td>
                    <input type="number" name="price" value="${requestScope.ring.price}" required min="1000000" max="1000000000">
                    <span id="priceNotification" class="notification"></span>
                </td>
            </tr>                   
            <tr><td>Collection ID</td><td><input name="collectionID" type="number" value="${requestScope.ring.collectionID}" min="1" required="Please enter"</td></tr>
            <tr><td>Category ID</td><td><input name="categoryID" type="number" value="${requestScope.ring.categoryID}" min="1" required="Please enter"</td></tr>
            <tr><td colspan="2">
                    <input name="action" value="${requestScope.nextaction}" type="hidden">
                    <input type="submit" value="Save">
                </td></tr>
        </table>

    </form>
    <form action="RingController" style="padding-top: 10px">
        <input type="hidden" name="action" value="list">
        <input type="submit" value="Return">
    </form>-->
</body>
</html>
