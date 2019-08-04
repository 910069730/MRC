// pages/index/wanzhuan.js
const app = getApp()
Page({

  /**
   * 页面的初始数据
   */
  data: {
    account:'',
    password:'',
    // message:''
  },
  focusPhone:function(){
    this.setData({
      color: "#000"
    })
  },
  blurPhone: function () {
    this.setData({
      color: "#C0C0C0"
    })
  },
  focusPw: function () {
    this.setData({
      color: "#000"
    })
  },
  blurPw: function () {
    this.setData({
      color: "#C0C0C0"
    })
  },
  phoneNumberInput: function (e) {
    this.setData({
      account: e.detail.value
    })
  },
  passWdInput: function (e) {
    this.setData({
      password: e.detail.value
    })
  },
  dengluclick: function (e,data) {
    console.log("用户名" + this.data.account + " 密码：" + this.data.password);
      var that=this
      wx.request({
        url: "http://car.duobaomi.net/api/user/login",
        data:{
          account: this.data.account,
          password: this.data.password
        },
        header: {
          // "Content-Type":"application/json"
        },
        success: function (res) {
          // console.log(res.data);
          if (res.data.msg == "账户或密码错误！" || res.data.msg =="参数不正确"){
            //判断手机号或密码不正确则出现弹框
            that.setData({
           display:"block"
            })
            //控制台输出账号密码
            console.log(res.data);
          }else{
            wx.redirectTo({
              url: 'wanzhuanindex',
            })
            //控制台输出账号密码
            console.log(res.data);
            console.log(that.data);
            app.user_info.phone=that.data.account
            console.log(app.user_info.phone);    //输出为手机号
            // localStorage.setItem("user_name", that.data.account)
            wx.setStorage({
              key: 'bob',
              data: app.user_info.phone,
              success:function(){
                wx.showToast({
                  title: '登录成功',
                })
              }
            })
            console.log(res.data.msg)
          }
        },
        fail: function (err) {
          console.log(err)
        }

      }) 

    // }
  },
  displayone:function(){
    this.setData({
      display: "none"
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   var those=this
    var that = this;
    wx.getStorage({
      key: 'bob',
      success: function (res) {
        console.log(res);
        // that.setData({
        //   name: res.data
        // })
        wx.redirectTo({
          url: 'wanzhuanindex',
        })
      },
    })
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
