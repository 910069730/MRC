<template>
	<view class="content">
		
		  <!-- 背景底色设置 -->
          <view class="c_bg"></view>
		  
		  <!-- 添加收货地址填写模块 -->
		  <view class="c_addAddress">
			  <view class="c_addAddressName">
				   <text>收货人</text>
				   <input type="text" placeholder="请填写收货人姓名">
			  </view>
			  <view class="c_addAddressPhoneNumber">
			  	   <text>手机号码</text>
			  	   <input type="text" placeholder="请填写收货人手机号">
			  </view>
			  <view class="c_addAddressLocal" @click="c_addAddressLocalClick">
			  	   <text>所在地区</text>
				   <text class="c_editAddressLocalPlace">
					 <!--  上海 上海市 浦东新区 -->
				   </text>
			  	   <image src="../../static/payImages/rightBtn.png" />
			  </view>
			  <view class="c_addAddressDetailed">
			  	   <text>详细地址</text>
			  	    <textarea type="text" placeholder="街道、楼牌号等" />
			  </view> 
		  </view>
		  
		  <!-- 默认地址设置模块 -->
		  <view class="c_defaultAddress">
			  <text>设置默认地址</text>
			  <switch color="#04BE02"></switch>
		  </view>
		  
		  <!-- 底部加宽模块 -->
		  <view class="c_addAddressBottom"></view>
		   
		   		  <!-- 底部保存按钮	 -->
		   <button class="c_addAddressSubmit">保存</button>
           
           <!-- 选择所在地区模块 -->
		        <!-- 选择所在地区模块背景 -->
		   <view class="c_addAddressClickAddressBg" :style="{display:display}" @click="c_deletePleaseChoose"></view>
		        <!-- 选择所在地区选项模块 -->
		   <view class="c_addAddressClickAddress" :style="{transform:transform}">
		   				   <view class="c_addAddressClickAddressHead" @click="c_deletePleaseChoose">
		   					   <text>配送至</text>
		   					   <image src="../../static/payImages/delete.png" mode=""></image>
		   				   </view>
		   				   <view class="c_addAddressClickAddressChoose">
		   					   <text :style="{borderBottom:BigPlaceBorder}" @click="BigPlaceClick">{{BigPlace}}</text>
							   <scroll-view scroll-y class="c_pleaseChooseAddress"  :style="{display:addAddressBigPlace}" >
							   	<view>上海</view>
							   	<view>浙江</view>
							   	<view>江苏</view>
							   	<view>江西</view> 
							   	<view>福建</view>
							   	<view>吉林</view>
							   	<view>湖南</view>
							   	<view>湖北</view>
							   	<view>新疆</view>
							   	<view>广东</view>
							   	<view>山西</view>
							   </scroll-view>
		   					   <view class="c_pleaseChoose"  :style="{borderBottom:chooseBorder}" @click="chooseClick" >请选择</view>
		   					   <scroll-view scroll-y class="c_pleaseChooseAddress"  :style="{display:addAddressSmallPlace}">
		   					   	<view>静安区</view>
		   					   	<view>闵行区</view>
		   					   	<view>虹口区</view>
		   					   	<view>黄浦区</view>
		   					   	<view>松江区</view>
		   					   	<view>静安区</view>
		   					   	<view>静安区</view>
		   					   	<view>静安区</view>
		   					   	<view>静安区</view>
		   					   </scroll-view>
		   				   </view>
		   </view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				//点击选择地区移动展示效果
				display:"none",
			    transform: "translateY(720rpx)",
				//省和区的选择
				addAddressBigPlace:"none",
				addAddressSmallPlace:"block",
				BigPlace:"上海",
				//选择所在地区文字底部
				BigPlaceBorder:"none",
				chooseBorder:"1px solid #F5CD54"
			}
		},
		onLoad() {

		},
		methods: {
			      // 点击所在地区进行地区选择
                c_addAddressLocalClick(){
					this.transform="translateY(0rpx)";
					this.display="block";
				},
				  // 点击X取消所在地区选择
				c_deletePleaseChoose(){
					this.transform="translateY(720rpx)";
					this.display="none";
				},
				BigPlaceClick(){
					this.BigPlaceBorder="1px solid #F5CD54";
					this.chooseBorder="none";
					this.addAddressBigPlace="block";
					this.addAddressSmallPlace="none";
				},
				chooseClick(){
					this.BigPlaceBorder="none";
					this.chooseBorder="1px solid #F5CD54";
					this.addAddressSmallPlace="block";
					this.addAddressBigPlace="none";
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
		background-color: #F8F8F8;
	}
	
	/* 背景底色样式设置 */
	.c_bg{
		width: 100vw;
		height: 100vh;
		background-color: #F8F8F8;
		position: fixed;
		left: 0;
		top: 0;
		z-index: -999;
	}
	
	/* 添加地址填写模块样式 */
	.c_addAddress{
		width: 690rpx;
		height: 440rpx;
		background-color: #FFFFFF;
		border-radius: 16rpx;;
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		margin-top: 20rpx;
		position: relative;
	}
	.c_defaultAddress{
		width: 690rpx;
		height: 88rpx;
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		background-color: #ffffff;
		margin-top: 20rpx;
		box-sizing: border-box;
		padding: 0 30rpx;
	}
	 /* 添加地址填写模块样式(收货人) */
	.c_addAddressName{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_addAddressName text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	}
	.c_addAddressName input{
		position: absolute;
		top:50%;
		transform: translateY(-50%);
		left: 209rpx;
		height:32rpx;
		font-size:34rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(19,19,19,1);
	}
	/* 添加地址填写模块样式(手机号码) */
	.c_addAddressPhoneNumber{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_addAddressPhoneNumber text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	}
	.c_addAddressPhoneNumber input{
		position: absolute;
		top:50%;
		transform: translateY(-50%);
		left: 209rpx;
		height:32rpx;
		font-size:34rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(19,19,19,1);
	}
	/* 添加地址填写模块样式(所在地区) */
	.c_addAddressLocal{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_addAddressLocal text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	}
	.c_editAddressLocalPlace{
		margin-left: 79rpx;
		font-size:34px;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(0,0,0,1);
	}
	.c_addAddressLocal image{
		width: 16rpx;
		height: 25rpx;
		position: absolute;
		top:50%;
		transform: translateY(-50%);
		right: 0;
	}
	/* 添加地址填写模块样式(详细地址) */
	.c_addAddressDetailed{
		width: 630rpx;
		line-height: 87rpx;
		position: relative;
		margin: 0 auto;
	}
	.c_addAddressDetailed::after{
		content: "";
		display: block;
		height: 0;
		clear: both;
		visibility: hidden;
	}
	.c_addAddressDetailed text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	} 
	.c_addAddressDetailed textarea{
		float: right;
		margin-right: 20rpx;
		margin-top: 28rpx;
		width: 400rpx;
		height: 100rpx;
		font-size:34rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(18,18,18,1);
		
		/* #ifdef MP */
		line-height: 0;
		/* #endif */
	}
	
	/* 默认地址设置模块 */
	.c_defaultAddress text{
		font-size:34rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(0,0,0,1);
		line-height: 88rpx;	
	}
	.c_defaultAddress switch{
		float: right;
		width: 108rpx;
		height: 74rpx;
		margin-top: 7rpx;
	}
	
	/* 底部加宽模块 */
	.c_addAddressBottom{
		width: 750rpx;
		height: 150rpx;
	}
	
	/* 底部保存按钮样式 */
	.c_addAddressSubmit{
		width: 690rpx;
		height: 88rpx;
		background:rgba(255,183,0,1);
	    border-radius:10rpx;
		font-size:36rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(255,255,255,1);
		line-height: 88rpx;
		position: fixed;
		bottom: 73rpx;
		left: 50%;
		transform: translateX(-50%);
	}
	
	/* 选择地区模块样式 */
	.c_addAddressClickAddressBg{
		width: 100vw;
		height: 100vh;
		position: fixed;
		left: 0;
		top: 0;
		background-color: rgba(0,0,0,0.6);
	}
	.c_addAddressClickAddress{
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
	}
	.c_addAddressClickAddressHead{
          height: 130rpx;
		  padding-top: 50rpx;
	}
	.c_addAddressClickAddressHead image{
		width: 28rpx;
		height: 28rpx;
		margin-left: 5rpx;
		margin-top: 5rpx;
		float: right;
	}
	.c_addAddressClickAddressChoose{
	}
	.c_addAddressClickAddressChoose text{
		float: left;
	}
	.c_pleaseChoose{
		float: left;
		margin-left: 58rpx;
		border-bottom: 4rpx solid #F5CD54;
	}
    .c_pleaseChooseAddress{
		width: 650rpx;
		height: 400rpx;
		position: absolute;
		bottom: 50rpx;
		left: 50%;
		transform: translateX(-50%);
	}
	.c_pleaseChooseAddress view{
		margin-top: 38rpx;
	}
	.c_pleaseChooseAddress view:nth-child(1){
		margin-top: 0;
	}
	
	/* 所在地区绑定样式 */
	.BigPlaceTrue{
		border-bottom: 1px solid rgba(229,229,229,1);
	}
	.BigPlaceFalse{
	    border-bottom: none;
	}
</style>
