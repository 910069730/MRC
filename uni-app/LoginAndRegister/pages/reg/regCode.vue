<template>
	<view class="content">
		<!-- 新用户注册码界面头部 -->
		<view class="regHead">
			<view class="regBigH">账号注册</view>
		</view>
		
		<!-- 注册窗口 -->
		<view class="regBody">
		      	<view class="regUser_regCodeH">填写注册码</view>
		      	<input class="regUser_regCode" type="number" v-model="regCode" placeholder="请输入获得的注册码" />
				<view class="next" >下一步</view>
				<view class="regOthers">
					<view class="LoginReturn" @click="LoginReturn">账号登录</view>
					<view class="getRegCode">获取注册码</view>
				</view>
		</view>		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				regCode:""
			}
		},
		onLoad() {

		},
		methods: {
                   LoginReturn(){
					   uni.redirectTo({
					   	url:"../login/login"
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
	}
	
	/* 新用户注册码界面头部样式 */
	.regHead{
		width: 750rpx;
		height: 100rpx;
		margin-top: 72rpx;
		position: relative;
		box-sizing: border-box;
	}
	.regBigH{
		position: absolute;
		left: 30rpx;
		top: 0;
		font-size:44rpx;
		font-family:PingFangSC-Semibold;
		font-weight:600;
		color:rgba(51,51,51,1);
		line-height:44rpx;
	}
	
	/* 注册账号窗口样式 */
	.regBody{
	    width: 750rpx;
		box-sizing: border-box;
		padding-left: 68rpx;
		padding-top: 138rpx;
		padding-right: 64rpx;
		position: relative;
	}
	.regBody .regUser_regCodeH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.regUser_regCode{
	    font-size:32rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		line-height:32rpx;
		border-bottom: 1px solid #eee;
		margin-top: 34rpx;
		padding-bottom: 20rpx;
		padding-right: 70rpx;
		color:rgba(74,74,74,1);
	}
	.next{
		width:560rpx;
		height:92rpx;
		background:rgba(26,207,193,1);
		border-radius:50rpx;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: -260rpx;
		line-height: 92rpx;
		text-align: center;
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(255,255,255,1);
	}
	.next:active{
		background-color: #07B5A7;
	}
	.regOthers{
		width: 310rpx;
		height: 70rpx;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: -350rpx;
	}
	.LoginReturn{
		font-size:28rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(44,206,221,1);
		line-height:28rpx;
		position: absolute;
		left: 0;
		bottom: 0;
	}
	.getRegCode{
		font-size:28rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(44,206,221,1);
		line-height:28rpx;
		position: absolute;
		right: 0;
		bottom: 0;
	}
</style>
