<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div class="panel">
	<div class="panel-heading">
		<h3 class="panel-title">������Ĳ���</h3>
	</div>
	<div class="panel-body">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>#</th>
					<th>������</th>
					<th>��ϵ��ʽ</th>
					<th>��ַ</th>
					<th>֤����</th>
					<th>���</th>
				</tr>
			</thead>
			<tbody id="regitable">
				<s:iterator value="shops" var="shop">
					<tr>
						<td style="vertical-align: middle;"><img
							src='<s:property value="#shop.imgSrc"/>' width="64" height="64" /></td>
						<td style="vertical-align: middle;"><s:property
								value="#shop.name" /></td>
						<td
							style="vertical-align: middle;word-wrap:break-word;word-break:break-all;width:25%;"
							><s:property value="#shop.phoneNum" /></td>
						
						<td style="vertical-align: middle;"><s:property value="#shop.address" /></td>
						<td style="vertical-align: middle;"><s:property value="#shop.idcard" /></td>
						<td style="vertical-align: middle;"><p style="word-break:break-all;">
							<s:property value="#shop.description"/>
						</p></td>
						
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</div>

