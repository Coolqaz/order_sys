<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<div class="panel bg bg-blur" style="margin-top: 24px;border-radius:20px;">
	<div class="panel-heading">
		<input type="text" class="input-lg" id="search_shop" placeholder="�����̵�"><button onclick="searchShop()" class="btn btn-info">����</button>
		<input type="text" class="input-lg" id="search_food" placeholder="����ʳ��"><button onclick="searchFood()" class="btn btn-info">����</button>
	</div>
	<div class="panel-body">
	<s:iterator value="shops" var="shop">
		<div class="box box-content">
			<img src='<s:property value="#shop.imgSrc"/>'><br />
			<s:property value="#shop.name"/><br />
			<p class="p-word">���:<s:property value="#shop.description"/></p>
			<button onclick="openShop(<s:property value='#shop.id'/>)" class="btn btn-primary">������</button>
		</div>
	</s:iterator>
	<hr>
	</div>
	
</div>