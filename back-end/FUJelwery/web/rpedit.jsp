
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ring Placement Price Management</title>
        <link rel="icon" type="image/x-icon" href="images/Screenshot__656_-removebg-preview.png">
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                <h1>${sessionScope.salessession.lastname} ${sessionScope.salessession.firstname}</h1>
            </header>

            <div class="menu">               
                <div class="item"><a class="sub-btn"><i class="fas fa-ring"></i>View Product
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondController" class="sub-item">Diamond List</a>
                            <a href="RingController" class="sub-item">Ring List</a>
                            <a href="CollectionController" class="sub-item">Collection List</a>

                        </div>
                    </a>
                    <a href="warrantydetails.jsp"></a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-tags"></i>View Product Price
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondPriceController" class="sub-item">Diamond Price List</a>
                            <a href="RingPlacementPriceController" class="sub-item">Ring Price List</a>                                                    
                        </div>
                    </a>
                </div>
                <div class="item"><a class="sub-btn"><i class="fas fa-folder"></i>View Document
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="VoucherController" class="sub-item">Voucher List</a>
                            <a href="WarrantyController" class="sub-item">Warranty List</a> 
                            <a href="CertificateController" class="sub-item">Certificate List</a>  
                        </div>
                    </a>
                </div>

                <div class="item"><a href="CategoryController"><i class="fas fa-layer-group"></i>View Category</a></div>
                <div class="item"><a href="SalesStaffOrderController"><i class="fas fa-receipt"></i>Track All Orders</a></div>
                <div class="item"><a href="SalesHistory"><i class="fas fa-clock-rotate-left"></i>View Processed Orders</a></div>

                <div class="item"><a href="salesstaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="saleslogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
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
                <input type="number" name="id" value="${requestScope.rp.id}" hidden="" class="form-control">                           
                <div class="row content-info">
                    <div class="col-md-6 content-left">
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
