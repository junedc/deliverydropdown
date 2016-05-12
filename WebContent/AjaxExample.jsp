<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajax Example in Struts 1e</title>
<script src="/AjaxWithStruts1/js/jquery.js"></script>
<script type="text/javascript">
	function doAjaxPost() {
		// get the form values  
		var name = $('#name').val();

		
		$.ajax({
			type : "POST",
			url : "/AjaxWithStruts1/AjaxSubmit.do",
			data : "name=" + name,
			success : function(response) {
				// we have the response  
				$('#info').html(response);
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}

	function getCities() {
		// get the form values  
		var name = $('#name').val();
		var country = $('#country').val();
		
		$.ajax({
			type : "GET",
			url : "/AjaxWithStruts1/AjaxSubmit.do?myName=" + name + "&myCountry=" + country,
			dataType: 'json',
			data : {"name" : name , "country" : country },						
			success : function(response) {
				// we have the response  
				
				var select = $('#states');
				select.find('option').remove();
				$.each(response, function(key, value) {
					$('<option>').val(key).text(value).appendTo(select);
				});
				
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		});
	}
	
	function getCities2(){
		
		var country = $("select#country").val();
		$.getJSON('/AjaxWithStruts1/AjaxSubmit.do?method=getJsonData', {
			countryName : country
		}, function(jsonResponse) {
			alert(jsonResponse);			
			var select = $('#states');
			select.find('option').remove();
			$.each(jsonResponse.stateMap, function(key, value) {
				$('<option>').val(key).text(value).appendTo(select);
			});
		});
	
	}
</script>
</head>
<body>
	Enter your name please :
	<input type="text" id="name">
	<br />
	<input type="button" value="Say Hello" onclick="doAjaxPost()">
	<br />
	<input type="button" value="Get Cities " onclick="getCities2()">
	<br />
	<input type="button" value="Get cities Working" onclick="getCities()">
	<br />
	<div id="info" style="color: green;"></div>
	
	
	
	<tr>
    <td class="tdLabel"><label for="country" class="label">Select Country:</label></td>
    <td
><select name="country" id="country">
    <option value="Select Country">Select Country</option>
    <option value="India">India</option>
    <option value="US">US</option>


</select>
</td>
</tr>

	<br />
	<br />
	<tr>
    <td class="tdLabel"><label for="states" class="label">Select State:</label></td>
    <td
><select name="states" id="states">
    <option value="Select State">Select State</option>


</select>
</td>
</tr>

	<br />
	<br />
	<div id="ajaxResponse"></div>
</body>
</html>