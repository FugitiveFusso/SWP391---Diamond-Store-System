<%-- 
    Document   : user_accountdetails
    Created on : Jun 12, 2024, 11:45:05 PM
    Author     : Le Anh Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Account</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/user_accountdetails.css">
        <link rel="stylesheet" href="css/navbaruser.css">
    </head>
    <body>

        <div class="menu">
            <ul class="navbar">
                <li class="navbar__link">
                    <a href="#">Jewelry</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='./ProductController'>Ring</a></li>
                            <li><a href='./UserCollectionController'>Collection</a></li>
                        </ul>
                    </div>                  
                </li>
                <li class="navbar__link"><a href='./UserVoucherController'>Voucher</a></li>
                <li class="navbar__link">
                    <a href="static_webpages/certificate_edu.jsp">Education</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='UserPostController'>Blog</a></li>
                            <li><a href='static_webpages/ringmeasuring.jsp'>Ring Measuring Guide</a></li>          
                            <li><a href='static_webpages/faqs.jsp'>Frequently Asking Questions</a></li>
                        </ul>
                    </div>
                </li>
                <a href="user_homepage.jsp"><img src="images/Screenshot (656).png"></a>
                <li class="navbar__link"><a href="user_aboutus.jsp">About Us</a></li>
                <li class="navbar__link"><a href="#">Order</a></li>
                <li class="navbar__link">
                    <a href="user_accountdetails.jsp">Account</a>
                    <div class="sub-menu-1">
                        <ul>
                            <li><a href='userlogin?action=logout'>Logout</a></li>          
                        </ul>
                    </div>
                </li>

            </ul>
        </div> 

        <div class="container bootstrap snippets bootdey">
            <div class="row">
                <div class="profile-nav col-md-3">
                    <div class="panel">
                        <div class="user-heading round">
                            <a href="#">
                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                            </a>
                            <h1>${sessionScope.usersession.firstname} ${sessionScope.usersession.lastname}</h1>
                            <p>${sessionScope.usersession.email}</p>
                        </div>

                        <div class="nav-stacks">
                            <ul class="nav nav-pills nav-stacked">
                                <li><a href="#"> <i class="fa fa-user"></i> Profile</a></li>
                                <li><a href="#"> <i class="fa fa-calendar"></i> Recent Activity</a></li>
                                <li><a href="#"> <i class="fa fa-edit"></i> Edit profile</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="profile-info col-md-9">
                    <div class="panel">
                        <!--                        <form>
                                                    <textarea placeholder="Whats in your mind today?" rows="2" class="form-control input-lg p-text-area"></textarea>
                                                </form>
                                                <footer class="panel-footer">
                                                    <button class="btn btn-warning pull-right">Post</button>
                                                    <ul class="nav nav-pills">
                                                        <li>
                                                            <a href="#"><i class="fa fa-map-marker"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i class="fa fa-camera"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i class=" fa fa-film"></i></a>
                                                        </li>
                                                        <li>
                                                            <a href="#"><i class="fa fa-microphone"></i></a>
                                                        </li>
                                                    </ul>
                                                </footer>
                                            </div>-->
                        <div class="panel">
                            <div class="bio-graph-heading">
                                FUJ hope you have a great experience from using our service
                            </div>
                            <div class="panel-body bio-graph-info">
                                <h1>Personal Details</h1>
                                <div class="row">
                                    <div class="bio-row">
                                        <p><span>First Name </span>: ${sessionScope.usersession.lastname}</p>
                                    </div>
                                    <div class="bio-row">
                                        <p><span>Last Name </span>: ${sessionScope.usersession.firstname}</p>
                                    </div>
                                    <div class="bio-row">
                                        <p><span>Address </span>: ${sessionScope.usersession.address}</p>
                                    </div>
                                    <div class="bio-row">
                                        <p><span>Email </span>: ${sessionScope.usersession.email}</p>
                                    </div>
                                    <div class="bio-row">
                                        <p><span>Mobile </span>: ${sessionScope.usersession.phonenumber}</p>
                                    </div>
                                    <div class="bio-row">
                                        <p><span>Points </span>: ${sessionScope.usersession.point}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="bio-chart">
                                                <div style="display:inline;width:100px;height:100px;"><canvas width="100" height="100px"></canvas><input class="knob" data-width="100" data-height="100" data-displayprevious="true" data-thickness=".2" value="35" data-fgcolor="#e06b7d" data-bgcolor="#e8e8e8" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(224, 107, 125); padding: 0px; -webkit-appearance: none; background: none;"></div>
                                            </div>
                                            <div class="bio-desk">
                                                <h4 class="red">Envato Website</h4>
                                                <p>Started : 15 July</p>
                                                <p>Deadline : 15 August</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="bio-chart">
                                                <div style="display:inline;width:100px;height:100px;"><canvas width="100" height="100px"></canvas><input class="knob" data-width="100" data-height="100" data-displayprevious="true" data-thickness=".2" value="63" data-fgcolor="#4CC5CD" data-bgcolor="#e8e8e8" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(76, 197, 205); padding: 0px; -webkit-appearance: none; background: none;"></div>
                                            </div>
                                            <div class="bio-desk">
                                                <h4 class="terques">ThemeForest CMS </h4>
                                                <p>Started : 15 July</p>
                                                <p>Deadline : 15 August</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="bio-chart">
                                                <div style="display:inline;width:100px;height:100px;"><canvas width="100" height="100px"></canvas><input class="knob" data-width="100" data-height="100" data-displayprevious="true" data-thickness=".2" value="75" data-fgcolor="#96be4b" data-bgcolor="#e8e8e8" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(150, 190, 75); padding: 0px; -webkit-appearance: none; background: none;"></div>
                                            </div>
                                            <div class="bio-desk">
                                                <h4 class="green">VectorLab Portfolio</h4>
                                                <p>Started : 15 July</p>
                                                <p>Deadline : 15 August</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="bio-chart">
                                                <div style="display:inline;width:100px;height:100px;"><canvas width="100" height="100px"></canvas><input class="knob" data-width="100" data-height="100" data-displayprevious="true" data-thickness=".2" value="50" data-fgcolor="#cba4db" data-bgcolor="#e8e8e8" style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(203, 164, 219); padding: 0px; -webkit-appearance: none; background: none;"></div>
                                            </div>
                                            <div class="bio-desk">
                                                <h4 class="purple">Adobe Muse Template</h4>
                                                <p>Started : 15 July</p>
                                                <p>Deadline : 15 August</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer">
            <div class="footer-content">
                <div class="info">
                    <div class="info-img">
                        <img src="images/Screenshot (659).png" />
                    </div>

                    <div class="info-text">
                        <p>
                            Address: FPT University, District 9, HCMC
                        </p>
                        <p>
                            Email: CuongNPSE183844@fpt.edu.vn
                        </p>
                        <p>
                            Phone: (+ 84) 898876512
                        </p>
                        <p>
                            © Copyright 2024
                        </p>
                    </div>
                </div>

                <div class="customer-service">
                    <div class="customer-service-title">
                        Customer service
                    </div>

                    <div class="customer-service-text">
                        <p><a href="static_webpages/ringmeasuring.jsp">Instructions for measuring rings</a></p>
                        <p><a href="static_webpages/consulation.jsp">Product consultation by month of birth</a></p>
                        <p><a href="static_webpages/faqs.jsp">Frequently asked questions</a></p>
                    </div>
                </div>

                <div class="policy">
                    <div class="policy-title">
                        Policy
                    </div>

                    <div class="policy-text">
                        <p><a href="static_webpages/warrantyPolicy.jsp">Warranty Policy</a></p>
                        <p><a href="static_webpages/deliveryPolicy.jsp">Delivery Policy</a></p>
                        <p><a href="static_webpages/returnPolicy.jsp">Return Policy</a></p>
                        <p><a href="static_webpages/privatePolicy.jsp">Privacy policy</a></p>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
