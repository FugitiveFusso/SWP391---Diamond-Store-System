

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
            <h1>Diamond Price Edit</h1>
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
            <form action="./DiamondPriceController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Diamond Price ID</h2>
                            <input type="number" name="id" value="${requestScope.dp.id}" min="1" required="Please enter" class="form-control">                           
                        </div> 
                        <div class="info-input">                                                      
                            <h2>Carat Weight</h2>
                            <select name="caratWeight" required class="form-control">
                                <option value="">Please select</option>
                                <option value="0.36" ${requestScope.dp.caratWeight == 0.36 ? 'selected' : ''}>0.36</option>
                                <option value="0.7" ${requestScope.dp.caratWeight == 0.7 ? 'selected' : ''}>0.7</option>
                            </select>
                        </div> 
                        <div class="info-input">                          
                            <h2>Clarity</h2>
                            <select name="clarity" required class="form-control">
                                <option value="">Please select</option>
                                <option value="FL" ${requestScope.dp.clarity == 'FL' ? 'selected' : ''}>FL</option>
                                <option value="IF" ${requestScope.dp.clarity == 'IF' ? 'selected' : ''}>IF</option>
                                <option value="VVS1" ${requestScope.dp.clarity == 'VVS1' ? 'selected' : ''}>VVS1</option>
                                <option value="VVS2" ${requestScope.dp.clarity == 'VVS2' ? 'selected' : ''}>VVS2</option>
                                <option value="VS1" ${requestScope.dp.clarity == 'VS1' ? 'selected' : ''}>VS1</option>
                                <option value="VS2" ${requestScope.dp.clarity == 'VS2' ? 'selected' : ''}>VS2</option>
                                <option value="SI1" ${requestScope.dp.clarity == 'SI1' ? 'selected' : ''}>SI1</option>
                                <option value="SI2" ${requestScope.dp.clarity == 'SI2' ? 'selected' : ''}>SI2</option>
                            </select>                           
                        </div>
                        <div class="info-input">                          
                            <h2>Price</h2>
                            <input type="number" name="price" value="${requestScope.dp.price}" required min="1000000" max="1000000000" class="form-control">
                            <span id="priceNotification" class="notification"></span>                           
                        </div>
                    </div>
                    <div class="col-md-6 content-right">
                        <div class="info-input">                          
                            <h2>Diamond Size</h2>
                            <select name="diamondSize" required class="form-control">
                                <option value="">Please select</option>
                                <option value="4.5" ${requestScope.dp.size == 4.5 ? 'selected' : ''}>4.5</option>
                                <option value="5" ${requestScope.dp.size == 5 ? 'selected' : ''}>5</option>
                                <option value="5.4" ${requestScope.dp.size == 5.4 ? 'selected' : ''}>5.4</option>
                                <option value="5.7" ${requestScope.dp.size == 5.7 ? 'selected' : ''}>5.7</option>
                                <option value="6" ${requestScope.dp.size == 6 ? 'selected' : ''}>6</option>
                                <option value="6.3" ${requestScope.dp.size == 6.3 ? 'selected' : ''}>6.3</option>
                                <option value="6.5" ${requestScope.dp.size == 6.5 ? 'selected' : ''}>6.5</option>
                                <option value="6.8" ${requestScope.dp.size == 6.8 ? 'selected' : ''}>6.8</option>
                                <option value="7.2" ${requestScope.dp.size == 7.2 ? 'selected' : ''}>7.2</option>
                                <option value="8.1" ${requestScope.dp.size == 8.1 ? 'selected' : ''}>8.1</option>
                                <option value="9.0" ${requestScope.dp.size == 9.0 ? 'selected' : ''}>9.0</option>
                            </select>                           
                        </div>
                        <div class="info-input">                          
                            <h2>Color</h2>
                            <select name="color" required class="form-control">
                                <option value="">Please select</option>
                                <option value="D" ${requestScope.dp.color == 'D' ? 'selected' : ''}>D</option>
                                <option value="E" ${requestScope.dp.color == 'E' ? 'selected' : ''}>E</option>
                                <option value="F" ${requestScope.dp.color == 'F' ? 'selected' : ''}>F</option>
                                <option value="G" ${requestScope.dp.color == 'G' ? 'selected' : ''}>G</option>
                                <option value="H" ${requestScope.dp.color == 'H' ? 'selected' : ''}>H</option>
                                <option value="I" ${requestScope.dp.color == 'I' ? 'selected' : ''}>I</option>
                                <option value="J" ${requestScope.dp.color == 'J' ? 'selected' : ''}>J</option>
                            </select>                           
                        </div>
                        <div class="info-input">                          
                            <h2>Cut</h2>
                            <input type="text" name="cut" value="ROUND BRILLIANT" readonly="a" class="form-control">                           
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
                    <form action="DiamondPriceController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
                </div>
            </div>
        </div>

    </div>
        
<!--        <form action="./DiamondPriceController" method="POST" onsubmit="return validateInput()">
            <table>

                <table>
                    <tr>
                        <td>ID</td>
                        <td><input type="number" name="id" value="${requestScope.dp.id}" min="1" required></td>
                    </tr>                
                    <tr>
                        <td>Diamond Size</td>
                        <td>
                            <select name="diamondSize" required>
                                <option value="">Please select</option>
                                <option value="4.5" ${requestScope.dp.size == 4.5 ? 'selected' : ''}>4.5</option>
                                <option value="5" ${requestScope.dp.size == 5 ? 'selected' : ''}>5</option>
                                <option value="5.4" ${requestScope.dp.size == 5.4 ? 'selected' : ''}>5.4</option>
                                <option value="5.7" ${requestScope.dp.size == 5.7 ? 'selected' : ''}>5.7</option>
                                <option value="6" ${requestScope.dp.size == 6 ? 'selected' : ''}>6</option>
                                <option value="6.3" ${requestScope.dp.size == 6.3 ? 'selected' : ''}>6.3</option>
                                <option value="6.5" ${requestScope.dp.size == 6.5 ? 'selected' : ''}>6.5</option>
                                <option value="6.8" ${requestScope.dp.size == 6.8 ? 'selected' : ''}>6.8</option>
                                <option value="7.2" ${requestScope.dp.size == 7.2 ? 'selected' : ''}>7.2</option>
                                <option value="8.1" ${requestScope.dp.size == 8.1 ? 'selected' : ''}>8.1</option>
                                <option value="9.0" ${requestScope.dp.size == 9.0 ? 'selected' : ''}>9.0</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Carat Weight</td>
                        <td>
                            <select name="caratWeight" required>
                                <option value="">Please select</option>
                                <option value="0.36" ${requestScope.dp.caratWeight == 0.36 ? 'selected' : ''}>0.36</option>
                                <option value="0.7" ${requestScope.dp.caratWeight == 0.7 ? 'selected' : ''}>0.7</option>
                            </select>
                        </td>
                    </tr>                
                    <tr>
                        <td>Color</td>
                        <td>
                            <select name="color" required>
                                <option value="">Please select</option>
                                <option value="D" ${requestScope.dp.color == 'D' ? 'selected' : ''}>D</option>
                                <option value="E" ${requestScope.dp.color == 'E' ? 'selected' : ''}>E</option>
                                <option value="F" ${requestScope.dp.color == 'F' ? 'selected' : ''}>F</option>
                                <option value="G" ${requestScope.dp.color == 'G' ? 'selected' : ''}>G</option>
                                <option value="H" ${requestScope.dp.color == 'H' ? 'selected' : ''}>H</option>
                                <option value="I" ${requestScope.dp.color == 'I' ? 'selected' : ''}>I</option>
                                <option value="J" ${requestScope.dp.color == 'J' ? 'selected' : ''}>J</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>Clarity</td>
                        <td>
                            <select name="clarity" required>
                                <option value="">Please select</option>
                                <option value="FL" ${requestScope.dp.clarity == 'FL' ? 'selected' : ''}>FL</option>
                                <option value="IF" ${requestScope.dp.clarity == 'IF' ? 'selected' : ''}>IF</option>
                                <option value="VVS1" ${requestScope.dp.clarity == 'VVS1' ? 'selected' : ''}>VVS1</option>
                                <option value="VVS2" ${requestScope.dp.clarity == 'VVS2' ? 'selected' : ''}>VVS2</option>
                                <option value="VS1" ${requestScope.dp.clarity == 'VS1' ? 'selected' : ''}>VS1</option>
                                <option value="VS2" ${requestScope.dp.clarity == 'VS2' ? 'selected' : ''}>VS2</option>
                                <option value="SI1" ${requestScope.dp.clarity == 'SI1' ? 'selected' : ''}>SI1</option>
                                <option value="SI2" ${requestScope.dp.clarity == 'SI2' ? 'selected' : ''}>SI2</option>
                            </select>
                        </td>
                    </tr>


                    <tr>
                        <td>Cut</td>
                        <td>
                            <input type="text" name="cut" value="ROUND BRILLIANT" readonly="a">
                        </td>
                    </tr>
                    <tr>
                        <td>Price</td>
                        <td>
                            <input type="number" name="price" value="${requestScope.dp.price}" required min="1000000" max="1000000000">
                            <span id="priceNotification" class="notification"></span>
                        </td>
                    </tr>                
                    <tr><td colspan="2">
                            <input name="action" value="${requestScope.nextaction}" type="hidden">
                            <input type="submit" value="Save">
                        </td></tr>
                </table>

        </form>
        <form action="DiamondPriceController" style="padding-top: 10px">
            <input type=hidden name="action" value="list">
            <input type=submit value="Return" ></form>-->
    </body>
</html>
