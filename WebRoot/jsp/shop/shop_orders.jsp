<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">����</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>��Ʒ��</th>
					<th>����</th>
					<th>�۸�</th>
					<th>�˿�����</th>
					<th>�˿���ϵ��ʽ</th>
					<th>״̬</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="foodTable">
				<s:iterator value="shop.ordeers" var="order">
					<tr>
						<td style="vertical-align: middle;"><img
							src='<s:property value="#order.food.imgSrc"/>' width="64" height="64" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.food.name" /></td>
						<td
							style="vertical-align: middle;word-wrap:break-word;word-break:break-all;"
							width="25%"><s:property value="#order.food.description" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.food.price" />Ԫ</td>
						<td style="vertical-align: middle;"><s:property
								value="#order.customer.name" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.customer.phoneNum" /></td>
						<td style="vertical-align: middle;"><button
								class="btn btn-primary" onclick="">�޸�</button></td>
						
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>