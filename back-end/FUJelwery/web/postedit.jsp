
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function numberOfWords(str) {
                // Use match to find all words, returning an empty array if there are no matches
                const words = str.trim().match(/\S+/g) || [];
                return words.length;
            }

            function validateForm() {
                const postImageInput = document.querySelector('input[name="postImage"]');
                const imageUrl = postImageInput.value;
                const description = document.getElementsByName('description')[0].value;
                const postText = document.getElementsByName('postText')[0].value;

                const descriptionMinWords = 20;
                const descriptionMaxWords = 70;
                const scriptMinWords = 50;
                const scriptMaxWords = 2000;

                let isValid = true;

                // Validate Image URL
                if (!isValidImageUrlFormat(imageUrl)) {
                    alert('Invalid image URL. It must start with "https://" and end with one of the following extensions: .jpg, .jpeg, .png, .gif, .bmp, .webp.');
                    isValid = false;
                }

                // Validate Description
                const descriptionWordCount = numberOfWords(description);
                if (descriptionWordCount < descriptionMinWords || descriptionWordCount > descriptionMaxWords) {
                    document.getElementById('description-error').innerText = 'Description must be between 20 and 70 words. Currently ' + descriptionWordCount + ' words.';
                    isValid = false;
                } else {
                    document.getElementById('description-error').innerText = '';
                }

                // Validate Script
                const postTextWordCount = numberOfWords(postText);
                if (postTextWordCount < scriptMinWords || postTextWordCount > scriptMaxWords) {
                    document.getElementById('postText-error').innerText = 'Script must be between 50 and 2000 words. Currently ' + postTextWordCount + ' words.';
                    isValid = false;
                } else {
                    document.getElementById('postText-error').innerText = '';
                }

                return isValid;
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

        <div class="menu-btn">
            <div class="btn-cover">
                <i class="fas fa-bars"></i>
            </div>            
        </div>

        <div class="side-bar">
            <header>
                <div class="close-btn">
                    <i class="fa-solid fa-xmark"></i>
                </div>
                <img src="images/Screenshot (656).png">
                <h1>${requestScope.admin.lastname} ${requestScope.admin.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-table"></i>View List
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="CustomerController" class="sub-item">Customer List</a>
                            <a href="AdminController" class="sub-item">Administrator List</a>
                            <a href="DeliveryStaffController" class="sub-item">Delivery Staff List</a>
                            <a href="SalesController" class="sub-item">Sale Staff List</a>
                            <a href="ManagerController" class="sub-item">Manager List</a>
                        </div>
                    </a>
                </div>

                <div class="item"><a href="PostController"><i class="fas fa-file"></i>Posts</a></div>

                <div class="item"><a href="adminaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="adminlogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
        </div>

        <div class="title">
            <h1>Post Edit</h1>
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
            <form action="./PostController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Post ID</h2>
                            <input type="number" name="id" value="${requestScope.post.id}" min="1" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">
                            <h2>Description</h2>
                            <input id="description" name="description" value="${requestScope.post.description}" required="Please enter" class="form-control">
                            <span id="description-error" class="error" style="color: red"></span>
                        </div>
                        <div class="info-input">
                            <h2>Date</h2>
                            <input type="date" name="postDate" value="${requestScope.post.date}" required="Please enter" class="form-control">
                        </div>
                        <div class="info-input">
                            <h2>Author</h2>
                            <input name="author" value="${sessionScope.adminsession.firstname} ${sessionScope.adminsession.lastname}" required="Please enter" class="form-control" readonly="">
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                                                      
                            <h2>Post Name</h2>
                            <input name="postName" value="${requestScope.post.name}" required="Please enter" class="form-control">
                        </div>
                        <div class="info-input">
                            <h2>Post Image</h2>
                            <input name="postImage" value="${requestScope.post.image}" required="Please enter" class="form-control">
                        </div>
                        <div class="info-input">
                            <h2>Script</h2>
                            <input id="postText" name="postText" value="${requestScope.post.text}" required="Please enter" class="form-control">
                            <span id="postText-error" class="error" style="color: red"></span>
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
                    <form action="PostController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" style="color: white" ></form>
                </div>
            </div>
        </div>


    </div>
</div>
<script src="js/pagination.js"></script><script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js"
                                                integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw=="
crossorigin="anonymous"></script>
<script src="js/sidenav.js"></script>
</body>
</html>
