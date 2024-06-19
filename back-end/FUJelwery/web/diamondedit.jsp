

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Editing</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link rel="stylesheet" href="css/navbar_admin.css">
        <script src="https://unpkg.com/@phosphor-icons/web"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

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
                <input type="number" name="id" value="${requestScope.diamond.diamondID}" hidden="" class="form-control">                           
                <div class="row content-info">
                    <div class="col-md-6 content-left">
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
                            <h2>Certificate ID</h2>
                            <input name="certificateID" type="number" value="${requestScope.diamond.certificateID}" required="Please enter" min="1" class="form-control">                           
                        </div>

                    </div>
                    <div class="col-md-12">                          
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
