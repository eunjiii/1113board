<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">READ</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">BOARD READ</div>
			<!-- /.panel-heading -->
			<div class="panel-body">


					<div class="form-group">
						<label>BNO</label> <input class="form-control" name='bno' value='<c:out value="${board.bno}"></c:out>' readonly="readonly">
					</div>				
					<div class="form-group">
						<label>TITLE</label> <input class="form-control" name='title' value='<c:out value="${board.title}"></c:out>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>WRITER</label> <input class="form-control" name='writer' value='<c:out value="${board.writer}"></c:out>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>CONTNET</label>
						<textarea class="form-control" name='content' rows="3" readonly="readonly"><c:out value="${board.content}" ></c:out></textarea>
					</div>

					<form role="form" action="/board/list" method="get">
						<input type="hidden" name="page" value="${pageObj.page}">
						<button type="submit" class="btn btn-default">GO LIST</button>
					</form>
					<form role="form" action="/board/modify" method="get">
						<input type='hidden' name='bno' value="${board.bno}">
						<input type="hidden" name="page" value="${pageObj.page}">
						<button type="submit" class="btn btn-default">MODIFY</button>
					</form>
					
<!--  -->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-commemts fa-fw"></i>REPLY
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">NEW REPLY</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
			<ul class="chat">
				<li class="left clearfix" data-rno='12'>
				<div><div class="header"><strong class="primary-font">user00</strong>
						<small class="pull-right text-muted">2015-01-01 13:13</small></div>
					<p>GOOD JOB</p></div></li>
			</ul>
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
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>REPLY</label>
					<input class="form-control" name='reply' value='New Reply...'>
					</div>
					<div class="form-group">
					<label>REPLYER</label>
					<input class="form-control" name='replyer' value='replyer'>
					</div>
					<div class="form-group">
					<label>REPLY DATE</label>
					<input class="form-control" name='replyDate' value=''>
					</div>
			</div>
			
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">MODIFY</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">REMOVE</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-primary">REGISTER</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default">CLOSE</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<%@include file="../includes/footer.jsp"%>

<script type="text/javascript" src="/resources/js/reply.js?ver1"></script>


<script type="text/javascript">

$(document).ready(function() {

		console.log(replyService);
		
		console.log("===================");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		var replyUL = $(".chat");
		
		showList(1);
		
		function showList(page){
			replyService.getList({bno:bnoValue, page:page||1}, function(list){
				var str = "";
				if(list == null||list.length==0){
					replyUL.html("");
					return;
				}
				for(var i=0,len=list.length||0;i<len;i++){
					str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
					str += "  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
					str += "		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small><div>";
					str += "	<p>"+list[i].reply+"</p><div></li>";
				}
				replyUL.html(str);
			});
		}
		
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='reply']");
		var modalInputReplyer = modal.find("input[name='replyer']");
		var modalInputReplyDate = modal.find("input[name='replyDate']");
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click",function(e){
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		modalRegisterBtn.on("click", function(e){
		
			var reply = {
					reply: modalInputReply.val(),
					replyer:modalInputReplyer.val(),
					bno:bnoValue
			};
			replyService.add(reply, function(result){
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});
		
		modalModBtn.on("click", function(e){
			
			var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
			replyService.update(reply, function(result){
				
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			var rno = modal.data("rno");
			replyService.remove(rno, function(result){
				alert(result);
				modal.modal("hide");
				showList(1);
			});
		});
		
		$(".chat").on("click","li",function(e){
			var rno = $(this).data("rno");
			replyService.get(rno, function(reply){
				
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly");
				modal.data("rno",reply.rno);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
				
			});
			console.log(rno);
		});

	});
</script>



</body>

</html>







