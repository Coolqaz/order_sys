<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="panel shadow">
	<div class="panel-heading">
		<h3 class="panel-title">����ɵ�<s:if test="order_type==0">��������</s:if>
		<s:else>���ڶ���</s:else></h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>��Ʒ��</th>
					<th>�۸�</th>
					<th>��ע</th>
					<th>ʱ��</th>
					<th>�̼�</th>
					<th>�̼ҵ�ַ</th>
					<th>�̼���ϵ��ʽ</th>
					<th>״̬</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="orderTable">
				<s:iterator value="customer.orders" var="order">
					<tr>
						<td style="vertical-align: middle;"><img
							src='<s:property value="#order.food.imgSrc"/>' width="64" height="64" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.food.name" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.food.price"/>Ԫ</td>
						
						<td style="vertical-align: middle;">
							<p style="word-break:break-all; width: 120px;">
								<s:property value="#order.remarks"/>
							</p>
						</td>
						<td style="vertical-align: middle;"><s:property
								value="#order.orderTime"/></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.shop.name" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.shop.address" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.shop.phoneNum" /></td>
						<td style="vertical-align: middle;"><span style="color:green;">���ʹ�</span></td>
						<td style="vertical-align: middle;">
							<s:if test="#order.status==100"><button class="btn" disabled>������</s:if>
								<s:else>
								<button class="btn btn-info" onclick="comment(event,<s:property value="#order.id"/>,<s:property value="#order.food.id"/>)" >�������۰�~</button>
								</s:else>

						</td>
						
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>
<!-- ����modal��-c -->
<div>
	<div class="modal fade" id="commentModal" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">����</h4>
				</div>
				<select id="selectComment" class="form-control" onchange="changeComment()">
					<option value="����" selected>����</option>
					<option value="����">����</option>
					<option value="����">����</option>
				</select>
				<textarea rows="5" cols="" class="form-control col-md-8" id="content">�óԺó�~</textarea>
					<div class="modal-footer">
						<button id="commentBtn" class="btn btn-info">����</button>
						<button id="closeCommentBtn" type="button"
								class="btn btn-default" data-dismiss="modal">�ر�</button>

					</div>
				</form>
			</div>

			<!-- /.modal-content -->
		</div>
	</div>

</div>