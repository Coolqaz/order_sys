<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="panel shadow">
	<div class="panel-heading">
	
		<h3 class="panel-title">
		<s:if test="order_type==0">��������</s:if>
		<s:else>���ڶ���</s:else>
		</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>��Ʒ��</th>
					<th>�۸�</th>
					<th>��ע</th>
					<th>�̼�</th>
					<th>�̼ҵ�ַ</th>
					<th>�̼���ϵ��ʽ</th>
					<th>״̬</th>
					<th></th>
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
								value="#order.shop.name" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.shop.address" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#order.shop.phoneNum" /></td>
						<td style="vertical-align: middle;"><span style="color:green;">�ѽӵ�</span></td>
						<td style="vertical-align: middle;">
							<button class="btn btn-success" onclick="updateOrderStatus(event,<s:property value='#order.id'/>,99)">ȷ���ʹ�</button>
						</td>
						<td style="vertical-align: middle;">
							<button class="btn btn-danger" onclick="backOrder(event,<s:property value="#order.shop.id"/>,<s:property value='#order.id'/>,<s:property value="#order.type"/>)">�˵�</button>
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>