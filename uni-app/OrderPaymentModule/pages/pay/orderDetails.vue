<template>
	<view class="content">
										
		<!-- 背景底色设置 -->
		<view class="c_bg"></view>
		
		<!-- 订单详情页面头部模块 -->
		      <!-- 订单状态头部 -->
		<view class="c_OrdersStateHead" :style="{display:c_OrdersStateHeadDisplay}">
			<image :style="{display:c_WaitingPaymentImg}" src="../../static/payImages/WaitingPaymentImage.png" mode="" ></image>
			<image :style="{display:c_SuccessCancelImg}" src="../../static/payImages/successCancelOrders.png" mode="" @click="c_SuccessCancelImgClick"></image>
			<image :style="{display:c_PayPackImg}" src="../../static/payImages/payPack.png" mode=""></image>
		</view>
		
		<!-- 商品打包中模块 -->
		<view class="c_pack" :style="{display:c_packDisplay}">
			<view class="c_packContent">
				<image src="../../static/payImages/packCar.png" mode=""></image>
				<text>商品打包中</text>
				<image class="c_packRightBtn" src="../../static/payImages/rightBtn.png" mode=""></image>
				<view class="c_packContentTime">{{c_packData}}{{c_packTime}}</view>
			</view>
		</view>
		
		<!-- 订单详情页面地址模块 -->
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
		
		<!-- 订单详情页面付款商品模块 -->
		<template  v-for="(goods,goodsIndex) in allGoods" >
		<view class="c_WaitingPaymentGoods" :style="{display:c_WaitingPaymentGoodsDisplay}">
			<image src="../../static/payImages/shopImage_07.png" mode="" class="c_shopImage"></image>
			<text class="c_shopName">店铺名称</text>
			<image src="../../static/payImages/rightBtn.png" mode="" class="c_shopRightBtn"></image>
			<image :src="goods.image" mode="" class="c_shopGoodsImage"></image>
			<text class="c_shopGoodsName">{{goods.name}}</text>
			<text class="c_shopGoodsAttribute">{{goods.type}}</text>
			<text class="c_shopGoodsPrice">￥<text>{{goods.price}}</text></text>
			<view class="c_WaitingPaymentGoodsTotalPrice">
				   <text class="c_WaitingPaymentGoodsTotalPriceTitle">商品总价</text>
				   <text class="c_WaitingPaymentGoodsTotalPriceMoney">￥<text>{{goods.TotalPriceMoney}}</text></text>
			</view>
			<view class="c_WaitingPaymentGoodsFreight">
				   <text class="c_WaitingPaymentGoodsFreightTitle">运费</text>
				   <text class="c_WaitingPaymentGoodsFreightMoney">￥<text>{{goods.FreightMoney}}</text></text>
			</view>
			<view class="c_WaitingPaymentGoodsCoupon">
				   <text class="c_WaitingPaymentGoodsCouponTitle">优惠卷</text>
				   <text class="c_WaitingPaymentGoodsCouponMoney">-￥<text>{{goods.CouponMoney}}</text></text>
			</view>
			<view class="c_WaitingPaymentGoodsDisbursements">
				   <text class="c_WaitingPaymentGoodsDisbursementsTitle">实付款</text>
				   <text class="c_WaitingPaymentGoodsDisbursementsMoney">￥<text>{{goods.DisbursementsMoney}}</text></text>
			</view>
		</view>
		
		<!-- 订单编号及下单时间及联系客服模块 -->
		<view class="c_OrderNumber" :style="{display:c_OrderNumberDisplay}">
			<view class="c_OrderNumbers">
				<text>订单编号&nbsp;&nbsp;&nbsp;&nbsp;{{goods.OrderNumber}}</text>
				<image src="../../static/payImages/copy.png" mode="" class="c_OrderNumbersCopy"></image>
			</view>
			<view class="c_OrderTime">
				<text>下单时间&nbsp;&nbsp;&nbsp;&nbsp;{{goods.data}}&nbsp;&nbsp;{{goods.time}}</text>
			</view>
			<view class="c_OrderLine"></view>
			<view class="c_OrderContact">
				<image src="../../static/payImages/contact.png" mode=""></image>
				<text>联系客服</text>
			</view>
		</view>
		</template>
		
		<!-- 支付成功模块 -->
		<view class="c_paySuccess" :style="{display:c_paySuccessDisplay}">
		<image src="../../static/payImages/paySuccessImage.png" mode="" class="c_paySuccess">
		</image>
		   <view class="c_viewOrder" @click="c_viewOrderClick">
			<text>查看订单</text>
		   </view>
		   <view class="c_returnIndex">
		   	<text>返回首页</text>
		   </view>
		</view>

        <!-- 为你推荐模块 -->
            <!-- 为你推荐模块（标题） -->
        <view class="c_recommendHead">
        	<view class="c_recommendHeadLine">
        		<view class="c_recommendHeadTitle">为您推荐</view>
        	</view>
        	<text>RECOMMENDATION</text>
        </view>
            <!-- 为你推荐模块（内容） -->
        <view class="c_recommendBody" >
        	<!-- 推荐商品  -->
        	<view class="c_recommendBodyGoods" v-for="(recommendGoods,recommendIndex) in recommendAllGoods">
        		<image :src="recommendGoods.image" mode="" class="c_recommendBodyGoodsImage"></image>
        		<view class="c_recommendGoodsName">{{recommendGoods.name}}</view>
        		<view class="c_recommendGoodsPrice">
        			<text class="c_recommendGoodsPriceNow">¥<text>{{recommendGoods.NowPrice}}</text></text>
        			<text class="c_recommendGoodsPriceAgo">¥<text>{{recommendGoods.AgoPrice}}</text></text>
        		</view>
        	</view>
        </view>
		
		  <!-- 底部空留位置模块 -->
		<view style="width: 750rpx;height: 100rpx;" ></view>
		
		<!-- 底部支付订单及取消订单等模块 -->
		<view class="c_Payment_or_Cancel_or_Others" :style="{display:c_BottomDisplay}">
			<view class="c_Payment" :style="{display:c_Payment}" @click="c_PaymentOrders">立即支付</view>
			<view class="c_Sure" :style="{display:c_Sure}" @click="c_SureOrders">确认收货</view>
			<view class="c_See" :style="{display:c_See}" @click="c_SeeOrders">查看物流</view>
			<view class="c_Cancel" :style="{display:c_Cancel}" @click="c_CancelOrders">取消订单</view>
			<view class="c_Delete" :style="{display:c_Delete}" @click="c_DeleteOrders">删除订单</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {  
				      // 订单头部状态展示图属性及显示
					 c_OrdersStateHeadDisplay:"block",
				     c_WaitingPaymentImg:"block",
					 c_SuccessCancelImg:"none",
					 c_PayPackImg:"none",
					 
					  //商品打包及打包时间信息及显示
					  c_packData:"2019-07-26"+" ",
					  c_packTime:"18:00:00",
					  c_packDisplay:"none",
					  
					  //地址模块信息属性及显示
					  c_WaitingPaymentAddressDisplay:"flex",
					  Addresses:[
						  {
							  PeopleName:"王某某",
							  PeopleNumber:"190 9098 0987",
							  PeopleAddress:"上海  上海市  浦东新区  陆家嘴街道商城路738"+" 号胜康廖氏大厦807"
						  }
					  ],
					  
					  //商品信息属性及显示
					  c_WaitingPaymentGoodsDisplay:"block",
					  c_OrderNumberDisplay:"block",
					  allGoods:[
						  {
							  name:"小米手机全新发布 红米pro 续航...",
							  type:"颜色分类：蓝色；内存：62g",
							  price:"1800.00",
							  image:"../../static/payImages/goodsImage.png",
							  TotalPriceMoney:"1800.00",
							  FreightMoney:"0.00",
							  CouponMoney:"0.00",
							  DisbursementsMoney:"1800.00",
							  OrderNumber:"65387988498509896",
							  data:"2019-07-26",
							  time:"18:00:00"
							  
						  }
					  ],
					  
					  // 支付成功模块展示显示
					  c_paySuccessDisplay:"none",
					  
					  //推荐商品属性
					  recommendAllGoods:[
						  {
							  image:"../../static/payImages/recommendGoodsImageOne.png",
							  name:"全棉花卉夏被清新纯棉...",
							  NowPrice:"88.00",
							  AgoPrice:"168.00"
						  },
						  {
						  	  image:"../../static/payImages/recommendBodyGoodsImageTwo.png",
						  	  name:"全棉花卉夏被清新纯棉...",
						  	  NowPrice:"88.00",
						  	  AgoPrice:"168.00"
						  }
					  ],
					  
					  //控制固定的底栏是否展示
					  c_BottomDisplay:"block",
					  
					  // 底部按钮显示样式属性
					  c_See:"none",             //查看物流
					  c_Cancel:"block",          //取消订单
					  c_Sure:"none",            //确认收货
					  c_Payment:"block",         //立即支付
					  c_Delete:"none"           //删除订单
					  
			}
		},
		onLoad() {
            
		
		},
		methods: {
			       //点击取消订单后的状态效果
			        c_CancelOrders(){
						this.c_WaitingPaymentImg="none";
						this.c_SuccessCancelImg="block";
						this.c_PayPackImg="none";
						this.c_packDisplay="none";
						
						this.c_Cancel="none";
						this.c_Payment="none";
						this.c_Delete="block";
						this.c_See="none";
						this.c_Sure="none";
					},
					//成功取消订单后点击购买回到等待付款状态
					c_SuccessCancelImgClick(){
						this.c_WaitingPaymentImg="block";
						this.c_SuccessCancelImg="none";
						this.c_PayPackImg="none";
						
						this.c_Cancel="block";
						this.c_Payment="block";
						this.c_Delete="none";
					},
					//点击立即支付后的状态效果
					c_PaymentOrders(){
						this.c_OrdersStateHeadDisplay="none";
						this.c_WaitingPaymentAddressDisplay="none";
						this.c_WaitingPaymentGoodsDisplay="none";
						this.c_OrderNumberDisplay="none";
						this.c_paySuccessDisplay="block";
						this.c_BottomDisplay="none";
					},
					//支付成功后点击查看订单的状态效果
					c_viewOrderClick(){
					    this.c_paySuccessDisplay="none";
						this.c_OrdersStateHeadDisplay="block";
						this.c_WaitingPaymentImg="none";
						this.c_PayPackImg="block";
						this.c_packDisplay="block";
						this.c_WaitingPaymentAddressDisplay="flex";
						this.c_WaitingPaymentGoodsDisplay="block";
						this.c_OrderNumberDisplay="block";
						this.c_BottomDisplay="block";
						
						this.c_Payment="none";
						this.c_See="block";
						this.c_Sure="block";
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
	
	/* 订单状态头部模块样式 */
	.c_OrdersStateHead{
		width:690rpx;
        height:150rpx;
		border-radius:16rpx;
		position: relative;
	}	
	.c_OrdersStateHead image{
	    width: 100%;
		height: 100%;
	}
    .c_OrdersStateLimitTime{
		font-size:28rpx;
		font-family:PingFang-SC-Bold;
		font-weight: bold;
		color: #FCEBD4;
		position: absolute;
		left: 120rpx;
		bottom: 37rpx;
	}
	
	/* 商品打包中模块 */
	.c_pack{
		width: 690rpx;
		height: 140rpx;
		margin-top: 30rpx;
		background:rgba(255,255,255,1);
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		position: relative;
	}
	.c_packContent{
		position: absolute;
		left: 0;
		top: 40rpx;
		width: 690rpx;
		height: 40rpx;
		padding: 0 25rpx 0;
		box-sizing: border-box;
		
	}
	.c_packContent image{
		width: 31rpx;
		height: 27rpx;
		float: left;
		margin-top: 7rpx;
	}
	.c_packContent text{
		font-size:28rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(18,18,18,1);
		margin-left: 24rpx;
		float: left;
	}
	.c_packContent .c_packRightBtn{
		width: 12rpx;
		height: 21rpx;
		position: absolute;
		right: 30rpx;
		top:50%;
		transform: translateY(-50%);
	}
	.c_packContentTime{
		width: 450rpx;
		height: 30rpx;
		position: absolute;
		left: 75rpx;
		bottom: -35rpx;
		font-size:24rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(153,153,153,1);
		white-space: normal;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	/* 订单详情页面地址模块样式 */
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
	
	/* 订单详情页面地址模块样式(左侧地址图片样式) */
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
	    /* 订单详情页面地址模块样式(右间详细信息样式) */
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
     /* 订单详情页面切换地址样式 */
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
	
	/* 订单详情页面付款商品模块 */
	.c_WaitingPaymentGoods{
	    width:690rpx;
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
	.c_WaitingPaymentGoodsTotalPrice{
		width: 690rpx;
		height: 80rpx;
		margin-top: 280rpx;
		box-sizing: border-box;
		padding-left: 70rpx;
		padding-right: 50rpx;
	}
	.c_WaitingPaymentGoodsTotalPriceTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		float: left;
	}
	.c_WaitingPaymentGoodsTotalPriceMoney{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(136,136,136,1);
		line-height:30rpx;
		float: right;
	}
	.c_WaitingPaymentGoodsTotalPriceMoney text{
		font-family: SanFranciscoDisplay-Regular;
	}
	.c_WaitingPaymentGoodsFreight{
		width: 690rpx;
		height: 80rpx;
		box-sizing: border-box;
		padding-left: 70rpx;
		padding-right: 50rpx;
	}
	.c_WaitingPaymentGoodsFreightTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		float: left;
	}
	.c_WaitingPaymentGoodsFreightMoney{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(136,136,136,1);
		line-height:30rpx;
		float: right;
	}
	.c_WaitingPaymentGoodsFreightMoney text{
		font-family: SanFranciscoDisplay-Regular;
	}
	.c_WaitingPaymentGoodsCoupon{
		width: 690rpx;
		height: 80rpx;
		box-sizing: border-box;
		padding-left: 70rpx;
		padding-right: 50rpx;
	}
	.c_WaitingPaymentGoodsCouponTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		float: left;
	}
	.c_WaitingPaymentGoodsCouponMoney{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(136,136,136,1);
		line-height:30rpx;
		float: right;
	}
	.c_WaitingPaymentGoodsCouponMoney text{
		font-family: SanFranciscoDisplay-Regular;
	}
	.c_WaitingPaymentGoodsDisbursements{
		width: 690rpx;
		height: 80rpx;
		box-sizing: border-box;
		padding-left: 70rpx;
		padding-right: 50rpx;
	}
	.c_WaitingPaymentGoodsDisbursementsTitle{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		line-height:36rpx;
		float: left;
	}
	.c_WaitingPaymentGoodsDisbursementsMoney{
		font-size:36rpx;
		font-family:PingFang-SC-Regular;
		font-weight:400;
		color:rgba(255,51,33,1);
		line-height:30rpx;
		float: right;
	}
	.c_WaitingPaymentGoodsDisbursementsMoney text{
		font-family: SanFranciscoDisplay-Regular;
	}
	
	/* 订单编号及下单时间及联系客服模块样式 */
	.c_OrderNumber{
		width: 690rpx;
		height: 240rpx;
		background:rgba(255,255,255,1);
		box-shadow:0rpx 0rpx 10rpx 0rpx rgba(0, 0, 0, 0.15);
		border-radius:16rpx;
		margin-top: 20rpx;
	}
	.c_OrderNumbers{
		width: 690rpx;
		height: 70rpx;
		margin-top: 30rpx;
		line-height: 70rpx;
		box-sizing: border-box;
		padding-left: 44rpx;
	}
	.c_OrderNumbers text{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
		float:left;
	}
	.c_OrderNumbersCopy{
		width: 68rpx;
		height: 30rpx;
		margin-left: 20rpx;
	}
	.c_OrderTime{
		width: 690rpx;
		height: 70rpx;
		line-height: 70rpx;
		box-sizing: border-box;
		padding-left: 44rpx;
	}
	.c_OrderTime text{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,45,45,1);
	}
	.c_OrderLine{
		width:650rpx;
		height:1rpx;
		background:rgba(240,240,240,1);
		margin: 1rpx auto ;
	}
	.c_OrderContact{
		width: 690rpx;
		height: 70rpx;
		line-height: 60rpx;
		box-sizing: border-box;
		text-align: center;
	}
	.c_OrderContact image{
		width: 28rpx;
		height: 31rpx;
		vertical-align: middle;
	}
	.c_OrderContact text{
		font-size:26rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(46,105,255,1);
		margin-left: 20rpx;
	}
	
	/* 支付成功模块样式 */
	.c_paySuccess{
		width: 690rpx;
		height: 443rpx;
	    border-radius:16rpx;
		position: relative;
	}
	.c_viewOrder{
		width: 180rpx;
		height: 58rpx;
		background:rgba(255,183,0,1);
	    border-radius:4px;
		position: absolute;
		left: 132rpx;
		bottom: 72rpx;
		text-align: center;
	}
	.c_viewOrder text{
		font-size:28rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(255,255,255,1);
		line-height:58rpx;
	}
	.c_returnIndex{
		width: 180rpx;
		height: 58rpx;
		background:rgba(255,255,255,1);
		border-radius:4px;
		position: absolute;
		right: 132rpx;
		bottom: 72rpx;
		text-align: center;
	}
	.c_returnIndex text{
		font-size:28rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(241,167,61,1);
		line-height:36rpx;
	}
	
	/* 为你推荐模块样式 */
	      /* 为你推荐模块(头部)样式 */
	.c_recommendHead{
		width: 420rpx;
		height: 153rpx;
		text-align: center;
	}
	.c_recommendHeadLine{
		height: 87rpx;
		width: 420rpx;
		border-bottom: 5rpx solid rgba(0,0,0,1);
		position: relative;
		font-size:36rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(18,18,18,1);
	}
	.c_recommendHeadTitle{
		width: 202rpx;
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom:-15rpx;
		background-color: #F8F8F8;
	}
	.c_recommendHead text{
		font-size:20rpx;
		font-family:Roboto-Thin;
		font-weight:100;
		color:rgba(18,18,18,1);
	}
	      /* 为你推荐模块(内容)样式 */
	.c_recommendBody{
		width: 690rpx;
		padding-top: 40rpx;
		padding-bottom: 40rpx;
	}
	.c_recommendBody::after{
		content: '';
		height: 0;
		display: block;
		clear: both;
		visibility: hidden;
	}
	.c_recommendBodyGoods{
		width: 336rpx;
		height: 446rpx;
		background:rgba(255,255,255,1);
	    border-radius:16rpx;
		float: left;
		text-align: center;
		margin-bottom: 20rpx;
	}
	.c_recommendBodyGoods:nth-child(even){
		float: right;
	}
	.c_recommendBodyGoodsImage{
		width: 320rpx;
		height: 202rpx;
		margin: 70rpx auto;
	}
	.c_recommendGoodsName{
		font-size:26rpx;
		font-family:PingFang-SC-Bold;
		font-weight:bold;
		color:rgba(18,18,18,1);
		line-height:15rpx;
		margin-left: 15rpx;
		margin-bottom: 20rpx;
		text-align: left;
	}
	.c_recommendGoodsPrice{
		margin-left: 15rpx;
		text-align: left;
	}
	.c_recommendGoodsPriceNow{
	    font-size:22rpx;
		font-family:ArialMT;
		font-weight:400;
		color:rgba(255,33,60,1);
		line-height:15rpx;
	}
	.c_recommendGoodsPriceNow text{
		font-family: Arial-BoldMT;
		font-weight: bold;
		font-size: 28rpx;
	}
	.c_recommendGoodsPriceAgo{
		font-size:22rpx;
	    font-family:ArialMT;
	    font-weight:400;
	    color:#BBBBBB;
		line-height:15rpx;
		margin-left: 5rpx;
	}
	.c_recommendGoodsPriceAgo text{
		font-family: Arial-BoldMT;
		font-weight: bold;
		font-size: 28rpx;
	}
	
	/* 底部支付订单及取消订单等模块样式 */
	.c_Payment_or_Cancel_or_Others{
		width: 750rpx;
		height: 84rpx;
		background:rgba(255,255,255,1);
		position: fixed;
		bottom: 0;
		left: 50%;
		transform: translateX(-50%);
	}
	.c_Payment{
		width: 130rpx;
		height: 44rpx;
		line-height: 44rpx;
		text-align: center;
		background:rgba(255,183,0,1);
        border-radius:4rpx;
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,255,255,1);
		margin-top: 20rpx;
		margin-right: 30rpx;
		float: right;
	}
	.c_Cancel{
		width: 140rpx;
		height: 44rpx;
		box-sizing: border-box;
		background:rgba(255,255,255,1);
		border:2rpx solid rgba(136,136,136,1);
		border-radius:4rpx;
		text-align: center;
		line-height: 44rpx;
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(136,136,136,1);
		margin-top: 20rpx;
		margin-right: 30rpx;
		float: right;
	}
	.c_Delete{
		width: 140rpx;
		height: 44rpx;
		box-sizing: border-box;
		background:rgba(255,255,255,1);
		border:2rpx solid rgba(136,136,136,1);
		border-radius:4rpx;
		text-align: center;
		line-height: 44rpx;
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(136,136,136,1);
		margin-top: 20rpx;
		margin-right: 30rpx;
		float: right;
	}
	.c_See{
		width: 140rpx;
		height: 44rpx;
		box-sizing: border-box;
		background:rgba(255,255,255,1);
		border:2rpx solid rgba(136,136,136,1);
		border-radius:4rpx;
		text-align: center;
		line-height: 44rpx;
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(136,136,136,1);
		margin-top: 20rpx;
		margin-right: 30rpx;
		float: right;
	}
	.c_Sure{
		width: 130rpx;
		height: 44rpx;
		line-height: 44rpx;
		text-align: center;
		background:rgba(255,183,0,1);
		border-radius:4rpx;
		font-size:20rpx;
		font-family:PingFang-SC-Medium;
		font-weight:500;
		color:rgba(255,255,255,1);
		margin-top: 20rpx;
		margin-right: 30rpx;
		float: right;
	}
</style>
