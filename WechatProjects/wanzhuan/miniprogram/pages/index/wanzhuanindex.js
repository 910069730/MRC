// pages/index/wanzhuanindex.js
const app = getApp()

Page({
  
  /**
   * 页面的初始数据
   */
  towanzhuanme: function () {
    wx.redirectTo({
      url: 'wanzhuanme',
    })
  },

  data: {
    current: 0,   //所在页面的index
    indicatorDots: true, //是否显示面板指示点
    autoplay: true, //是否自动切换
    interval: 3000,   //自动切换时间间隔
    duration: 800, //滑动动画时长
    circular: true, //是否采用衔接滑动
    // userid: app.user_info.username,
    // username: app.user_info.nickname,
    imgUrls: [
      //此处放入图片路径
      //.userid
      // 'https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1878948454.png',
      // 'https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1878948454.png',
      // 'https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1878948454.png',
      // 'https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1878948454.png',
      // 'https://ss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1878948454.png'
    ],
    links: [
      //相应图片跳转的路径
      '/pages/index/wanzhuan',
      '/pages/index/wanzhuan',
      '/pages/index/wanzhuan'
    ]
  },
  
  //轮播图切换事件
  swiperChange: function (e) {
    this.setData({
      swiperCurrent: e.datail.current
    })
  },
  //点击指示点切换
  chuangEvent: function (e) {
    this.setData({
      swiperCurrent: e.currentTarget.id
    })
  },
  //点击图片触发事件
  swipclick: function (e) {
    console.log(this.data.swiperCurrent);
    wx.switchTab({
      url: this.data.links[this.data.swiperCurrent]
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */onLoad: function () {
    this.setData({
      message: imga.data.data[0].image_url
    })
  },


  onLoad: function (options) {
    var gThat = this
    wx.request({
      url: "http://car.duobaomi.net/api/Vehicle_index/get_banner_list",
      success: function (obj) {
        console.log("--get_banner_lis----obj----", obj)
        

        /*
            wx.request.success.this != Page.this      //微信请求成功的作用域和该网页内的作用域不相同
            var gThat =  Page.this                    //从外面定义的gThat即为该页内的作用域
            wx.request.success.gThat ==  Page.this    //在微信请求成功的作用域调用gThat即为整个页面的作用域
        */

        //内部声明一个变量，然后循环遍历，使该变量变成数组变量，长度为四，存放的四张图片的路径
        var gObjArr = []
        for (var i = 0; i < 4; i++) {
          gObjArr[i] = obj.data.data[0].image_url;
        }
        // console.log("--get_banner_lis----gObjArr----", gObjArr)
        // console.log("--imgUrls---", gThat.data.imgUrls )
        
        //外部imgUrls重新赋值，将内部的一个变量值赋给外部的一个变量
        gThat.setData({
          imgUrls: gObjArr
        })
        // console.log("--imgUrls---", gThat.data.imgUrls)

      }
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