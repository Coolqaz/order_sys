<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<div class="modal fade" id="foodToOrderModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">�µ�</h4>
			</div>
			<form id="foodToOrderForm"
					enctype="multipart/form-data" onsubmit="return placeOrder(<s:property value='food.id'/>,<s:property value='msg'/>)">
			<div class="modal-body">

					<img src="<s:property value='food.imgSrc'/>" 
						width="128px" height="128px" />
					<br>
					<h3><s:property value="food.name"/></h3> <br /> �۸�:
					<div class="input-group">
						<span class="input-group-addon">$</span><input name="food.price"
							type="number" class="form-control"
							value='<s:property value="food.price"/>' disabled="disabled" /><span
							class="input-group-addon">Ԫ</span>
					</div>
					<br>
					<p style="word-break:break-all;">
					����:<s:property value="food.description" />
					</p>
										
					<div class="input-group col-sm-12">
					ѡ�񶩵�����:
					<br>
					<input type="radio" name="orderType" value="0" checked="checked">��������
					<input type="radio" name="orderType" value="1">���ڶ���
						<select name="insideOrderType" id="insideOrderType" >
							<option value="��ʱȡ��">
							��ʱȡ��
							</option>
							<option value="���">
							���
							</option>
						</select>
						<p style="color: red;word-break:break-all;">
							&nbsp;&nbsp;*���ڶ���ʱ��ѡ������ʱȡ��
						</p>
					</div>
					<div class="input-group col-sm-12">
						��ע:<textarea class="form-control" id="orderRemarks"></textarea>
					</div>
					<br>
				
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-primary" value="�µ�"/>
				<button id="closeFoodToOrderBtn" type="button"
					class="btn btn-default" data-dismiss="modal">�ر�</button>

			</div>
			</form>
		</div>

		<!-- /.modal-content -->
	</div>
</div>
