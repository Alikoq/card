<html>
	<head>
		<title>ddd</title>
		<meta name="viewport" content="width=device-width" />
	</head>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="jquery-1.12.0.min.js"></script>
    <script src="jquery.autotab.js"></script> 

   

	<body>
		<div class="wrapper">
			<div class="container">
				<form   action="success.html" method="post" autocomplete="off">
					<div class="container-item">
						<span class="info-text"> </span>
						 <div class="cards-holder">

						 	<div class="card1">
						 		<span class="numb-text">Номер карты</span>
						 		<input class="inputs" oninput="check(this,'octet1')" name="first"  id="octet1" type = "text"  maxlength = "4" autocomplete="off" placeholder="xxxx"/>
						 		<input class="inputs" oninput="check(this,'octet2')" name="second" id="octet2"  type = "text"  maxlength = "4" autocomplete="off" type="text" placeholder="xxxx"/>
						 		<input class="inputs" oninput="check(this,'octet3')" name="third"  id="octet3" type = "text"  maxlength = "4" autocomplete="off" type="text" placeholder="xxxx"/>
						 		<input class="inputs" oninput="check(this,'octet4')" name="fourth" id="octet4"  type = "text"  maxlength = "4" autocomplete="off" type="text" placeholder="xxxx"/>
						 		<input type="hidden" id="pan" name="pan"/>
						 	    <input type="hidden" name="id" value="{id}"/>
						 		<input type="hidden" name="holder" value="Mr.CardHolder"/>

						 	</br>
						 		<span class="numb-text2">Срок действия: </span>
						 		<select id="yy" class="inputs2" name="year" style=" margin-right: 16px;">
						 			<option value="0">yy</option>
						 			<option value="16">16</option>
					                <option value="17">17</option>
					                <option value="18">18</option>
					                <option value="19">19</option>
					                <option value="20">20</option>
					                <option value="21">21</option>
					                <option value="22">22</option>
					                <option value="23">23</option>
					                <option value="24">24</option>
					                <option value="25/">25</option>
						 		</select>
						 		<select id="mm" class="inputs2" name="month">
						 			<option value="0">mm</option>
									<option value="01">01</option>
					                <option value="02">02</option>
					                <option value="03">03</option>
					                <option value="04">04</option>
					                <option value="05">05</option>
					                <option value="06">06</option>
					                <option value="07">07</option>
					                <option value="08">08</option>
					                <option value="09">09</option>
					                <option value="10">10</option>
					                <option value="11">11</option>
					                <option value="12">12</option>
						 		</select>  
						 		

						 	</div>
						 	<div class="card2">
						 		<div class="line-orange"></div>
						 		<div class="line-gray"><span class="numb-text3">Введите код  CVV/CVC2: </span>
									<input class="inputs3" name="csc" id="csc"  type="text" maxlength="3" placeholder="csc">
						 		</div> 
						 		<p>последние 3 цифры на обратной стороне карты</p>
						 	</div>
						 	<div id="for-scan" class="for-scan hide"  >
						 		<button onclick=" callScanner();return false;">Сканировать</button> 
						 	</div>
						 	<div id="error_field">
						 		
						 	</div>
						 	<div id="error_field2">
						 		
						 	</div>
							<span class="info-text">Для добавления карты с баланса спишется и вернется   0,10 AZN. </span>
						 </div>
					</div>
					<div class="input-act">
					 	<input class="enabled_btn" type="submit" disabled="" value="Продолжить">
				    </div>
			    </form>
			</div>
		</div>
	</body>

	<script>
    	//showScannerButton(true);
    	function callScanner(){
    	 	window.location.href="./scanSourceCard";
    	 }

    	 function showScannerButton(visible){
    	 	var for_scan = document.getElementById('for-scan').classList;
    	 	if(visible==true){
    	 		if(for_scan.contains("hide")){
    	 			for_scan.remove("hide");
    	 			for_scan.add("show");
    	 		}
    	 		 
    	 	}else{
    	 		if(for_scan.contains("show")){
    	 			for_scan.remove("show");
    	 			for_scan.add("hide");
    	 		}
    	 	}
    	 }

    	 
    	 // fillSourceCardData("0123456789123456","08","20");

    	 function fillSourceCardData(cardNumber,expMonth,expYear){
    	 	 	var cardNumberArr= cardNumber.split('');
    	 	 	var createdArr =[];
    	 	 	var leng;
    	 	 	var count=0;
    	 	 	for(var i=0;i<cardNumber.length; i+=4){
    	 	 	   createdArr.push(cardNumber.substr(i,4))
    	 	 	}
    	 	 	createdArr.join();
    	 	 	 
  
  				 $("#mm ").val(expMonth);
  				 $("#yy").val(expYear);


    	 	 	 $("#octet1").val(createdArr[0]);
		    	 $("#octet2").val(createdArr[1]);
		       	 $("#octet3").val(createdArr[2]);
		      	 $("#octet4").val(createdArr[3]);

		      	 $("#pan").val(
		      	 		$("#octet1").val()+
		    	 	 	$("#octet2").val()+
		    	 	 	$("#octet3").val()+
		    	 	 	$("#octet4").val()
		      	 	)
		      	  
    	 }


    	 $(document).ready(function(){
	
	alert('ade')
				$("#octet1").keyup(function(){
					alert('a');
					 
				})
    	 	 	$("#octet4").keyup(function(){
    	 	 		$("#pan").val(
	    	 	 		$("#octet1").val()+
		    	 	 	$("#octet2").val()+
		    	 	 	$("#octet3").val()+
		    	 	 	$("#octet4").val()
    	 	 		);

						if($("#pan").val().length!=16){
    	 	 				//$("#error_field").text("Пожалуйста, заполните все поля")
    	 	 				$(':input[type="submit"]').prop('disabled',true);
    	 	 	 	   		 $(':input[type="submit"]').css('background-color','gray')

    	 	 	 	   }
    	 	 	 	   else{

    	 	 	 	    	$("#error_field").text("")
    	 	 	 	   		 $(':input[type="submit"]').prop('disabled',true);
    	 	 	 	   		  $(':input[type="submit"]').css('background-color','gray')
    	 	 	 	   }
    	 	 	    
    	 	 	})

    	 	 	$("#csc").keyup(function(){
    	 	 		if($(this).val().length==3){
						if($("#pan").val().length!=16){
    	 	 				$("#error_field").text("Пожалуйста, заполните все поля")
    	 	 				$(':input[type="submit"]').prop('disabled',true);
    	 	 	 	   		 $(':input[type="submit"]').css('background-color','gray')

    	 	 	 	   }else{
    	 	 	 	   	$("#error_field").text("")
    	 	 	 	   		 $(':input[type="submit"]').prop('disabled',false);
    	 	 	 	   		 $(':input[type="submit"]').css('background-color','#f18901')
    	 	 	 	   }
    	 	 	   }else{
    	 	 	   	$("#error_field").text("Пожалуйста, заполните все поля")
    	 	 				$(':input[type="submit"]').prop('disabled',true);
    	 	 	 	   		 $(':input[type="submit"]').css('background-color','gray')
    	 	 	   }
    	 	 		
    	 	 	})
    	 	 	
    	 })

    </script>
	   <script type="text/javascript">


        $(function () {
                $(".inputs").keyup(function () {
                    if (this.value.length === this.maxLength) {
                        $(this).next('.inputs').focus();
                    }
                });
            });

            $(function () {
                $(".inputs").keyup(function () {
                    if (this.value.length === 0) {
                        $(this).prev('.inputs').focus();
                    }
                });
            });  

            function check(obj, id) {
                var reg = new RegExp('^[0-9]+$');
                str = obj.value;
                temp = str;
                str = str.substr(str.length - 1, str.length);
                var firstIndex = temp.indexOf(str);
                if (!reg.test(str)) {
                    document.getElementById(id).value = temp.substr(0, firstIndex);
                }
            }


          


        </script>
 
</html>
 
