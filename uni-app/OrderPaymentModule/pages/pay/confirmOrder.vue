<template>
	<view class="content">
						
		<!-- 背景底色设置 -->
		<view class="c_bg" :style="{background:c_confirmOrderbg}"></view>
		
		<!-- 提示需要添加收货地址模块 -->
	   <image src="../../static/payImages/needAddress.png" mode="" class="c_confirmationOrderNeedAddressImage" @click="c_confirmationOrderToAddAddress"></image>
	   
	   		<!-- 订单确认页面地址模块 -->
	   <view class="c_WaitingPaymentAddress" v-for="(address,addressIndex) in Addresses" :style="{display:c_WaitingPaymentAddressDisplay}">
	   		<view class="c_myAddressImage">
	   			<image src="../../static/payImages/localAddress.png" mode="" />
	   		</view>
	   		<view class="c_myAddressMessage">
	   			<text class="c_myAddressMessageName">{{address.PeopleName}}</text>
	   			<text class="c_myAddressMessagePhoneNumber">{{address.PeopleNumber}}</text>
	   			<image class="c_myAddressThisDefault" src="../../static/payImages/default.png" v-if="false"></image>
	   			<br/>
	   			<text class="c_myAddressMessageAddress">{{address.PeopleAddress}}
	   	                </text>
	   		</view>
	   		<view class="c_changeAddress">
	   			<navigator url="myAddress">切换地址</navigator>
	   			<image src="../../static/payImages/rightBtn.png" mode="" class="c_changeAddressRightBtn"></image>
	   		</view>
	   </view>
	   
	   <!-- 确认订单商品模块 -->
	<view v-for="(shopGoods,shopGoodsIndex) in AllShopGoods">
	   <view class="c_confirmationOrder">
		   <image src="../../static/payImages/shopImage_07.png" mode="" class="c_shopImage"></image>
		   <text class="c_shopName">店铺名称</text>
		   <image src="../../static/payImages/rightBtn.png" mode="" class="c_shopRightBtn"></image>
		   <image src="../../static/payImages/goodsImage.png" mode="" class="c_shopGoodsImage"></image>
		   <text class="c_shopGoodsName">{{shopGoods.name}}</text>
		   <text class="c_shopGoodsAttribute">{{shopGoods.type}}</text>
		   <text class="c_shopGoodsPrice">￥<text>{{shopGoods.price}}</text></text>
		    <view class="c_shopGoodsBuyNumber">
			   <text class="c_shopGoodsBuyNumberTitle">购买数量</text>
			   <view class="c_shopGoodsBuyNumberAddandDel">
				   <view class="c_shopGoodsBuyNumberDel" @click="c_shopGoodsBuyNumberDel">-</view>
				   <view class="c_shopGoodsBuyNumberValue">{{shopGoods.BuyNumberValue}}</view>
				   <view class="c_shopGoodsBuyNumberAdd" @click="c_shopGoodsBuyNumberAdd">+</view>
			   </view>
		    </view>
			<view class="c_shopGoodsDistribution">
			    <text class="c_shopGoodsDistributionTitle">配送<text>（普通配送）</text></text>
				<text class="c_shopGoodsDistributionPrice">{{shopGoods.DistributionPrice}}</text>
			</view>
			<view class="c_shopGoodsCoupon">
				<text class="c_shopGoodsCouponTitle">优惠卷</text>
				<text class="c_shopGoodsCouponNumber" @click="c_couponSelect">{{shopGoods.CouponNumber}}张可用</text>
				<image src="../../static/payImages/rightBtn.png" mode="" class="c_shopGoodsCouponNumberRightBtn" @click="c_couponSelect"></image>
			</view>
			<view class="c_shopGoodsRemarks">
				<text class="c_shopGoodsRemarksTitle">订单备注</text>
				<text class="c_shopGoodsRemarksContent">{{shopGoods.RemarksContent}}</text>
			</view>
			<view class="c_shopGoodsBuyNumberAll">
				<text class="c_shopGoodsBuyNumberAllPrice">￥{{shopGoods.ThisShopAllPrice}}</text>		
				<text class="c_shopGoodsBuyNumberAllSmall">小计：</text>
                <text class="c_shopGoodsBuyNumberAllNumber">共{{shopGoods.BuyNumberValue}}件</text>
			</view>
		  <view class="c_PurchasingPattern">
			  <image src="../../static/payImages/smallTick.png" mode="" class="c_smallTick" :style="{display:smallTickTrue}" @click="smallTickTrueClick" >{{smallTickValue}}</image>
			  <image src="../../static/payImages/smallTick2.png" mode="" class="c_smallTick" :style="{display:smallTickFalse}" @click="smallTickFalseClick">{{smallTickValue}}</image>
			  <text class="c_PurchasingPatternPrompt">匿名购买</text>
		  </view>
	</view>
		  
		  <!-- 提交订单底栏模块 -->
		  <view class="c_shopGoodsBuy">
		  			  <view class="c_shopGoodsBuySubmit" @click="c_shopGoodsBuySubmit">
		  				  <text>提交订单</text>
		  			  </view>
		  			  <text class="c_shopGoodsBuySmall">小计：<text>￥{{allShopGoodsPrice}}</text></text>
		  			  <text class="c_shopGoodsBuyCoupon">优惠 15.00元</text>
		  </view>
	   </view>
	   
	   	   <!-- 底部空留位置模块 -->
	   <view style="width: 750rpx;height: 400rpx;" :style="{background:c_confirmOrderbg}"></view>
	   
	    <!--可用优惠卷模块 -->
		  <!-- 可用优惠卷背景模块 -->
	   <view class="c_couponSelectBg" :style="{display:couponSelectBgDisplay}" @click="c_couponSelectCancel"></view>
	      <!-- 可用优惠卷内容模块 -->
	   <view class="c_couponSelectContent" :style="{transform:couponSelectContentTransform}">
		   <text class="c_couponSelectContentHead">优惠卷</text>
		   <scroll-view scroll-y class="c_couponSelectContentBody" >
		   	<view class="c_coupons" v-for="(c_coupons,c_couponsIndex) in c_couponsGroup">
				<text class="c_couponsMoneyUnit">￥</text>
				<text class="c_couponsMoneyNumber">{{c_coupons.MoneyNumber}}</text>
				<view class="c_couponsLimit"></view>
				<text class="c_couponsLimitTitle">无门槛优惠券</text>
				<text class="c_couponsLimitTime">有效期 {{c_coupons.LimitTime}}</text>
			    <view class="c_couponsUse" @click="c_couponSelectUse">立即使用</view>
			</view>
		   </scroll-view>
	   </view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				   allShopGoodsPrice:"",
				   
				   AllShopGoods:[
					   {
					     name:"小米手机全新发布 红米pro 续航...",
						 type:"颜色分类：蓝色；内存：62g",
						 price:1800.00,
						 // 购买数量值
						 BuyNumberValue:1,
						 // 控制运费的值
						 DistributionPrice:"免运费",
						 CouponNumber:"1",
						 RemarksContent:"请送我钢化膜请送我钢化膜请送我钢...",
						 ThisShopAllPrice:"",
					   }
				   ], 
				   
				   // 匿名购买选择
				      smallTickTrue:"block",
					  smallTickFalse:"none",
				      smallTickValue:true,
				   
				   // 优惠卷的背景是否显示
					  couponSelectBgDisplay:"none",
				   // 优惠卷相关内容是否移出
					  couponSelectContentTransform: "translateY(720rpx)",
				   // 控制订单支付页面背景色
				      c_confirmOrderbg:"#F8F8F8",
					  // c_confirmOrderbg:"#FFFFFF",
					  
				   // 优惠卷的优惠卷额度和优惠卷有效期显示
				      c_couponsGroup:[
						  {
							  MoneyNumber:"5",
							  LimitTime:"2019.07.26-2019.09.26"
						  },
						  {
						  	  MoneyNumber:"5",
						  	  LimitTime:"2019.07.26-2019.09.26"
						  },
						  {
						  	  MoneyNumber:"5",
						  	  LimitTime:"2019.07.26-2019.09.26"
						  },
						  {
						  	  MoneyNumber:"5",
						  	  LimitTime:"2019.07.26-2019.09.26"
						  },
						  {
						  	  MoneyNumber:"5",
						  	  LimitTime:"2019.07.26-2019.09.26"
						  },
					  ],
					  
				   //地址模块信息属性及显示
					  c_WaitingPaymentAddressDisplay:"none",
					  Addresses:[
					  	{
					  		  PeopleName:"王某某",
					  		  PeopleNumber:"190 9098 0987",
					  		  PeopleAddress:"上海  上海市  浦东新区  陆家嘴街道商城路738"+" 号胜康廖氏大厦807"
					  	}
				   ],
			}
		},
		onLoad() {
            this.AllShopGoods[0].ThisShopAllPrice=this.AllShopGoods[0].BuyNumberValue*this.AllShopGoods[0].price;
		    for(var i=0;i<this.AllShopGoods.length;i++){
				this.allShopGoodsPrice=this.AllShopGoods[i].ThisShopAllPrice
			} 
		},
		methods: {
			        // 控制购买数量
			        c_shopGoodsBuyNumberDel(){
						if(this.AllShopGoods[0].BuyNumberValue==1){
							this.AllShopGoods[0].BuyNumberValue=1;
						}else{
							this.AllShopGoods[0].BuyNumberValue=this.AllShopGoods[0].BuyNumberValue-1;
							this.AllShopGoods[0].ThisShopAllPrice=this.AllShopGoods[0].BuyNumberValue*this.AllShopGoods[0].price;
								this.allShopGoodsPrice=this.AllShopGoods[0].ThisShopAllPrice
						}
					},
					c_shopGoodsBuyNumberAdd(){
						this.AllShopGoods[0].BuyNumberValue=this.AllShopGoods[0].BuyNumberValue+1;
						this.AllShopGoods[0].ThisShopAllPrice=this.AllShopGoods[0].BuyNumberValue*this.AllShopGoods[0].price;
							this.allShopGoodsPrice=this.AllShopGoods[0].ThisShopAllPrice
					},
					
					//跳转至添加地址
					c_confirmationOrderToAddAddress(){
						uni.navigateTo({
							url:"addAddress"
						})
					},
					
					// 优惠卷选择使用及取消
					c_couponSelect(){
						this.couponSelectBgDisplay="block";
						this.couponSelectContentTransform="translateY(0rpx)";
					},
					c_couponSelectCancel(){
						this.couponSelectBgDisplay="none";
						this.couponSelectContentTransform="translateY(720rpx)";
					},
					c_couponSelectUse(){
						this.couponSelectBgDisplay="none";
						this.couponSelectContentTransform="translateY(720rpx)";
					},
					
					//监听匿名购买复选框
					smallTickTrueClick(){
						this.smallTickTrue="none";
						this.smallTickFalse="block";
						this.smallTickValue=false;
						console.log(this.smallTickValue)
					},
					smallTickFalseClick(){
						this.smallTickTrue="block";
						this.smallTickFalse="none";
						this.smallTickValue=true;
						console.log(this.smallTickValue)
					},
					
					//监听提交订单按钮
					c_shopGoodsBuySubmit(){
						
                     //  获取到用户手机里的服务商
                     //  支付方式有:    alipay（支付宝支付）
					                // wxpay（微信支付）
					                // appleiap（苹果应用内支付）
					                // baidu（百度收银台支付）
									
						uni.getProvider({
											
							service: 'payment',

							success: function (res) {

							//在这里进行业务逻辑处理
							console.log(res);

						   }

						});	
						
					//微信小程序支付相关功能实现代码（重点）
					// uni.requestPayment({
					// 	provider: 'wxpay',        //支付方式的提供商
					// 	timeStamp: String(Date.now()),   //当前时间（必写）
					// 	nonceStr: 'A1B2C3D4E5', //随机字符串，长度为32个字符以下（必写）
					// 	package: 'prepay_id=wx20180101abcdefg', //下单接口返回的prepay_id 参数值（必写）
					// 	signType: 'MD5',         //签名算法（必写）
					// 	paySign: '',           //签名（详见微信小程序支付文档）(必写)
					// 	success: function (res) {
					// 		console.log('success:' + JSON.stringify(res));
					// 	},
					// 	fail: function (err) {
					// 		console.log('fail:' + JSON.stringify(err));
					// 	}
					// });
						
			}
		}
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
		
	/* 背景底色样式设置 */
	.c_bg{
		width: 100vw;
		height: 100vh;
		position: fixed;
		left: 0;
		top: 0;
		z-index: -999;
	}
	
	/* 需要添加收货地址模块样式 */
	.c_confirmationOrderNeedAddressImage{
		width: 690rpx;
		height: 150rpx;
		border-radius:16rpx;
	}
	
	/* 订单确认页面地址模块样式 */
	.c_WaitingPaymentAddress{
		margin-top: 20rpx;
		width: 660rpx;
		height: 180rpx;
		background:rgba(255,255,255,1);
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		position: relative;
		display: flex;
		padding-left: 15rpx;
		padding-right: 15rpx;
	}
	
	/* 订单确认页面地址模块样式(左侧地址图片样式) */
	.c_myAddressImage{
		flex:2;
		display: flex;
		justify-content: center;
	}
	.c_myAddressImage image{
	    width: 26rpx;
		height: 32rpx;	
		margin-top: 33rpx;
	}
	    /* 订单确认页面地址模块样式(右间详细信息样式) */
	.c_myAddressMessage{
		flex: 16;
		position: relative;
		box-sizing: border-box;
		padding-top: 20rpx;
		margin-left: 15rpx;
	}
	.c_myAddressMessageName{
		font-size:34rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(18,18,18,1);
		margin-right: 20rpx;
	}
	.c_myAddressMessagePhoneNumber{
		font-size:30rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(153,153,153,1);
		margin-top: 5rpx;
	}
	.c_myAddressThisDefault{
		width: 64rpx;
		height: 30rpx;
		margin-left: 17rpx;
	}
	.c_myAddressMessageAddress{
		font-size:28rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(18,18,18,1);
		line-height: 0;
	}
	 /* 订单确认页面切换地址样式 */
	.c_changeAddress{
		width: 150rpx;
		height: 80rpx;
		position: absolute;
		right: 0;
		top: 0;
	}
	.c_changeAddress navigator{
		font-size:24rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(153,153,153,1);
		line-height: 100rpx;
	}
	.c_changeAddressRightBtn{
		width: 12rpx;
		height: 21rpx;
		position: absolute;
		top: 40rpx;
		right: 30rpx;
	}
	
	/* 确认订单商品模块样式 */
	.c_confirmationOrder{
	    width:690rpx;
		height: 650rpx;
		position: relative;
		background:rgba(255,255,255,1);
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		margin-top: 20rpx;
	}
	.c_shopImage{
		width: 32rpx;
		height: 28rpx;
		position: absolute;
		left: 28rpx;
		top: 28rpx;
	}
	.c_shopName{
	    font-size:28rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		position: absolute;
		top: 23rpx;
		left: 74rpx;
	}
	.c_shopRightBtn{
		width: 12rpx;
		height: 21rpx;
		position: absolute;
		left: 194rpx;
		top: 30rpx;
	}
	.c_shopGoodsImage{
		width: 160rpx;
		height: 160rpx;
		position: absolute;
		left: 26rpx;
		top: 77rpx;
	}
	.c_shopGoodsName{
		font-size:28rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		position: absolute;
		left: 202rpx;
		top: 85rpx;
	}
	.c_shopGoodsAttribute{
		font-size:24rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(136,136,136,1);
		line-height:36rpx;
		position: absolute;
		left: 202rpx;
		top: 127rpx;
	}
	.c_shopGoodsPrice{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(255,51,33,1);
		line-height:15rpx;
		position: absolute;
		left: 197rpx;
		top: 184rpx;
	}
	.c_shopGoodsPrice{
		font-family: SanFranciscoDisplay-Regular;
	}
	.c_shopGoodsBuyNumber{
		width: 690rpx;
		height: 70rpx;
		position: absolute;
		left: 0;
		top: 240rpx;
		box-sizing: border-box;
		padding-left: 74rpx;
		padding-right: 50rpx;
	}
	.c_shopGoodsBuyNumberTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:70rpx;
		float: left;
	}
	.c_shopGoodsBuyNumberAddandDel{
	    width: 154rpx;
		height: 40rpx;
		border:2px solid rgba(238,238,238,1);
        border-radius:4px;
		float: right;
		margin-top: 17rpx;
		
		display: flex;
		text-align: center;
		border: 2rpx solid rgba(238,238,238,1);
	}
    .c_shopGoodsBuyNumberDel{
	    flex: 1;	
        line-height: 40rpx;
		color: #999999;
	}
	.c_shopGoodsBuyNumberValue{
	    flex: 2;
		line-height: 40rpx;
		border-left: 2rpx solid rgba(238,238,238,1);
		border-right: 2rpx solid rgba(238,238,238,1);
		
	}
	.c_shopGoodsBuyNumberAdd{
		flex: 1;
		line-height: 40rpx;
		color: #999999;
	}
	.c_shopGoodsDistribution{
		width: 690rpx;
		height: 70rpx;
		position: absolute;
		left: 0;
		top: 315rpx;
		box-sizing: border-box;
		padding-left: 74rpx;
		padding-right: 50rpx;
	}
	.c_shopGoodsDistributionTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:70rpx;
	}
	.c_shopGoodsDistributionTitle text{
		color: #888888;
	}
	.c_shopGoodsDistributionPrice{
	    font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:70rpx;	
		float: right;
	}
	.c_shopGoodsCoupon{
		width: 690rpx;
		height: 70rpx;
		position: absolute;
		left: 0;
		top: 390rpx;
		box-sizing: border-box;
		padding-left: 74rpx;
		padding-right: 50rpx;
	}
	.c_shopGoodsCouponTitle{
	    font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:70rpx;	
	}
	.c_shopGoodsCouponNumber{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,40,40,1);
		line-height:70rpx;
		float: right;
	}
	.c_shopGoodsCouponNumberRightBtn{
	    width: 12rpx;
		height: 21rpx;
		border-radius:2rpx;
		position: absolute;
		right: 26rpx;
		top:27rpx
	}
	.c_shopGoodsRemarks{
		width: 690rpx;
		height: 70rpx;
		position: absolute;
		left: 0;
		top: 465rpx;
		box-sizing: border-box;
		padding-left: 74rpx;
		padding-right: 50rpx;
	}
    .c_shopGoodsRemarksTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(18,18,18,1);
		line-height:70rpx;
	}
	.c_shopGoodsRemarksContent{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(18,18,18,1);
		line-height:76rpx;
		margin-left: 30rpx;
	}
	.c_shopGoodsBuyNumberAll{
		width: 690rpx;
		height: 70rpx;
		position: absolute;
		left: 0; 
		bottom: 30rpx;
		box-sizing: border-box;
		padding-left: 74rpx;
		padding-right: 50rpx;
	}
	.c_shopGoodsBuyNumberAllNumber{
		font-size: 26rpx;
		font-weight: 500;
		font-family:PingFang-SC-Medium;
		color: #888888;
		line-height: 80rpx;
	}
	.c_shopGoodsBuyNumberAllSmall{
	    font-size: 34rpx;
		font-weight: 500;
		font-family:PingFang-SC-Medium;
		margin-left: 20rpx;
		line-height: 70rpx;
	}
	.c_shopGoodsBuyNumberAllPrice{
		font-size: 34rpx;
		color: #ff2c2c;
		font-weight: 500;
		font-family:PingFang-SC-Medium;
		line-height: 70rpx;
	}
	.c_shopGoodsBuyNumberAll text{
		float: right;
	}
	.c_PurchasingPattern{
	    width: 150rpx;
		height: 50rpx;
		position: absolute;
		left: 0;
		bottom: -60rpx;
	}
	.c_smallTick{
		width: 30rpx;
		height: 30rpx;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	.c_PurchasingPatternPrompt{
		font-size:24rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(136,136,136,1);
		position: absolute;
		right: 10rpx;
		bottom: -3rpx;
	}
	
	/* 提交订单底栏模块样式 */
	.c_shopGoodsBuy{
		width: 750rpx;
		height: 98rpx;
		background:rgba(255,255,255,1);
	    position: fixed;
		left: 50%;
		transform: translateX(-50%);
		bottom: 0;
	}
	.c_shopGoodsBuySubmit{
	    width: 180rpx;
		height:72rpx;
		background-color: #FFB700;
		border-radius:4rpx;
		position: absolute;
		right: 30rpx;
		text-align: center;
		top: 14rpx;
	}
	.c_shopGoodsBuySubmit text{
		font-size:28rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(255,255,255,1);
		line-height:72rpx;
	}
	.c_shopGoodsBuySmall{
	    font-size: 34rpx;
		color: #121212;
		font-weight: 500;
		font-family: PingFang-SC-Medium;
		position:absolute;
		right: 233rpx;
		top: 15rpx;
	}
	.c_shopGoodsBuySmall text{
	    color: #FF2C2C;
	}
	.c_shopGoodsBuyCoupon{
		position: absolute;
		right: 234rpx;
		bottom: 14rpx;
		font-size:24rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,53,53,1);
		line-height:36rpx; 
	}
	
	/* 可用优惠卷模块样式 */
	    /* 可用优惠卷模块背景样式 */
	.c_couponSelectBg{
		width: 100vw;
		height: 100vh;
		position: fixed;
		left: 0;
		top: 0;
		background-color: rgba(0,0,0,0.6);
	}
	    /* 可用优惠卷模块内容样式 */
	.c_couponSelectContent{
		width: 100vw;
		height: 720rpx;
		background-color: #fff;
		border-radius:16rpx 16rpx 0rpx 0rpx;
		position: fixed;
		bottom: 0;
		left: 0;
		box-sizing: border-box;
		padding: 0rpx 40rpx 0 50rpx;
		transition: 1s;
		text-align: center;
	}
	.c_couponSelectContentHead{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(0,0,0,1);
	    line-height: 100rpx;
	}
	.c_couponSelectContentBody{
		width: 750rpx;
		height: 620rpx;
		position: absolute;
		left: 0;
		top: 100rpx;
	}
	.c_coupons{
		width: 690rpx;
		height: 160rpx;
		margin: 0 auto 20rpx;
		border-radius:16rpx;
		background: url(../../static/payImages/couponBg.png) repeat center;
		background-size:100%;
		position: relative;
	}
	.c_couponsMoneyUnit{
	    font-size: 48rpx;
		font-weight: 500;
		font-family: PingFang-SC-Medium;
		color: #FF3F1F;
		position: absolute;
		left: 46rpx;
		top: 43rpx;
	}
	.c_couponsMoneyNumber{
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,63,31,1);
		position: absolute;
		font-size: 84rpx;
		left: 85rpx;
		top: 5rpx;
	}
	.c_couponsLimit{
	    width:112rpx;
		height:26rpx;
		background: url(../../static/payImages/couponsLimitImage.png) repeat center;
		background-size: 100%;
		border-radius:13rpx;
		position: absolute;
		left: 35rpx;
		bottom: 33rpx;
		text-align: center;
	}
    .c_couponsLimitTitle{
		font-size:28rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,63,31,1);
		position: absolute;
		left: 178rpx;
		top: 50rpx;
	}
	.c_couponsLimitTime{
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,63,31,1);
		position: absolute;
		left: 175rpx;
		bottom: 36rpx;
	}
	.c_couponsUse{
		width: 180rpx;
		height: 160rpx;
		font-size:28rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(255,255,255,1);
		line-height: 160rpx;
		text-align: center;
		position: absolute;
		right: 0;
	}
</style>
