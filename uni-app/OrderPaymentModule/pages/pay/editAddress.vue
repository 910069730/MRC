<template>
	<view class="content">
		
		  <!-- 背景底色设置 -->
          <view class="c_bg"></view>
		  
		  <!-- 编辑收获地址填写模块 -->
		  <view class="c_editAddress">
			  <view class="c_editAddressName">
				   <text>收货人</text>
				   <input type="text" placeholder="请填写收货人姓名" v-model="c_editAddressName">
			  </view>
			  <view class="c_editAddressPhoneNumber">
			  	   <text>手机号码</text>
			  	   <input type="text" placeholder="请填写收货人手机号" v-model="c_editAddressPhoneNumber">
			  </view>
			  <view class="c_editAddressLocal">
			  	   <text>所在地区</text>
				   <text class="c_editAddressLocalPlace">{{c_editAddressLocal}}</text>
			  	   <image src="../../static/payImages/rightBtn.png" />
			  </view>
			  <view class="c_editAddressDetailed">
			  	   <text>详细地址</text>
			  	    <textarea type="text" placeholder="街道、楼牌号等" v-model="c_editAddressDetailed" />
			  </view> 
		  </view>
		  
		  <!-- 默认地址设置模块 -->
		  <view class="c_defaultAddress">
			  <text>设置默认地址</text>
			  <switch color="#04BE02"></switch>
		  </view>
		  
		  <!-- 删除收货地址模块 -->
		  <view class="c_deleteAddress" @click="c_editAddressDeleteClick">
		  			  <text>删除收货地址</text>
		  </view>
		   
		   		<!-- 底部加宽模块 -->
		   <view class="c_editAddressBottom"></view>
		   
		   		  <!-- 底部保存按钮	 -->
		   <button class="c_editAddressSubmit">保存</button>
           
		   <!-- 点击删除收货地址出现的弹框模块 -->
		   <view class="c_editAddressDeleteBg" :style="{display:display}">
			   		   <view class="c_editAddressDelete">
						   
					   </view>
		   </view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				          // 点击删除收货地址出现背景色展示
							display:"none",
							
						  //编辑收货地址数据信息
						    c_editAddressName:"王某某",
							c_editAddressPhoneNumber:"198 8909 9087",
							c_editAddressLocal:"上海 上海市 浦东新区",
							c_editAddressDetailed:"商城路738号胜康廖氏大厦807"
			}
		},
		onLoad() {

		},
		methods: {
			        c_editAddressDeleteClick(){
						this.display="block";
						var that=this;
						 wx.showModal({
						 	content:"您确定要删除该收货地址吗？",
							confirmColor:"#FFB700",
							  success (res) {
							if (res.confirm) {
							  console.log('用户点击确定');
							  that.display="none";
							} else if (res.cancel) {
							  console.log('用户点击取消');
							  that.display="none";
							}
						   }
					   })
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
	
	/* 编辑地址填写模块样式 */
	.c_editAddress{
		width: 690rpx;
		height: 440rpx;
		background-color: #FFFFFF;
		border-radius: 16rpx;;
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		margin-top: 20rpx;
		position: relative;
	}
	 /* 编辑地址填写模块样式(收货人) */
	.c_editAddressName{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_editAddressName text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	}
	.c_editAddressName input{
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
	/* 编辑地址填写模块样式(手机号码) */
	.c_editAddressPhoneNumber{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_editAddressPhoneNumber text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	}
	.c_editAddressPhoneNumber input{
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
	/* 编辑地址填写模块样式(所在地区) */
	.c_editAddressLocal{
		width: 630rpx;
		height: 87rpx;
		line-height: 87rpx;
		position: relative;
		border-bottom: 1px solid rgba(229,229,229,1);
		margin: 0 auto;
	}
	.c_editAddressLocal text{
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
	.c_editAddressLocal image{
		width: 16rpx;
		height: 25rpx;
		position: absolute;
		top:50%;
		transform: translateY(-50%);
		right: 0;
	}
	/* 编辑地址填写模块样式(详细地址) */
	.c_editAddressDetailed{
		width: 630rpx;
		line-height: 87rpx;
		position: relative;
		margin: 0 auto;
	}
	.c_editAddressDetailed::after{
		content: "";
		display: block;
		height: 0;
		clear: both;
		visibility: hidden;
	}
	.c_editAddressDetailed text{
		font-size: 34rpx;
		font-family: PingFang-SC-Medium;
		font-weight:500;
		color: #000000;
		
	} 
	.c_editAddressDetailed textarea{
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
	
	/* 默认收货地址设置模块 */
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
	
		/* 删除收货地址设置模块 */
	.c_deleteAddress{
		width: 690rpx;
		height: 88rpx;
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		background-color: #ffffff;
		margin-top: 20rpx;
		box-sizing: border-box;
		padding: 0 30rpx;
	}
	.c_deleteAddress text{
		font-size:34rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,35,35,1);
		line-height: 88rpx;	
	}
	
	/* 底部加宽模块样式 */
	.c_editAddressBottom{
	    width: 750rpx;
	    height: 150rpx;
	}
	
	/* 底部保存按钮样式 */
	.c_editAddressSubmit{
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
	
	/* 点击删除收货地址出现的弹框模块样式 */
	.c_editAddressDeleteBg{
		width: 100vw;
		height: 100vh;
		position: fixed;
		left: 0;
		top: 0;
		background-color: rgba(0,0,0,0.6);
	}
</style>
