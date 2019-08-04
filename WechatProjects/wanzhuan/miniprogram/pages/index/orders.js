// pages/index/orders.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  to_obligation:function(){
    wx.redirectTo({
      url: 'orders_obligation',
    })
  },
  to_Shipped:function(){
    wx.redirectTo({
      url: 'orders_Shipped',
    })
  },
  to_Incoming: function () {
    wx.redirectTo({
      url: 'orders_Incoming',
    })
  },
  to_received: function () {
    wx.redirectTo({
      url: 'orders_received',
    })
  },

  data: {
    goods_name_1:"",
    goods_price_1:"",
    goods_name_2: "",
    goods_price_2: "",
    goods_name_3: "",
    goods_price_3: "",
    goods_name_4: "",
    goods_price_4: "",
    goods_name_5: "",
    goods_price_5: "",
    goods_image_1:"",
    goods_image_2: "",
    goods_image_3: "",
    goods_image_4: "",
    goods_image_5: "",
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
    goods_name_1:app.orders_thing_1.orderGoods[0].goods_name,
    goods_price_1:app.orders_thing_1.orderGoods[0].price,
    goods_name_2: app.orders_thing_2.orderGoods[0].goods_name,
    goods_price_2: app.orders_thing_2.orderGoods[0].price,
    goods_name_3: app.orders_thing_3.orderGoods[0].goods_name,
    goods_price_3: app.orders_thing_3.orderGoods[0].price,
    goods_name_4: app.orders_thing_4.orderGoods[0].goods_name,
    goods_price_4: app.orders_thing_4.orderGoods[0].price,
    goods_name_5: app.orders_thing_5.orderGoods[0].goods_name,
    goods_price_5: app.orders_thing_5.orderGoods[0].price,
      goods_image_1: "https://www.wanzhuanshop.com/frontend/web/"+app.orders_thing_1.orderGoods[0].goods_image,
      goods_image_2: "https://www.wanzhuanshop.com/frontend/web/" + app.orders_thing_2.orderGoods[0].goods_image,
      goods_image_3: "https://www.wanzhuanshop.com/frontend/web/" + app.orders_thing_3.orderGoods[0].goods_image,
      goods_image_4: "https://www.wanzhuanshop.com/frontend/web/" + app.orders_thing_4.orderGoods[0].goods_image,
      goods_image_5: "https://www.wanzhuanshop.com/frontend/web/" + app.orders_thing_5.orderGoods[0].goods_image
  })
    console.log(app.orders_thing_1.orderGoods[0].goods_image)
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})