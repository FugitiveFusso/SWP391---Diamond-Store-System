
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
            const priceInput = document.querySelector('input[name="rpPrice"]');
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
            <h1>Ring Price Edit</h1>
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
            <form action="./RingPlacementPriceController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Ring Price ID</h2>
                            <input type="number" name="id" value="${requestScope.rp.id}" min="1" required="Please enter" class="form-control">                           
                        </div> 

                        <div class="info-input">                          
                            <h2>Material</h2>
                            <select name="material" required class="form-control">
                                <option value="">Please select</option>
                                <option value="Platinum" ${requestScope.rp.material == 'Platinum' ? 'selected' : ''}>Platinum</option>
                                <option value="Palladium" ${requestScope.rp.material == 'Palladium' ? 'selected' : ''}>Palladium</option>
                                <option value="White Gold" ${requestScope.rp.material == 'White Gold' ? 'selected' : ''}>White Gold</option>
                                <option value="Gold" ${requestScope.rp.material == 'Gold' ? 'selected' : ''}>Gold</option>
                                <option value="Gold, Nickel" ${requestScope.rp.material == 'Gold, Nickel' ? 'selected' : ''}>Gold, Nickel</option>
                                <option value="Yellow Gold" ${requestScope.rp.material == 'Yellow Gold' ? 'selected' : ''}>Yellow Gold</option>
                                <option value="Rose Gold" ${requestScope.rp.material == 'Rose Gold' ? 'selected' : ''}>Rose Gold</option>
                                <option value="Sterling Silver" ${requestScope.rp.material == 'Sterling Silver' ? 'selected' : ''}>Sterling Silver</option>
                                <option value="Titanium" ${requestScope.rp.material == 'Titanium' ? 'selected' : ''}>Titanium</option>
                                <option value="Black Zirconium" ${requestScope.rp.material == 'Black Zirconium' ? 'selected' : ''}>Black Zirconium</option>
                                <option value="Tungsten Carbide" ${requestScope.rp.material == 'Tungsten Carbide' ? 'selected' : ''}>Tungsten Carbide</option>
                                <option value="Stainless Steel" ${requestScope.rp.material == 'Stainless Steel' ? 'selected' : ''}>Stainless Steel</option>
                            </select>                          
                        </div>
                        <div class="info-input">                          
                            <h2>Price</h2>
                            <input type="number" name="rpPrice" value="${requestScope.rp.price}" required min="1000000" max="1000000000" class="form-control">
                            <span id="priceNotification" class="notification"></span>                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                                                      
                            <h2>Ring Placement Name</h2>
                            <input name="rName" value="${requestScope.rp.name}" required="Please enter" class="form-control">
                        </div>
                        <div class="info-input">                          
                            <h2>Color</h2>
                            <select name="color" required class="form-control">
                                <option value="">Please select</option>
                                <option value="Silver" ${requestScope.rp.color == 'Silver' ? 'selected' : ''}>Silver</option>
                                <option value="Pink" ${requestScope.rp.color == 'Pink' ? 'selected' : ''}>Pink</option>
                                <option value="Yellow Gold" ${requestScope.rp.color == 'Yellow Gold' ? 'selected' : ''}>Yellow Gold</option>
                                <option value="White" ${requestScope.rp.color == 'White' ? 'selected' : ''}>White</option>
                                <option value="Violet" ${requestScope.rp.color == 'Violet' ? 'selected' : ''}>Violet</option>
                                <option value="Violet-Blue" ${requestScope.rp.color == 'Violet-Blue' ? 'selected' : ''}>Violet-Blue</option>
                                <option value="Dark Blue" ${requestScope.rp.color == 'Dark Blue' ? 'selected' : ''}>Dark Blue</option>
                                <option value="Light Blue" ${requestScope.rp.color == 'Light Blue' ? 'selected' : ''}>Light Blue</option>
                                <option value="Blue-Green" ${requestScope.rp.color == 'Blue-Green' ? 'selected' : ''}>Blue-Green</option>
                                <option value="Green" ${requestScope.rp.color == 'Green' ? 'selected' : ''}>Green</option>
                                <option value="Yellow-Green" ${requestScope.rp.color == 'Yellow-Green' ? 'selected' : ''}>Yellow-Green</option>
                                <option value="Yellow" ${requestScope.rp.color == 'Yellow' ? 'selected' : ''}>Yellow</option>
                                <option value="Amber" ${requestScope.rp.color == 'Amber' ? 'selected' : ''}>Amber</option>
                                <option value="Orange" ${requestScope.rp.color == 'Orange' ? 'selected' : ''}>Orange</option>
                                <option value="Red" ${requestScope.rp.color == 'Red' ? 'selected' : ''}>Red</option>
                                <option value="Brown" ${requestScope.rp.color == 'Brown' ? 'selected' : ''}>Brown</option>
                                <option value="Gray" ${requestScope.rp.color == 'Gray' ? 'selected' : ''}>Gray</option>
                                <option value="Black" ${requestScope.rp.color == 'Black' ? 'selected' : ''}>Black</option>
                            </select>                         
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
                    <form action="RingPlacementPriceController">
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
