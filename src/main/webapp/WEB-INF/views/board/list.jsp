
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">LIST</h1>
		<a href="/board/register"><button type="button"
				class="btn btn-outline btn-primary btn-lg btn-block">REGISTER</button></a>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">BOARD LIST</div>

						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>BNO</th>
											<th>TITLE</th>
											<th>WRITER</th>
											<th>REGDATE</th>
											<th>UPDATEDATE</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="board">
											<tr>
												<td><c:out value="${board.bno}" /></td>
												<td><a class= 'board' href= '<c:out value= "${board.bno}"/>'>
												<c:out value="${board.title}"></c:out></a></td>
												<td><c:out value="${board.writer}" /></td>
												<td><fmt:formatDate pattern="MM-dd HH:mm"
														value="${board.regdate}" /></td>
												<td><fmt:formatDate pattern="MM-dd HH:mm"
														value="${board.updatedate}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<form id='actionForm'>
									<input type='hidden' name='page' id='page' value='${pageObj.page}'>
									<input type='hidden' name='type' value='${pageObj.type}'>
									<input type='hidden' name='keyword' value='${pageObj.keyword}'>
								</form>

								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTables-example_paginate">
									<ul class="pagination">
										<c:if test="${pageObj.prev}">
											<li class="paginate_button previous"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_previous"><a href="${pageObj.start-1}">Previous</a></li>
										</c:if>
										<c:forEach begin="${pageObj.start}" end="${pageObj.end}"
											var="num">
											<li class="paginate_button " data-page="${num}"
												aria-controls="dataTables-example" tabindex="0"><a href="${num}"><c:out value="${num}" /></a></li>
										</c:forEach>
										<c:if test="${pageObj.next}">
											<li class="paginate_button next"
												aria-controls="dataTables-example" tabindex="0"
												id="dataTables-example_next"><a href="${pageObj.end+1}">Next</a></li>
										</c:if>
									</ul>
								</div>
								
								<select name="type">
									<option <c:out value="${pageObj.type == null?'selected':''}"/>>- - - - -</option>
									<option value="t" <c:out value="${pageObj.type == 't'?'selected':''}"/>>TITLE</option>
									<option value="c" <c:out value="${pageObj.type == 'c'?'selected':''}"/>>CONTENT</option>
									<option value="w" <c:out value="${pageObj.type == 'w'?'selected':''}"/>>WRITER</option>
									<option value="tc" <c:out value="${pageObj.type == 'tc'?'selected':''}"/>>TITLE+CONTENT</option>
									<option value="tw" <c:out value="${pageObj.type == 'tw'?'selected':''}"/>>TITLE+WRITER</option>
									<option value="tcw" <c:out value="${pageObj.type == 'tcw'?'selected':''}"/>>TITLE+CONTENT+WRITER</option>								
								</select>
								<input type="text" id="keyword" value="${pageObj.keyword}">
								<button id="searchBtn" class="btn btn-outline btn-info">FIND</button>
								
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-6 -->
			</div>

<!-- /.row -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<%@include file="../includes/footer.jsp"%>

<script>
	
$(document).ready(function() {
    
	  var actionForm = $("#actionForm");
    var pageNum = ${pageObj.page};
    $('.board').on("click",function(e){
  	  e.preventDefault();
  	  var bno = $(this).attr("href");
  	  actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");
  	  actionForm.attr("action","/board/read").attr("method","get").submit();
    });
    
    $('.pagination li[data-page='+pageNum+']').addClass("active");
    
    $('.pagination li a').on("click",function(e){
  	 
  	  e.preventDefault();
  	  var target = $(this).attr("href");
  	  
  	  $("#page").val(target);
  	  actionForm.attr("action","/board/list").attr("method","get").submit();
  	  
    });
    
	$("#searchBtn").on("click",function(e){
			
			var typeValue = $("select[name='type'] option:selected").val();
			var keyWord = $("#keyword").val();
			
			actionForm.attr("action","/board/list");
			actionForm.find("input[name='type']").val(typeValue);
			actionForm.find("input[name='keyword']").val(keyWord);
			$("#page").val(1);
			actionForm.submit();
			
		});
    
    var msg = $("#myModal");

    var result = '<c:out value="${result }"/>';
    
    checkModal(result);
    
    history.replaceState({},null,null);
    
    function checkModal(result){
    	if(result === '' || history.state){
			return;
		}
		if(result === 'SUCCESS'){
			msg.modal("show");
			$(".modal-body").html("작업성공");
		}
    }
    

 });
	
	</script>

</body>

</html>