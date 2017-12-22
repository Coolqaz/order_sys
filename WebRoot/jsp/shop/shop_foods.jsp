<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">��Ʒ</h3>
	</div>
	<button class="btn btn-primary" style="float: right; margin-right: 5%"
		data-toggle="modal" data-target="#foodModal">��Ӳ�Ʒ</button>
	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>��Ʒ��</th>
					<th>����</th>
					<th>�۸�</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody id="foodTable">
				<s:iterator value="shop.foods" var="food">
					<tr>
						<td style="vertical-align: middle;"><img
							src='<s:property value="#food.imgSrc"/>' width="64" height="64" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#food.name" /></td>
						<td
							style="vertical-align: middle;word-wrap:break-word;word-break:break-all;width:25%;"
							><s:property value="#food.description" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#food.price" />Ԫ</td>
						<td style="vertical-align: middle;"><button
								class="btn btn-primary" onclick="foodUpdateInput(<s:property value='#food.id'/>)">�޸�</button></td>
						<td style="vertical-align: middle;"><button
								class="btn btn-danger" onclick="deleteFood(event,<s:property value='#food.id'/>)">ɾ��</button></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
<div class="modal fade" id="foodModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<form method="post" id="foodForm" enctype="multipart/form-data" onsubmit="return addFood()">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">��Ӳ�Ʒ</h4>
			</div>
			<div class="modal-body">
				
					<img src="assets/img/favicon.png" id="foodPreview" width="128px"
						height="128px" />
					<div class="form-group">

						<input type="file" name="img" accept="image/jpeg" id="imgSrc"
							tabindex="-1"
							style="position: absolute; clip: rect(0px 0px 0px 0px);" required="required">
						<div class="bootstrap-filestyle input-group">
							<span class="group-span-filestyle " tabindex="0"><label
								for="imgSrc" style="margin-bottom: 0;" class="btn btn-primary "><span
									class="oi oi-folder"></span> <span class="buttonText">ѡ��ͼƬ</span></label>
							</span>
						</div>
					</div>
					��Ʒ��:<input name="food.name" type="text" class="form-control"
						placeholder=""> <br /> �۸�:
					<div class="input-group">
						<span class="input-group-addon">$</span><input name="food.price"
							type="number" class="form-control" /><span
							class="input-group-addon">Ԫ</span>
					</div>
					<br> ����:
					<textarea rows="3" name="food.description" class="form-control"></textarea>
					<br>
				
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-primary" value="���">
				<button id="closeFoodBtn" type="button" class="btn btn-default" data-dismiss="modal">�ر�
				</button>

			</div>
		</form>
		</div>

		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
	
	
</div>
<script type="text/javascript">
	$("#imgSrc").change(function() {
		var objUrl = getObjectURL(this.files[0]);
		if (objUrl) {
			$("#foodPreview").attr("src", objUrl);
		}
	});
</script>
