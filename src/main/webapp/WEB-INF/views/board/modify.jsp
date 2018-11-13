<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">MODIFY</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">BOARD MODIFY</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/modify" method="post">
				<input type="hidden" name="page" value="${pageObj.page}">
				<input type='hidden' name='bno' value="${board.bno}">
					<div class="form-group">
						<label>TITLE</label> <input class="form-control" name='title' value='<c:out value="${board.title}"></c:out>'>
					</div>
					<div class="form-group">
						<label>WRITER</label> <input class="form-control" name='writer' value='<c:out value="${board.writer}"></c:out>'>
					</div>

					<div class="form-group">
						<label>CONTENT</label>
						<textarea class="form-control" name='content' rows="3"><c:out value="${board.content}"></c:out></textarea>
					</div>
					<div class="form-group">
					<button type="submit" class="btn btn-default">MODIFY</button>
					</div>
				</form>
					<form role="form" action="/board/read" method="get">
					<input type='hidden' name='bno' value="${board.bno}">
					<input type="hidden" name="page" value="${pageObj.page}">
						<button type="submit" class="btn btn-default">BACK</button>
					</form>
					<form role="form" action="/board/delete" method="post">
					<input type="hidden" name="page" value="${pageObj.page}">
					<input type='hidden' name='bno' value="${board.bno}">
						<button type="submit" class="btn btn-default">DELETE</button>
					</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>



<%@include file="../includes/footer.jsp"%>



</body>

</html>







