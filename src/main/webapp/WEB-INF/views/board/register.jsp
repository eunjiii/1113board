<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">REGISTER</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">BOARD REGISTER</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>TITLE</label> <input class="form-control" name='title'
							value='제목입력'>
					</div>
					<div class="form-group">
						<label>WRITER</label> <input class="form-control" name='writer'
							value='작성자입력'>
					</div>
					<div class="form-group">
						<label>CONTENT</label>
						<textarea class="form-control" name='content' rows="3">content</textarea>
					</div>


					<button type="submit" class="btn btn-default">등록</button>
				</form>
				<form role="form" action="/board/list" method="get">

					<button type="submit" class="btn btn-default">취소</button>
				</form>

				<div class="uploadDiv">
					<input type="file" name="uploadFile" multiple="multiple">
				</div>

				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
				
				<button id="uploadBtn">UPLOAD</button>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->



</div>
<!-- /.row -->


<%@include file="../includes/footer.jsp"%>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

		
		var cloneObj = $(".uploadDiv").clone();
		
		$("#uploadBtn").on("click", function(e) {

			var formData = new FormData();

			var inputFile = $("input[name='uploadFile']");

			var files = inputFile[0].files;

			console.log(files);

			for (var i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i]);
			}

			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr){
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					str += "<li>" + obj.fileName + "</li>";
				});
				uploadResult.append(str);
			}
			
			$.ajax({

				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType: 'json',
				success : function(result) {
					console.log(result);
					showUploadedFile(result);
					$(".uploadDiv").html(cloneObj.html());
				}

			});

		});

	});
</script>

</body>

</html>