<template>
	<view class="content">
		<!-- 登录界面头部 -->
		<view class="LoginHead">
			<view class="LoginBigH">流光共享</view>
			<view class="LoginSmallH">放大你的朋友圈价值</view>
		</view>
		<!-- 登录账号密码窗口 -->
		<view class="LoginBody">
			<view class="LoginUser_NH">账号</view>
			<input class="LoginUser_N" type="number" v-model="LoginUser_N" maxlength="11" placeholder="请输入手机号码" />
			<view class="LoginUser_PW">
			<view class="LoginUser_PH">密码</view>
			<input :type="PwType" class="LoginUser_P" v-model="LoginUser_P" placeholder="请输入密码" />
			<image src="../../static/loginImg/open_eyes.png" mode="" class="eyes" :style="{display:open_eyesDisplay}" @click="close_eyes"></image>
			<image src="../../static/loginImg/close_eyes.png" mode="" class="eyes" :style="{display:close_eyesDisplay}" @click="open_eyes"></image>
			<view  class="forget" @click="forgetPw">忘记密码？</view>
			</view>
			<view class="LoginSubmit" @click="LoginSubmit">登录</view>
			<view class="reg" @click="regClick">账号注册</view>
			<view class="theThree">第三方登录</view>
			<image src="../../static/loginImg/login_weixin.png" mode="" class="loginWechat"></image>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				//密码显示或不显示
				PwType:"password",
				open_eyesDisplay:"display",
				close_eyesDisplay:"none",
				
				//账号密码值
				LoginUser_N:"",
				LoginUser_P:""
			}
		},
		onLoad() {
	
		},
		methods: {
	             close_eyes(){
					 this.PwType="text";
					 this.open_eyesDisplay="none";
					 this.close_eyesDisplay="block";
				 },
				 open_eyes(){
					 this.PwType="password";
					 this.open_eyesDisplay="block";
					 this.close_eyesDisplay="none";
				 },
				 forgetPw(){
				     uni.navigateTo({
				     	url:"../forget/forget"
				     })
				 },
				 regClick(){
					 uni.navigateTo({
					 	url:"../reg/reg"
					 })
				 },
				 LoginSubmit(){
					 if(this.LoginUser_N==""||this.LoginUser_P==""){
						  uni.showToast({
						 			icon:"none",
						 			title:"账号密码不能为空"
						 })
					 }else{
						uni.showToast({
							})
					 }
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
		width: 750rpx;
		position: relative;
	}
	/* 登陆界面头部样式 */
	.LoginHead{
		width: 750rpx;
		height: 100rpx;
		margin-top: 72rpx;
		position: relative;
		box-sizing: border-box;
	}
	.LoginBigH{
		position: absolute;
		left: 30rpx;
		top: 0;
		font-size:44rpx;
		font-family:PingFangSC-Semibold;
		font-weight:600;
		color:rgba(51,51,51,1);
		line-height:44rpx;
	}
	.LoginSmallH{
		position: absolute;
		left: 30rpx;
		bottom: 0;
		font-size:28rpx;
		font-family:PingFangSC-Medium;
		font-weight:500;
		color:rgba(189,189,189,1);
		line-height:32rpx;
	}
	/* 登录账号密码窗口样式 */
	.LoginBody{
	    width: 750rpx;
		box-sizing: border-box;
		padding-left: 68rpx;
		padding-top: 88rpx;
		padding-right: 64rpx;
	}
	.LoginBody .LoginUser_NH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.LoginUser_N{
	    font-size:32rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		line-height:32rpx;
		border-bottom: 1px solid #eee;
		margin-top: 34rpx;
		padding-bottom: 20rpx;
		padding-right: 70rpx;
		color:rgba(74,74,74,1);
		width: 550rpx;
	}
	.LoginUser_PW{
		position: relative;
	}
	.LoginUser_PH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
		margin-top: 40rpx; 
	}
	.LoginUser_P{
		font-size:32rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		line-height:32rpx;
		padding-bottom: 20rpx;
		border: 0;
		width: 550rpx;
		border-bottom: 1px solid #eee;
		margin-top: 34rpx;
		padding-right: 70rpx;
		color: #4A4A4A;
		outline: none;
	}
	.eyes{
		width: 60rpx;
		height: 32rpx;
		position: absolute;
		right: 0;
		bottom: 30rpx;
	}
	.forget{
		font-size:26rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(36,205,220,1);
		line-height:36rpx;
		position: absolute;
		bottom: -72rpx;
		right: 0;
	}
	.LoginSubmit{
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
	.LoginSubmit:active{
		background-color: #07B5A7;
	}
	.reg{
	    font-size:28rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(44,206,221,1);
		line-height:28rpx;
		bottom: -318rpx;
		left: 50%;
		position: absolute;
		transform: translateX(-50%);
	}
	.theThree{
		font-size:26rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(189,189,189,1);
		line-height:36rpx;
		left: 50%;
		position: absolute;
		transform: translateX(-50%);
		bottom: -470rpx;
	}
	.loginWechat{
		width: 80rpx;
		height: 80rpx;
		left: 50%;
		position: absolute;
		transform: translateX(-50%);
		bottom: -558rpx;
	}
</style>
