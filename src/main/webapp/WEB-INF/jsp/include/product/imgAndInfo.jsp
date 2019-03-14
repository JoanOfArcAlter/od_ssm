<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>


<script>

$(function(){
	var stock = ${p.stock};
	$(".productNumberSetting").keyup(function(){
		var num= $(".productNumberSetting").val();
		num = parseInt(num);
		if(isNaN(num))
			num= 1;
		if(num<=0)
			num = 1;
		if(num>stock)
			num = stock;
		$(".productNumberSetting").val(num);
	});
	
	$(".increaseNumber").click(function(){
		var num= $(".productNumberSetting").val();
		num++;
		if(num>stock)
			num = stock;
		$(".productNumberSetting").val(num);
	});
	$(".decreaseNumber").click(function(){
		var num= $(".productNumberSetting").val();
		--num;
		if(num<=0)
			num=1;
		$(".productNumberSetting").val(num);
	});
	
	$(".addCartLink").click(function(){
		var page = "forecheckLogin";
		$.get(
	            page,
	            function(result){
	            	if("success"==result){
	            		var pid = ${p.id};
	            		var num= $(".productNumberSetting").val();
	            		var addCartpage = "foreaddCart";
	            		$.get(
	            				addCartpage,
	            	            {"pid":pid,"num":num},
	            	            function(result){
	            	            	if("success"==result){
	            	            		$(".addCartButton").html("已加入购物车");
	            	            		$(".addCartButton").attr("disabled","disabled");
	            	            		$(".addCartButton").css("background-color","lightgray")
	            	            		$(".addCartButton").css("border-color","lightgray")
	            	            		$(".addCartButton").css("color","black")
	            	            		
	            	            	}
	            	            	else{
	            	            		
	            	            	}
	            	            }
	            		);		            		
	            	}
	            	else{
						$("#loginModal").modal('show');	            		
	            	}
	            }
		);		
		return false;
	});
	$(".buyLink").click(function(){
		var page = "forecheckLogin";
		$.get(
	            page,
	            function(result){
	            	if("success"==result){
	            		var num = $(".productNumberSetting").val();
	            		location.href= $(".buyLink").attr("href")+"&num="+num;
	            	}
	            	else{
						$("#loginModal").modal('show');	            		
	            	}
	            }
		);		
		return false;
	});
	
	$("button.loginSubmitButton").click(function(){
		var name = $("#name").val();
		var password = $("#password").val();
		
		if(0==name.length||0==password.length){
			$("span.errorMessage").html("请输入账号密码");
			$("div.loginErrorMessageDiv").show();			
			return false;
		}
		
		var page = "foreloginAjax";
		$.get(
	            page,
	            {"name":name,"password":password},
	            function(result){
	            	if("success"==result){
	            		location.reload();
	            	}
	            	else{
	            		$("span.errorMessage").html("账号密码错误");
	            		$("div.loginErrorMessageDiv").show();	            		
	            	}
	            }
		);			
		
		return true;
	});
	var initBigImg = false;
	$("img.smallImage").mouseenter(function(){
        var bigImageURL = $(this).attr("bigImageURL");
        $("img.bigImg").attr("src",bigImageURL);
        $("img.smallImage").each(function () {
           $(this).css('border-color', 'white');
         });
         $(this).css('border-color', 'black');
	});
	
    $("img.bigImg").load(
            function(){
                if(initBigImg)
                    return;
                $("img.smallImage").each(function(){
                    var bigImageURL = $(this).attr("bigImageURL");
                    img = new Image();
                    img.src = bigImageURL;
                    img.onload = function(){
                        console.log(bigImageURL);  
                        $("div.img4load").append($(img));
                    };
                });    
                initBigImg = true;
            }
        );
});

</script>

	
<div class="imgAndInfo">

	<div class="imgInimgAndInfo">
		<img src="img/productSingle/${p.firstProductImage.id}.jpg" class="bigImg">
		<div class="smallImageDiv">
			<c:forEach items="${p.productSingleImages}" var="pi">
				<img src="img/productSingle_small/${pi.id}.jpg" bigImageURL="img/productSingle/${pi.id}.jpg" class="smallImage">
			</c:forEach>
		</div>
		<div class="img4load hidden" ></div>
	</div>
	
	<div class="infoInimgAndInfo">
		
		<div class="productTitle">
			${p.name}
		</div>
		<div class="productSubTitle">
			${p.subTitle} 
		</div>
		
		<div class="productPrice">
			<div class="juhuasuan">
				<span class="juhuasuanBig" >限时优惠</span>
				<span>此商品正限时优惠<span class="juhuasuanTime">1年</span>后结束，</span>
			</div>
			<div class="productPriceDiv">
				<div class="gouwujuanDiv">
				<span> 全场实物商品通用</span>
				
				</div>
				<div class="originalDiv">
					<span class="originalPriceDesc">价格</span>
					<span class="originalPriceYuan">¥</span>
					<span class="originalPrice">
					
						<fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/>					
					</span>
				</div>
				<div class="promotionDiv">
					<span class="promotionPriceDesc">促销价 </span>
					<span class="promotionPriceYuan">¥</span>
					<span class="promotionPrice">
						<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
					</span>				
				</div>
			</div>
		</div>
		<div class="productSaleAndReviewNumber">
			<div>销量 <span class="redColor boldWord"> ${p.saleCount }</span></div>	
			<div>累计评价 <span class="redColor boldWord"> ${p.reviewCount}</span></div>	
		</div>
		<div class="productNumber">
			<span>数量</span>
			<span>
				<span class="productNumberSettingSpan">
				<input class="productNumberSetting" type="text" value="1">
				</span>
				<span class="arrow">
					<a href="#nowhere" class="increaseNumber">
					<span class="updown">
							<img src="img/site/increase.png">
					</span>
					</a>
					
					<span class="updownMiddle"> </span>
					<a href="#nowhere"  class="decreaseNumber">
					<span class="updown">
							<img src="img/site/decrease.png">
					</span>
					</a>
					
				</span>
					
			件</span>
			<span>库存${p.stock}件</span>
		</div>
		<div class="serviceCommitment">
			<span class="serviceCommitmentDesc">服务承诺</span>
			<span class="serviceCommitmentLink">
				<a href="#nowhere">正品保证</a>
				<a href="#nowhere">极速退款</a>
				<a href="#nowhere">赠运费险</a>
				<a href="#nowhere">七天无理由退换</a>
			</span>
		</div>	
		
		<div class="buyDiv">
			<a class="buyLink" href="forebuyone?pid=${p.id}"><button class="buyButton">立即购买</button></a>
			<a href="#nowhere" class="addCartLink"><button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button></a>
		</div>
	</div>
	


	<div style="clear:both"></div>
	
</div>

