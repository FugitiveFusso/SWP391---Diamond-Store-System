<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="css/navbar.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
                if (value === "" || isNaN(value) || parseInt(value) <= 1) {
                    alert("Please enter an integer larger than one.");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
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
            <h1>Warranty Edit</h1>
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
            <form action="./WarrantyController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Warranty ID</h2>
                            <input type="number" name="id" value="${requestScope.warranty.id}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Warranty Image</h2>
                            <input name="warrantyImage" value="${requestScope.warranty.image}" required="Please enter" class="form-control">
                        </div> 
                        <div class="info-input">                          
                            <h2>Warranty Description</h2>
                            <input name="warrantyDescription" value="${requestScope.warranty.description}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Warranty Start Date</h2>
                            <input type="date" name="startDate" value="${requestScope.warranty.startdate}" required="Please enter" class="form-control">                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Warranty Name</h2>
                            <input name="warrantyName" value="${requestScope.warranty.name}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Warranty Month</h2>
                            <input name="warrantyMonth" type="number" value="${requestScope.warranty.month}" required="required" class="form-control" min="1">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Warranty Type</h2>
                            <select name="warrantyType" required="" class="form-control">
                                <option value="">Please select an Warranty Type</option>
                                <option value="Limited Warranty" ${requestScope.warranty.type == 'Limited Warranty' ? 'selected' : ''}>Limited Warranty</option>
                                <option value="Lifetime Warranty" ${requestScope.warranty.type == 'Lifetime Warranty' ? 'selected' : ''}>Lifetime Warranty</option>
                                <option value="Extended Warranty" ${requestScope.warranty.type == 'Extended Warranty' ? 'selected' : ''}>Extended Warranty</option>
                                <option value="Manufacturer Warranty" ${requestScope.warranty.type == 'Manufacturer Warranty' ? 'selected' : ''}>Manufacturer's Warranty</option>
                                <option value="Retailer Warranty" ${requestScope.warranty.type == 'Retailer Warranty' ? 'selected' : ''}>Retailer's  Warranty</option>

                            </select>
                        </div>
                        <div class="info-input">                          
                            <h2>Terms and Conditions</h2>
                            <input name="termsAndConditions" value="${requestScope.warranty.termsandconditions}" required="Please enter" class="form-control">                           
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
                    <form action="WarrantyController">
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
