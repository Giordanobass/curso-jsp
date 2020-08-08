<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Upload files</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<input type="file" id="file" name="file" onchange="uploadFile();"/>
	<img alt="Imagem" src="" id="target" width="200" height="200">

</body>
<script type="text/javascript">
function uploadFile(){
	var target = document.querySelector("img");
	var file = document.querySelector("input[type=file]").files[0];
	var reader = new FileReader();
	
	reader.onloadend = function(){
		target.src = reader.result;
	};
	if(file){
		reader.readAsDataURL(file);
		//______upload ajax______
		
		$.ajax({
			method: "POST",
			url: "fileUpload",
			data: { fileUpload : reader.result
				}
		}).done(function(response){
			alert("Sucesso: " + response);
		}).fail(function(xhr, status, errorThrown){
			alert("Error: " + xhr.responseText);
		});
		
		//_______________________
	}else{
		target.src="";
	}
}
</script>
</html>