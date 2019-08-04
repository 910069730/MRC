<template>
	<view class="content">
				
		<!-- 背景底色设置 -->
		<view class="c_bg"></view>
		
		<!-- 我的收货地址模块 -->
		    <!-- 首个收货地址模块 -->
		<template v-for="(myAddress,myAddressIndex) in myAddresses">
		<view class="c_myAddress">
			<view class="c_myAddressImage" :style="{display:myAddress.imageDisplay}">
				<image src="../../static/payImages/localAddress.png" mode="" />
			</view>
			<view class="c_myAddressMessage">
				<text class="c_myAddressMessageName">{{myAddress.name}}</text>
				<text class="c_myAddressMessagePhoneNumber">{{myAddress.number}}</text>
				<image class="c_myAddressThisDefault" src="../../static/payImages/default.png" :style="{display:myAddress.defaultDisplay}"></image>
				<br/>
				<text class="c_myAddressMessageAddress">{{myAddress.messageAddress}}</text>
			</view>
			<view class="c_myAddressChange" @click="c_ToEditAddress">
				<image src="../../static/payImages/edit.png" mode="" />
				<view>编辑</view>
			</view>
		</view>
		</template>
		
		<!-- 底部加宽模块 -->
		<view class="c_myAddressBottom"></view>
		
		   <!-- 底部添加收货地址按钮	 -->
		<button class="c_myAddressAddAddress" @click="c_myAddressAddAddress">添加收货地址</button>
	</view>
</template>

<script>
	export default {
		data() {
			return {
			        myAddresses:[
						{
							imageDisplay:"flex",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"none",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						},
						{
							imageDisplay:"none",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"inline-block",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						},
						{
							imageDisplay:"none",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"none",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						},
						{
							imageDisplay:"none",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"none",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						},
						{
							imageDisplay:"none",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"none",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						},
						{
							imageDisplay:"none",
							name:"王某某",
							number:"190 9098 0987",
							defaultDisplay:"none",
							messageAddress:"上海  上海市  浦东新区  陆家嘴街道"+" 商城路738号胜康廖氏大厦807"
						}
					]
			}
		},
		onLoad() {

		},
		methods: {
                  c_ToEditAddress(){
					  uni.navigateTo({
					  	url:"editAddress"
					  })
				  },
				  c_myAddressAddAddress(){
					  uni.navigateTo({
					  	url:"addAddress"
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
	
	/* 我的收货地址模块样式 */
	.c_myAddress{
		margin-top: 20rpx;
		width: 660rpx;
		height: 180rpx;
		background:rgba(255,255,255,1);
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		position: relative;
		display: flex;
		padding-left: 15rpx;
	}
	    /* 我的收货地址模块样式(左侧地址图片样式) */
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
	    /* 我的收货地址模块样式(中间详细信息样式) */
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
	/* 我的收货地址模块样式(右侧编辑信息样式) */
	.c_myAddressChange{
		width: 107rpx;
		height: 80rpx;
		margin-top: 50rpx;
		border-left: 1px solid #EEEEEE;
		text-align: center;
	}
	.c_myAddressChange image{
		width: 24rpx;
		height: 24rpx;
		margin: 0 auto;
		margin-top: 13rpx;
	}
	.c_myAddressChange view{
		font-size:24rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(255,183,0,1);
		line-height:20rpx;
	}
	
	/* 底部加宽模块样式 */
	.c_myAddressBottom{
		 width: 750rpx;
		 height: 150rpx;
	}
	
	/* 底部保存按钮样式 */
	.c_myAddressAddAddress{
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
		bottom: 29rpx;
		left: 50%;
		transform: translateX(-50%);
	}
</style>
