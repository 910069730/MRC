// pages/index/shopCollection.js
Page({

  /**
   * 页面的初始数据
   */
  cancel_one: function () {
    this.setData({
    canceltheone:"none"
    })
  },
  cancel_two: function () {
    this.setData({
    cancelthetwo: "none"
    })
  },
  cancel_three: function () {
    this.setData({
      cancelthethree: "none"
    })
  },
  cancel_four: function () {
    this.setData({
      cancelthefour: "none"
    })
  },
  cancel_five: function () {
    this.setData({
    cancelthefive: "none"
    })
  },
  cancel_six: function () {
    this.setData({
      cancelthesix: "none"
    })
  },
  cancel_seven: function () {
    this.setData({
      canceltheseven: "none"
    })
  },
  shopCollection_change:function(){
    this.setData({
      showCancel:"block",
      change_do:"取消编辑",
      shopCollection_change:"shopCollection_return"
    })
  },
  shopCollection_return:function(){
    this.setData({
      showCancel: "none",
      change_do: "编辑",
      shopCollection_change: "shopCollection_change"
    })
  },
  data: {
    change_do:"编辑",
    shopCollection_change:"shopCollection_change"
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    
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