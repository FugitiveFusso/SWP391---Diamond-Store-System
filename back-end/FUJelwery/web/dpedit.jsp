<%-- 
    Document   : dpedit
    Created on : Jun 1, 2024, 10:20:35 AM
    Author     : phucu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>DiamondPrice Edit </h1>
        <p> Login user: ${sessionScope.salessession.username}</p>

        <form action="./DiamondPriceController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.dp.id}" required="Please enter" type="hidden"</td></tr>
                <tr>
                    <td>Diamond Size</td>
                    <td>
                        <select name="diamondSize" required>
                            <option value="">Please select</option>
                            <option value="4.5" ${requestScope.dp.size == 4.5 ? 'selected' : ''}>4.5</option>
                            <option value="5.7" ${requestScope.dp.size == 5.7 ? 'selected' : ''}>5.7</option>
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
                            <option value="J" ${requestScope.dp.color == 'J' ? 'selected' : ''}>J</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td>Clarity</td>
                    <td>
                        <select name="clarity" required>
                            <option value="">Please select</option>
                            <option value="IF" ${requestScope.dp.clarity == 'IF' ? 'selected' : ''}>IF</option>
                            <option value="VS1" ${requestScope.dp.clarity == 'VS1' ? 'selected' : ''}>VS1</option>
                            <option value="VS2" ${requestScope.dp.clarity == 'VS2' ? 'selected' : ''}>VS2</option>
                            <option value="VVS1" ${requestScope.dp.clarity == 'VVS1' ? 'selected' : ''}>VVS1</option>
                            <option value="VVS2" ${requestScope.dp.clarity == 'VVS2' ? 'selected' : ''}>VVS2</option>
                        </select>
                    </td>
                </tr>
                <tr><td>Cut</td><td><input name="cut" value="${requestScope.dp.cut}" required="Please enter" readonly=""</td></tr>
                <tr>
                    <td>Price</td>
                    <td>
                        <input type="number" name="price" value="${requestScope.dp.price}" required min="0" max="1000000000">
                        <span id="priceNotification" class="notification"></span>
                    </td>
                </tr>                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>
