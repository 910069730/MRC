<template>
	<view class="content">
		<!-- <image src="../../static/forgetImg/login_return.png" mode="" class="loginReturn"></image> -->
		<!-- 忘记密码界面头部 -->
		<view class="forgetHead">
			<view class="forgetBigH">忘记密码</view>
		</view>
		<!-- 忘记密码窗口 -->
		<view class="forgetBody">
			<view class="forget_NextBody" :style="{display:forget_NextBodyDisplay}">
		    	<view class="forgetUser_NH">手机号码</view>
		    	<input class="forgetUser_N" type="number" v-model="forget_N"  maxlength="11" placeholder="请输入手机号码" />
		    	<view class="forgetUserCode">
		    	<view class="forgetUser_CodeH">验证码</view>
		    	<input type="text" class="forgetUser_Code" v-model="forget_C" placeholder="输入验证码登录" />
				<view class="getCode">获取验证码</view>
		    	</view>
			</view>
			<view class="forget_FinshBody" :style="{display:forget_FinshBodyDisplay}">
				<view class="forget_Set_N">设置新密码</view>
				<input :type="PwType" class="SetUser_P" placeholder="请输入新密码(8位数以上数字+字母)" />
				<image src="../../static/loginImg/open_eyes.png" mode="" class="eyes" :style="{display:open_eyesDisplay}" @click="close_eyes"></image>
				<image src="../../static/loginImg/close_eyes.png" mode="" class="eyes" :style="{display:close_eyesDisplay}" @click="open_eyes"></image>
			</view>
		    	<view class="next" @click="forgetNext" v-if="next">下一步</view>
				<view class="finish" v-if="ok" >完成</view>
		</view>
		
	</view>
</template>

<script>
		export default {
		data() {
			return {
				forget_NextBodyDisplay:"block",
				forget_FinshBodyDisplay:"none",
				next:true,
				ok:false,
				forget_N:"",
				forget_C:"",
				
				//密码显示或不显示
				PwType:"password",
				open_eyesDisplay:"block",
				close_eyesDisplay:"none",
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
			
	                   forgetNext(){
						   if(this.forget_N!=""&&this.forget_C!=""){
							  this.next=false;  
							  this.ok=true;
							  this.forget_NextBodyDisplay="none";
							  this.forget_FinshBodyDisplay="block";
						   }else{
							   uni.showToast({
							       icon: 'none',
							       title: '您输入有误，请重新输入'
							   });
						   }
					   }
		}
	}
</script>

<style>
/* 	.loginReturn{
		position: absolute;
		width: 46rpx;
		height: 40rpx;
		left: 30rpx;
		top: -104rpx;
	} */
	/* 忘记密码界面头部样式 */
	.forgetHead{
		width: 750rpx;
		height: 100rpx;
		margin-top: 72rpx;
		position: relative;
		box-sizing: border-box;
	}
	.forgetBigH{
		position: absolute;
		left: 30rpx;
		top: 0;
		font-size:44rpx;
		font-family:PingFangSC-Semibold;
		font-weight:600;
		color:rgba(51,51,51,1);
		line-height:44rpx;
	}
	
	/* 忘记密码窗口样式 */
	.forgetBody{
	    width: 750rpx;
		box-sizing: border-box;
		padding-left: 68rpx;
		padding-top: 88rpx;
		padding-right: 64rpx;
		position: relative;
	}
	.forgetBody .forgetUser_NH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.forgetUser_N{
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
	.forgetUserCode{
		position: relative;
	}
	.forgetUser_CodeH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
		margin-top: 40rpx; 
	}
	.forgetUser_Code{
		font-size:32rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		line-height:32rpx;
		padding-bottom: 20rpx;
		border-bottom: 1px solid #eee;
		margin-top: 34rpx;
		padding-right: 70rpx;
		color: #4A4A4A;
	}
	.getCode{
	    position: absolute;
		bottom: 30rpx;
		right: 0;
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(44,206,221,1);
		line-height:32rpx;
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
	.finish{
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
	.finish:active{
		background-color: #07B5A7;
	}
	
	.forget_Set_N{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.SetUser_P{
		font-size:32rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		line-height:32rpx;
		padding-bottom: 20rpx;
		border-bottom: 1px solid #eee;
		margin-top: 34rpx;
		padding-right: 70rpx;
		color: #4A4A4A;
	}
	.eyes{
		width: 60rpx;
		height: 32rpx;
		position: absolute;
		right: 0;
		bottom: 30rpx;
	}
	.forget_FinshBody{
		position: relative;
	}
</style>
