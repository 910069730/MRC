<template>
	<view class="content">
		<!-- 注册账号界面头部 -->
		<view class="regHead">
			<view class="regBigH">账号注册</view>
		</view>
		
		<!-- 注册窗口 -->
		<view class="regBody">
	          <view class="reg_NextBody" :style="{display:reg_NextBodyDisplay}">
	          	<view class="regUser_NH">手机号码</view>
	          	<input class="regUser_N" type="number" v-model="reg_N"  maxlength="11" placeholder="请输入手机号码" />
	          	<view class="regUserCode">
	          	<view class="regUser_CodeH">验证码</view>
	          	<input type="text" class="regUser_Code" v-model="reg_C" placeholder="输入验证码登录" />
	          	<view class="getCode">获取验证码</view>
	          	</view>
	          </view>
			  <view class="reg_FinshBody" :style="{display:reg_FinshBodyDisplay}">
			  	<view class="reg_Set_N">设置密码</view>
			  	<input type="password" class="SetUser_P" placeholder="请输入新密码(8位数以上数字+字母)" />
				<view class="reg_Set_N reg_Set_N2">再次设置密码</view>
				<input type="password" class="SetUser_P"  />
			  </view>
			  <view class="next" @click="regNext" v-if="next">下一步</view>
			  <view class="finish" v-if="ok">完成</view>
		</view>
		
		<view :style="{display:agreementDisplay}">
		<view class="regRead">登录即表示您已阅读，理解并同意</view>
		<view class="agreement">《菜鸟网络服务协议》 《流光会员用户使用协议》</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				reg_NextBodyDisplay:"block",
				reg_FinshBodyDisplay:"none",
				agreementDisplay:"block",
				reg_N:"",
				reg_C:"",
			    next:true,
				ok:false
			}
		},
		onLoad() {

		},
		methods: {
                              regNext(){
						   if(this.reg_N!=""&&this.reg_C!=""){
							  this.next=false;  
							  this.ok=true;
							  this.reg_NextBodyDisplay="none";
							  this.reg_FinshBodyDisplay="block";
							  this.agreementDisplay="none";
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
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	
	/* 注册账号界面头部样式 */
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
		padding-top: 88rpx;
		padding-right: 64rpx;
		position: relative;
	}
	.regBody .regUser_NH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.regUser_N{
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
	.regUserCode{
		position: relative;
	}
	.regUser_CodeH{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
		margin-top: 40rpx; 
	}
	.regUser_Code{
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
	.regRead{
		font-size:24rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:34rpx;
		position: fixed; 
		bottom: 104rpx;
		left: 50%;
		transform: translateX(-50%);
	}
	.agreement{
		font-size:24rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(44,206,221,1);
		white-space: nowrap;
		line-height:34rpx;
		bottom: 58rpx;
		position: fixed;
		left: 50%;
		transform: translateX(-50%);
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
	
	.reg_Set_N{
		font-size:30rpx;
		font-family:PingFangSC-Regular;
		font-weight:400;
		color:rgba(155,155,155,1);
		line-height:32rpx;
	}
	.reg_Set_N2{
	    margin-top:40rpx;
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
</style>