
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
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
        <jsp:include page="/salesmenu.jsp" flush="true" />

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

    <!--        <form action="./RingPlacementPriceController" method="POST" onsubmit="return validateInput()">
                <table>
    
                    <tr>
                        <td>ID</td>
                        <td><input type="number" name="id" value="${requestScope.rp.id}" min="1" required></td>
                    </tr>  
                    <tr><td>Ring Placement Name</td><td><input name="rName" value="${requestScope.rp.name}" required="Please enter" </td></tr>
                    <tr>
                        <td>Material</td>
                        <td>
                            <select name="material" required>
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
                        </td>
                    </tr>
                    <tr>
                        <td>Color</td>
                        <td>
                            <select name="color" required>
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
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                            <input type="number" name="rpPrice" value="${requestScope.rp.price}" required min="1000000" max="1000000000">
                            <span id="priceNotification" class="notification"></span>
                        </td>
                    </tr>  
                    <tr><td colspan="2">
                            <input name="action" value="${requestScope.nextaction}" type="hidden">
                            <input type="submit" value="Save">
                        </td></tr>
    
                </table>
    
            </form>
            <form action="RingPlacementPriceController" style="padding-top: 10px">
                <input type=hidden name="action" value="list">
                <input type=submit value="Return" ></form>-->
</body>
</html>
