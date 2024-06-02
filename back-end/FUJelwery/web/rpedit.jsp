
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        <jsp:include page="/salesmenu.jsp" flush="true" />

        <h1>Post Edit </h1>
        <p> Login user: ${sessionScope.adminsession.username}</p>

        <form action="./RingPlacementPriceController" method="POST">
            <table>

                <tr><td></td><td><input name="id" value="${requestScope.rp.id}" required="Please enter" type="hidden"</td></tr>
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
                        <input type="number" name="rpPrice" value="${requestScope.rp.price}" required min="0" max="1000000000">
                        <span id="priceNotification" class="notification"></span>
                    </td>
                </tr>  
                <tr><td colspan="2">
                        <input name="action" value="${requestScope.nextaction}" type="hidden">
                        <input type="submit" value="Save">
                    </td></tr>
            </table>

        </form>
    </body>
</html>
