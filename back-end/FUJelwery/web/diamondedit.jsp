

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Editing</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function validateForm() {
                const postImageInput = document.querySelector('input[name="diamondImage"]');
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
                var input = document.getElementsByName('dpID')[0];
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
                var input = document.getElementsByName('certificateID')[0];
                var value = input.value;
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
         <!--<%@ include file="/salesmenu.jsp" %>-->
        
        <div class="header_menu">
            <div id="mySidenav" class="sidenav menu">
                <a href="javascript:void(0)" id="closebtn" class="closebtn" onclick="closeNav()">&times;</a>
                <ul>                   
                    <li>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Product</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="DiamondController">
                                    <span class="text">Diamond List</span>
                                </a>
                            </li>
                            <li>
                                <a href="RingController">
                                    <span class="text">Ring List</span>
                                </a>
                            </li>
                            <li>
                                <a href="CollectionController">
                                    <span class="text">Collection List</span>
                                </a>
                            </li>                           
                        </ul>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Product Price</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="DiamondPriceController">
                                    <span class="text">Diamond List</span>
                                </a>
                            </li>
                            <li>
                                <a href="RingPlacementPriceController">
                                    <span class="text">Ring List</span>
                                </a>
                            </li>                                                     
                        </ul>
                        <a href="javascript:void(0)" onclick="toggleSubMenu(this)">
                            <i class="icon ph-bold ph-user"></i>
                            <span class="text">View Document</span>
                            <i class="arrow ph-bold ph-caret-down"></i>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="VoucherController">
                                    <span class="text">Voucher List</span>
                                </a>
                            </li>
                            <li>
                                <a href="WarrantyController">
                                    <span class="text">Warranty List</span>
                                </a>
                            </li> 
                            <li>
                                <a href="CertificateController">
                                    <span class="text">Certificate List</span>
                                </a>
                            </li> 
                        </ul>
                    </li>
                    <li class="active">
                        <a href="CategoryController">
                            <i class="icon ph-bold ph-file-text"></i>
                            <span class="text">View Category</span>
                        </a>
                    </li>                   
                </ul>
                <div class="menu">

                    <ul>
                        <li>
                            <a href="salesstaffaccount.jsp">
                                <i class="icon ph-bold ph-user"></i>
                                <span class="text">Account</span>
                            </a>
                        </li>
                        <li>
                            <a href="saleslogin?action=logout">
                                <i class="icon ph-bold ph-sign-out"></i>
                                <span class="text">Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>


            <span class="cainut" style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; Menu</span>
        </div>

        <div class="title">
            <h1>Diamond Edit</h1>
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
            <form action="./DiamondController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Diamond ID</h2>
                            <input type="number" name="id" value="${requestScope.diamond.diamondID}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Diamond Image</h2>
                            <input name="diamondImage" value="${requestScope.diamond.diamondImage}" required="Please enter" class="form-control">
                        </div> 
                        <div class="info-input">                          
                            <h2>Diamond Type</h2>
                            <input name="dpID" type="number" value="${requestScope.diamond.dpID}" required="Please enter" min="1" class="form-control">                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Diamond Name</h2>
                            <input name="diamondName" value="${requestScope.diamond.diamondName}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Diamond Origin</h2>
                            <select name="origin" required class="form-control">
                                <option value="">Please select an origin</option>
                                <option value="South Africa" ${requestScope.diamond.origin == 'South Africa' ? 'selected' : ''}>South Africa</option>
                                <option value="Botswana" ${requestScope.diamond.origin == 'Botswana' ? 'selected' : ''}>Botswana</option>
                                <option value="Russia" ${requestScope.diamond.origin == 'Russia' ? 'selected' : ''}>Russia</option>
                                <option value="Canada" ${requestScope.diamond.origin == 'Canada' ? 'selected' : ''}>Canada</option>
                                <option value="Australia" ${requestScope.diamond.origin == 'Australia' ? 'selected' : ''}>Australia</option>
                                <option value="Namibia" ${requestScope.diamond.origin == 'Namibia' ? 'selected' : ''}>Namibia</option>
                                <option value="Angola" ${requestScope.diamond.origin == 'Angola' ? 'selected' : ''}>Angola</option>
                                <option value="Democratic Republic of the Congo" ${requestScope.diamond.origin == 'Democratic Republic of the Congo' ? 'selected' : ''}>Democratic Republic of the Congo</option>
                                <option value="Sierra Leone" ${requestScope.diamond.origin == 'Sierra Leone' ? 'selected' : ''}>Sierra Leone</option>
                                <option value="Lesotho" ${requestScope.diamond.origin == 'Lesotho' ? 'selected' : ''}>Lesotho</option>
                                <option value="Zimbabwe" ${requestScope.diamond.origin == 'Zimbabwe' ? 'selected' : ''}>Zimbabwe</option>
                                <option value="Tanzania" ${requestScope.diamond.origin == 'Tanzania' ? 'selected' : ''}>Tanzania</option>
                                <option value="Brazil" ${requestScope.diamond.origin == 'Brazil' ? 'selected' : ''}>Brazil</option>
                                <option value="India" ${requestScope.diamond.origin == 'India' ? 'selected' : ''}>India</option>
                                <option value="Central African Republic" ${requestScope.diamond.origin == 'Central African Republic' ? 'selected' : ''}>Central African Republic</option>
                                <option value="Guinea" ${requestScope.diamond.origin == 'Guinea' ? 'selected' : ''}>Guinea</option>
                                <option value="Ghana" ${requestScope.diamond.origin == 'Ghana' ? 'selected' : ''}>Ghana</option>
                                <option value="Liberia" ${requestScope.diamond.origin == 'Liberia' ? 'selected' : ''}>Liberia</option>
                                <option value="Ivory Coast" ${requestScope.diamond.origin == 'Ivory Coast' ? 'selected' : ''}>Ivory Coast</option>
                                <option value="Guyana" ${requestScope.diamond.origin == 'Guyana' ? 'selected' : ''}>Guyana</option>
                                <option value="Venezuela" ${requestScope.diamond.origin == 'Venezuela' ? 'selected' : ''}>Venezuela</option>
                                <option value="Indonesia" ${requestScope.diamond.origin == 'Indonesia' ? 'selected' : ''}>Indonesia</option>
                                <option value="Cameroon" ${requestScope.diamond.origin == 'Cameroon' ? 'selected' : ''}>Cameroon</option>
                                <option value="Gabon" ${requestScope.diamond.origin == 'Gabon' ? 'selected' : ''}>Gabon</option>
                                <option value="Republic of the Congo" ${requestScope.diamond.origin == 'Republic of the Congo (Congo-Brazzaville)' ? 'selected' : ''}>Republic of the Congo</option>
                                <option value="Swaziland" ${requestScope.diamond.origin == 'Swaziland (Eswatini)' ? 'selected' : ''}>Swaziland</option>
                                <option value="Mali" ${requestScope.diamond.origin == 'Mali' ? 'selected' : ''}>Mali</option>
                                <option value="Mozambique" ${requestScope.diamond.origin == 'Mozambique' ? 'selected' : ''}>Mozambique</option>
                                <option value="Suriname" ${requestScope.diamond.origin == 'Suriname' ? 'selected' : ''}>Suriname</option>
                                <option value="United States" ${requestScope.diamond.origin == 'United States' ? 'selected' : ''}>United States</option>
                            </select>                           
                        </div>
                        <div class="info-input">                          
                            <h2>Certificate ID</h2>
                            <input name="certificateID" type="number" value="${requestScope.diamond.certificateID}" required="Please enter" min="1" class="form-control">                           
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
                    <form action="DiamondController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
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
