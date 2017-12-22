/**
 * 
 */


function login(){
	$("#loginBtn").attr("disabled","disabled");
	$.ajax({
		url:'login_rootLogin.action',
		type:'post',
		async:true,
		data:{
			'root.username':$("#root_user").val(),
			'root.password':$("#root_psw").val()
		},
		success:function(res){
			var code = res['code'];
			switch(code){
			case -1:
				alert("�������!");
				break;
			case 0:
				alert("�˺Ŵ���!");
				break;
			default:location.href="root-manager.html";break;
			}
			$("#loginBtn").removeAttr("disabled");
		}
	});
	return false;
	
}

function modifyPsw(){
	$.ajax({
		url:'module/modifyPsw.jsp?'+Math.random(),
		type:'get',
		async: false,
		success:function(res){
			$("#main").html(res);
			$("#modifyPswForm").submit(function(){
				var oldPsw = $("#oldPsw").val();
				var newPsw = $("#newPsw").val();
				var newPswAgain = $("#newPswAgain").val();
				if(newPsw!=newPswAgain){
					alert("������������벻һ��!");
					return false;
				}
				$.ajax({
					url:'root_modifyPsw.action',
					type:'post',
					async:true,
					data:{
						'root.password':oldPsw+","+newPsw,
					},
					success:function(res){
						console.log(res);
						if(res['code']==1){
							alert("�޸ĳɹ�!");
						}else{
							alert("�޸�ʧ�ܣ�ԭ�������!");
						}
					}
					
				});
				
				return false;
			});
		},
		error:function(res){
			console.log(res);
		}
	
	});
}

//�鿴δע�����
function getShopUnRgi(){
	$.ajax({
		url:'shop_queryAllUnRegi.action',
		type:'get',
		async:true,
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			console.log(res);
		}
		
	});
}
//��ȡ��ע�����
function getShopRig(){
	$.ajax({
		url:'shop_queryAllRegi.action',
		type:'get',
		async:true,
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			console.log(res);
		}
		
	});
}

function getCustomers(){
	$.ajax({
		url:'customer_queryAll.action',
		type:'get',
		async:true,
		success:function(res){
			$("#main").html(res);
		}
	});
}

function updateShopStatus(e,shop_id,status){
	if(!confirm("ȷ�ϸò�������ͨ��?")) return;
	var theEvent = window.event|| e;
	$.ajax({
		url:'shop_updateStatus.action',
		type:'get',
		async:false,
		data:{
			'shop.id':shop_id,
			'status':status,
		},
		success:function(res){
			alert("success");
			$(theEvent.target).attr("disabled","disabled");
			$(theEvent.target).html("��ͨ������");
		},
		error:function(res){
			console.log(res);
		}
	});
	
}
