

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Diamond Editing</title>
        <link rel="stylesheet" href="css/post_edit.css"/>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        
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
        <jsp:include page="/salesmenu.jsp" flush="true" />

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
                <div class="row content-info">
                    <div class="col-md-6 content-left">
                        <div class="info-input">                          
                            <h2>Diamond ID</h2>
                            <input type="number" name="id" value="${requestScope.diamond.diamondID}" min="1" required="Please enter" class="form-control">                           
                        </div> 
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
                        <div class="info-input">                          
                            <h2>Certificate ID</h2>
                            <input name="certificateID" type="number" value="${requestScope.diamond.certificateID}" required="Please enter" min="1" class="form-control">                           
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
                    <form action="./DiamondController">
                        <input type=hidden name="action" value="list">
                        <input type=submit value="Return" class="btn btn-primary"></form>
                </div>
            </div>
        </div>

    </div>

    <!--        <form action="./DiamondController" method="POST" onsubmit="return validateForm()" onsubmit="return validateInput()">
                <table>
    
                    <tr><td>ID</td><td><input name="id" type="number" value="${requestScope.diamond.diamondID}" required="Please enter" min="1"</td></tr>
                    <tr><td>Diamond Name</td><td><input name="diamondName" value="${requestScope.diamond.diamondName}" required="Please enter" </td></tr>
                    <tr><td>Diamond Image</td><td><input name="diamondImage" value="${requestScope.diamond.diamondImage}" required="Please enter"</td></tr>
                    <tr>
                        <td>Origin</td>
                        <td>
                            <select name="origin" required>
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
                        </td>
                    </tr>
                    <tr><td>Diamond Type</td><td><input name="dpID" type="number" value="${requestScope.diamond.dpID}" required="Please enter" min="1"</td></tr>
                    <tr><td>Certificate ID</td><td><input name="certificateID" type="number" value="${requestScope.diamond.certificateID}" required="Please enter" min="1"</td></tr>
                    <tr><td colspan="2">
                            <input name="action" value="${requestScope.nextaction}" type="hidden">
                            <input type="submit" value="Save">
                        </td></tr>
                </table>
    
            </form>
            <form action="DiamondController" style="padding-top: 10px">
                <input type="hidden" name="action" value="list">
                <input type="submit" value="Return">
            </form>-->
</body>
</html>
