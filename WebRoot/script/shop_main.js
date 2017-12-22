/**
 * 
 */
function searchFood(){
    var key=$("#search_food").val();
    $.ajax({
        type:'get',
        url:'food_queryByKey.action',
        data:{
            'msg':key,
            'shop_id':-1,
        },
        success:function(res){
            $("##main").html(res);
        },
        error:function(res){
            console.log(res);
        }
    });
}

function initTrunover(recentDay){
	var day = recentDay;
    $.ajax({
        type:'get',
        url:'jsp/shop/shop_queryTurnover.html?t='+Math.random(),
        success:function(res){
            $("#main").html(res);
            $.ajax({
                type:'post',
                url:'shop_queryTurnover.action',
                data:{
                    'recentDay':day
                },
                success:function(res){

                    $("#turnoverTable").html(res);
                },
                error:function(res){
                    console.log(res);
                }
            });
        },
        error:function(res){
            console.log(res);
        }
    });
}

function turnover(type){
	var day = $("#daySelect option:selected").val();
	console.log(day);
	$.ajax({
		type:'post',
		url:'shop_queryTurnover.action',
		data:{
			'recentDay':day
		},
		success:function(res){
			$("#turnoverTable").html(res);
		},
		error:function(res){
			console.log(res);
		}
	});
}

function response(e,comment_id){
	var theEvent = Window.Event||e;
	$("#responseBtn").one("click",function(){
		$.ajax({
			type:'post',
			url:'comment_response.action',
			data:{
				'comment.id':comment_id,
				'comment.response':$("#content").val(),
			},
			success:function(res){
				console.log(res);
				$(theEvent.target).attr("disabled","disabled");
				$(theEvent.target).html("�ѻظ�");
				$("#closeResponseBtn").click();
			}

		});
	});
	$("#responseModal").modal();
}

function getComment(){
	$.ajax({
		type:'get',
		url:'comment_queryForShop.action',
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			console.log(res);
		}
	});
}



function login() {
	$.ajax(
		{
			type : "post",
			url : "login_shopLogin.action",
			data : {
				'shop.phoneNum' : $("#signin-phone").val(),
				'shop.password' : $("#signin-password").val()
			},
			success : function(res) {
				console.log(res);
				var status = res['status'];
				switch (status) {
				case 0:
					alert("�˺Ų����ڣ����������˺ţ�");
					break;
				case -1:
					alert("�������!");
					break;
				case -2:
					alert("�����˺���δͨ����ˣ������ĵȴ�����Ա���ͨ��!");
					break;
				default:
					location.href = "shopManager.html";
				}
			}
		});
	return false;
}

function logout(){
	$.ajax(
		{
			type:'get',
			url:'login_shopLogout.action',
			success:function(){
				location.href="shop-login.html";
			}
		}
			
	);
}

function modifyPsw(){
	$.ajax({
		url:'module/modifyPsw.jsp?t='+Math.random(),
		type:'get',
		async:true,
		success:function(res){
			$("#main").html(res);
			$("#modifyPswForm").submit(function(){
				
				var $oldPsw = $("#oldPsw").val();
				var $newPsw = $("#newPsw").val();
				var $newPswAgain = $("#newPswAgain").val();
				
				if($newPsw!=$newPswAgain){
					alert("������������벻һ��!");
					return false;
				}
				
				$.ajax({
					url:'shop_modifyPsw.action',
					type:'get',
					data:{
						'shop.password':$oldPsw+","+$newPsw,
					},
					async:true,
					success:function(res){
						if(res['code']==1){
							alert("�޸ĳɹ�,���μ�����������!");
							$("#oldPsw").val("");
							$("#newPsw").val("");
							$("#newPswAgain").val("");
						}else{
							alert("�޸�ʧ��,ԭ�������!");
						}
					}
				});
				
				return false;
			});
		},
	});
}

function checkPhoneNum() {
	$.ajax(
		{
			type : 'get',
			url : 'shop_checkPhoneNum.action',
			data : {
				'shop.phoneNum' : $("#register-phoneNum").val()
			},
			success : function(res) {
				var code = res['code'];
				if (code == 0) {
					$("#phoneCheck").html("<span style='color:red;'><i class='fa fa-times-circle'></i>�����ѱ�����</span>");
				}
				else {
					$("#phoneCheck").html("<span style='color:green;'><i class='fa fa-check-circle'></i>����</span>");
				}
			},
			error : function(res) {
				$("#error").html(res);
			}
		}
	);
}

function get() {
	$.ajax({
		type : 'get',
		url : 'shop_query.action',
		success : function(res) {
			$("#shopImg").attr("src", res['shop_imgSrc']);
			$("#shopName").html(res['shop_name']);
			openTheGay(1);
            if('WebSocket' in window){
                websocket = new WebSocket("ws://localhost:8080/informSocket/"+res['shop_id']+"/2");
            }else{
                alert("�����������֧��websocket,��ʹ��֧��HTML5�������,��ȸ������");
            }
            websocket.onopen = function(){
                console.log("���ӳɹ�!");
            }

            websocket.onmessage = function(message){

                $("#msgInform").attr("data-content",message.data);
                $("#msgInform").popover('show');
            }

            websocket.onclose = function(){}

            websocket.onerror = function(){
                console.log("���Ӵ���!");
            }
            window.onbeforeunload = function(){
                websocket.close();
            }
		},
		error : function(res) {
			$("#main").html(res);

		}
	});
}
function openTheGay(status){
	$.ajax({
		type:'post',
		url:'shop_updateOpen.action',
		data:{
			'shop.open':status,
		},
		success:function(res){
			switch(status){
				case 0:$("#openMsg").html("�ѹص�");break;
				case 1:$("#openMsg").html("Ӫҵ��");break;
			}
		}
	});
}

function informCustomer(customer_id,type){
	var message;
	if(type==0){
		message = "�����������������,����С��������,�����������ֻ����Ż�绰!"
	}else{
		message = "���ĵ��ڶ��������,�뼰ʱ��������ȡ!"
	}
	var obj = {
		to:customer_id,
		toType:1,
		message:message
	}
	sendMessage(obj);
}

function register() {
	var data = new FormData($("#registerForm")[0]);
	$.ajax({
		type : 'post',
		url : 'shop_register.action',
		async : true,
		cache : false,
		processData : false, // 
		contentType : false, //?????��??? 
		data : data,
		success : function(res) {
			var code = res['code'];
			if (code == 0) {
				alert("ע��ʧ��,����ϵͳ����Ա��ϵ!");
			}
			else {
				alert("ע��ɹ�,�����ĵȴ�����Ա���!");
				$("#closeRegisterBtn").click();
			}

		},
		error : function(res) {
			$("#error").html(res);
		}
	});
	return false;
}

function updateShop(){
	var data = new FormData($("#shopUpdateForm")[0]);
	$.ajax(
		{
			type:'post',
			url:'shop_update.action',
			async : false,
			cache : false,
			processData : false, // 
			contentType : false, //?????��??? 
			data : data,
			success : function(res) {
				console.log(res);
				$("#closeShopUpdateBtn").click();
				get();
			},
			error : function(res) {
				
			}
		}
	)
	return false;
}

function shopUpdateInput(){
	$.ajax({
		type : 'get',
		url : 'shop_updateInput.action',
		success : function(res) {
			$("#shopUpdateModalDiv").html(res);
			$("#shopUpdateModal").modal();
		},
		error : function() {
			$("#container").html(res);
		}
	}
	);
}

function getFoods() {
	$.ajax({
		type : 'get',
		url : 'shop_foods.action',
		success : function(res) {
			$("#main").html(res);
		},
		error : function() {
			$("#container").html(res);
		}
	});
}

function updateFood(){
	var data = new FormData($("#foodUpdateForm")[0]);
	$.ajax(
		{
			type:'post',
			url:'food_update.action',
			cache : false,
			processData : false, // 
			contentType : false, //?????��??? 
			data : data,
			success : function() {
				alert("���³ɹ�!");
				getFoods();
			},
			error : function(res) {
				alert(res);
			}
		}
	)
	return false;
}

function  foodUpdateInput(food_id){
	$.ajax(
		{
			type:'get',
			url:'food_updateInput.action',
			data:{
				'food.id':food_id,
			},
			success:function(res){
				$("#foodUpdateModalDiv").html(res);
				$("#foodUpdateModal").modal();
			},
			error:function(res){
				$("#main").html(res);
			}
		}
			
	);
}


function deleteFood(e,food_id){
	var theEvent = window.event||e;
	if(!confirm("ȷ��ɾ����ʳ��?"))
		return;
	$.ajax(
		{
			type:'get',
			url:'food_delete.action',
			data:{
				'food.id':food_id,
			},
			async:true,
			success:function(res){
				var code = res['code'];
				if(code==1){
					alert("ɾ���ɹ�");
					$(theEvent.target).attr("disabled","disabled");
					$(theEvent.target).html("��ɾ��");
				}else{
					alert("ɾ��ʧ��,����ϵͳ����Ա��ϵ!");
				}
			}
		}
	);
}
function accessOrder(e,customer_id,order_id){
    var theEvent = window.event|| e;
    if(!confirm("ȷ��?"))
        return;
    var is = 0;
    $.ajax({
        type:'get',
        url:'ordeer_updateStatus.action',
        async:false,
        data:{
            'ordeer.id':order_id,
            'ordeer.status':1
        },
        success:function(res){
            is = res['code'];
            alert(res['msg']);
            var obj = {
            	to:customer_id,
				toType:1,
				message:"�̼��ѽӵ�!",
			}
            sendMessage(obj);
        }
    });

    if(is==1){
        $(theEvent.target).closest("tr").remove();
    }
}

function getOrdersAccess(type){
	$.ajax({
		type:'get',
		url:'shop_ordersAccess.action',
		data:{
			order_type:type,
		},
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			$("#main").html(res);
		}
	});
}

function getOrdersBack(type){
	$.ajax({
		type:'get',
		url:'shop_ordersBack.action',
		data:{
			order_type:type,
		},
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			$("#main").html(res);
		}
	});
}

function getOrdersComplete(type){
	$.ajax({
		type:'get',
		url:'shop_ordersComplete.action',
		data:{
			order_type:type,
		},
		success:function(res){
			$("#main").html(res);
		},
		error:function(res){
			$("#main").html(res);
		}
	});
}

function getOrdersNot(type){
	$.ajax(
		{
			type:'get',
			url:'shop_ordersNot.action',
			data:{
				order_type:type,
			},
			success:function(res){
				$("#main").html(res);
			},
			error:function(res){
				$("#main").html(res);
			}
		}
	);
}

function addFood() {
	var data = new FormData($("#foodForm")[0]);
	$.ajax(
		{
			type : 'post',
			url : 'food_add.action',
			async : true,
			cache : false,
			processData : false, // 
			contentType : false, //?????��??? 
			data : data,
			success : function(res) {
				$("#foodTable").append(res);
				$("#closeFoodBtn").click();
			},
			error : function(res) {}
		});
	return false;
}