$(document).ready(function(){
	list();
});

//Listar Funcionários
function list(){
	i = 0;
	$.ajax({
		url: 'http://localhost:8080/api/public/employees',
		dataType: 'JSON',
		type: 'GET',
		success: function(data){
			$('.list > table > tbody').html('');
			//console.log(data);
			for( x in data ){
				if(i < data.length){
					tr = "<tr>";
					tr +=	"<td>"+data[i].firstname_func+" "+data[i].lastname_func+"</td>";
					tr +=	"<td>"+data[i].cellphone_func+"</td>";
					tr +=	"<td>"+data[i].mail_func+"</td>";
					tr +=	"<td><i class='fa fa-trash' aria-hidden='true' title='Deletar Funcionário' onclick='deleteEmp("+data[i].id_func+")'></i> <i class='fa fa-pencil' aria-hidden='true' title='Editar Funcionario' onclick='editEmp("+data[i].id_func+")'></i></td>";
					tr +="</tr>";
					$('.list > table > tbody').append(tr);
					i++;
				}
			}
		},
		error: function(data){
			console.log(data);
		}
	});
}

//Criar Funcionário
function addEmpAct(){
	var emp = $(".emp").serialize();
	console.log(emp);
	$.ajax({
		url: 'http://localhost:8080/api/public/employees/new',
		data: {emp:emp},
		dataType: 'JSON',
		type: 'POST',
		success: function(data){
			list();
		},
		error: function(data){
			console.log(data);
		},
		complete: function(){
			$(".emp input").val('');
			cancelAct();
		}
	});
}

//Deletar Funcionário
function deleteEmp(id){
	i = 0;
	$.ajax({
		url: 'http://localhost:8080/api/public/employees/delete',
		data: {id:id},
		dataType: 'JSON',
		type: 'POST',
		success: function(data){
			list();
		},
		error: function(data){
			console.log(data);
		}
	});
}

//Atualizar Funcionário
function editEmp(id){
	i = 0;
	$.ajax({
		url: 'http://localhost:8080/api/public/employees/getemp',
		data: {id:id},
		dataType: 'JSON',
		type: 'POST',
		success: function(data){
			editEmpMd(data);
		},
		error: function(data){
			console.log(data);
		}
	});
}
function editEmpAct(id){
	var emp = $(".emp").serialize();
	console.log(emp);
	$.ajax({
		url: 'http://localhost:8080/api/public/employees/edit',
		data: {id:id,emp:emp},
		dataType: 'JSON',
		type: 'POST',
		success: function(data){
			list();
		},
		error: function(data){
			console.log(data);
		},
		complete: function(){
			$(".emp input").val('');
			cancelAct();
		}
	});
	
}

//Helpers
var SPMaskBehavior = function (val) {
	return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
  },
  spOptions = {
	onKeyPress: function(val, e, field, options) {
		field.mask(SPMaskBehavior.apply({}, arguments), options);
	}
};
$('#zipcode').mask('00000-000');
$('#phone').mask('(00) 0000-0000');
$('#cellphone').mask(SPMaskBehavior, spOptions);

function addEmp(){
	$('.list').slideUp(800,'easeInOutExpo');
	$('.form').slideDown(800,'easeInOutExpo');
	$('.form #actBt').attr('onclick','addEmpAct()');
}
function cancelAct(){
	$('.form').slideUp(800,'easeInOutExpo');
	$('.list').slideDown(800,'easeInOutExpo');
}
function editEmpMd(data){

	$('.form #firstname').val(data.firstname_func);
	$('.form #lastname').val(data.lastname_func);
	$('.form #mail').val(data.mail_func);
	$('.form #address').val(data.address_func);
	$('.form #number').val(data.number_func);
	$('.form #complement').val(data.complement_func);
	$('.form #district').val(data.district_func);
	$('.form #city').val(data.city_func);
	$('.form #state').val(data.state_func);
	$('.form #zipcode').val(data.zipcode_func);
	$('.form #phone').val(data.phone_func);
	$('.form #cellphone').val(data.cellphone_func);

	$('.list').slideUp(800,'easeInOutExpo');
	$('.form').slideDown(800,'easeInOutExpo');
	$('.form #actBt').attr('onclick','editEmpAct('+data.id_func+')');
}

$('input#zipcode').focusout(function(){
	
	var cep = $(this).val();

	console.log(cep);

	$.ajax({
		url:"http://apps.widenet.com.br/busca-cep/api/cep.json",
		type:'GET',
		data:{code:cep},
		dataType:'json',
		beforeSend:function(){
			$('input#address').val('Carregando...');
			$('input#district').val('Carregando...');
			$('input#city').val('Carregando...');
			$('input#state').val('Carregando...');
		},
		success:function(json){
			$('input#address').val(json.address);
			$('input#district').val(json.district);
			$('input#city').val(json.city);
			$('input#state').val(json.state);
		},
		error:function(){
			$('input#address').val('');
			$('input#district').val('');
			$('input#city').val('');
			$('input#state').val('');
		}
	});

});