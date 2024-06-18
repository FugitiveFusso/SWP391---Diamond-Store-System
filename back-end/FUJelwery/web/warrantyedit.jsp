<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <script>
            function isValidImageUrlFormat(url) {
                const regex = /^https:\/\/.*\.(jpg|jpeg|png|gif|bmp|webp)$/i;
                return regex.test(url);
            }

            function numberOfWords(str) {
                const words = str.trim().match(/\S+/g) || [];
                return words.length;
            }

            function validateForm() {
                const voucherImageInput = document.querySelector('input[name="warrantyImage"]');
                const imageUrl = voucherImageInput.value;
                const description = document.getElementsByName('warrantyDescription')[0].value;
                const tac = document.getElementsByName('termsAndConditions')[0].value;

                const descriptionMinWords = 5;
                const descriptionMaxWords = 30;

                const tacMinWords = 5;
                const tacMaxWords = 50;

                let isValid = true;

                // Validate Image URL
                if (!isValidImageUrlFormat(imageUrl)) {
                    alert('Invalid image URL. It must start with "https://" and end with one of the following extensions: .jpg, .jpeg, .png, .gif, .bmp, .webp.');
                    isValid = false;
                }

                // Validate Description
                const descriptionWordCount = numberOfWords(description);
                if (descriptionWordCount < descriptionMinWords || descriptionWordCount > descriptionMaxWords) {
                    document.getElementById('description-error').innerText = 'Description must be between 5 and 30 words. Currently ' + descriptionWordCount + ' words.';
                    isValid = false;
                } else {
                    document.getElementById('description-error').innerText = '';
                }

                const tacWordCount = numberOfWords(tac);
                if (tacWordCount < tacMinWords || tacWordCount > tacMaxWords) {
                    document.getElementById('tac-error').innerText = 'Terms and conditions must be between 20 and 70 words. Currently ' + tacWordCount + ' words.';
                    isValid = false;
                } else {
                    document.getElementById('tac-error').innerText = '';
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
        <!--<%@ include file="/salesmenu.jsp" %>-->

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
                <div class="item"><a class="sub-btn"><i class="fas fa-ring"></i>View Product
                        <i class="fas fa-angle-right dropdown"></i>
                        <div class="sub-menu">
                            <a href="DiamondController" class="sub-item">Diamond List</a>
                            <a href="RingController" class="sub-item">Ring List</a>
                            <a href="CollectionController" class="sub-item">Collection List</a>

                        </div>
                    </a>
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

                <div class="item"><a href="salesstaffaccount.jsp"><i class="fas fa-user"></i>Account</a></div>
                <div class="item"><a href="saleslogin?action=logout"><i class="fas fa-right-from-bracket"></i>Logout</a></div>

            </div>
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
                <input type="number" name="id" value="${requestScope.warranty.id}" class="form-control" hidden="">                           
                <div class="row content-info">
                    <div class="col-md-6 content-left"> 
                        <div class="info-input">                                                      
                            <h2>Warranty Image</h2>
                            <input name="warrantyImage" value="${requestScope.warranty.image}" required="Please enter" class="form-control">
                        </div> 


                        <div class="info-input">                          
                            <h2>Warranty Start Date</h2>
                            <input type="date" name="startDate" value="${requestScope.warranty.startdate}" required="Please enter" class="form-control">                           
                        </div>
                        <div class="info-input">                          
                            <h2>Warranty Description</h2>
                            <textarea id="description" name="warrantyDescription" required="Please enter" class="form-control" style="resize: both;">${requestScope.warranty.description}</textarea>                                                   
                            <span id="description-error" class="error" style="color: red"></span>

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
                            <textarea id="termandcondition" name="termsAndConditions" required="Please enter" class="form-control" style="resize: both;">${requestScope.warranty.termsandconditions}</textarea>                                                   
                            <span id="tac-error" class="error" style="color: red"></span>

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
