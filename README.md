# 復刻 Medium 

網址: https://david-practice-my-medium.herokuapp.com/

主要實作以下功能
- 會員功能
  - 個人資料編輯
  - 上傳個人照片
  - 收費計劃(免費會員及收費會員)
  - 登入reCAPTCHA驗證

- 首頁功能
  - 文章列表
  - 熱門文章
  - 追蹤作者
  - 訂閱文章
  
- 文章功能
  - 文章編輯器
  - 文章網址設計
  - 留言及回覆
  - 拍手(按讚功能)
  - 追蹤作者
  - 加書籤收藏文章

已存在帳號
- 帳號: test_no1@gmail.com
  密碼: 123456
- 帳號: test_no2@gmail.com
  密碼: 123456
- 帳號: test_no3@gmail.com
  密碼: 123456

測試刷卡資訊
- 卡號: 4111 1111 1111 1111
  到期日: 大於當日即可


## 開發
- 系統
  - Ruby 2.6.0
  - Rails 5.2.4.3
- 資料庫: PostgreSQL
- 原始碼管理: GitHub  
- 部署: Heroku

## 使用套件及第三方服務
- 會員功能: [Devise](https://github.com/heartcombo/devise)
- CSS Framework: [Bulma](https://bulma.io/)
- 有限狀態機:[AASM](https://github.com/aasm/aasm)
  - 控制文章狀態,草稿或發佈
- 文章網址設計: [friendly_id](https://github.com/norman/friendly_id)
  - 將文章網址以文章標題表示
- 文章軟刪除: [paranoia](https://github.com/rubysherpas/paranoia)
  - 要刪除的文章只標記為刪除,實際還存留在資料庫中.

- 上傳照片: [Active Storage Overview](https://guides.rubyonrails.org/active_storage_overview.html)
- 前端打包: [Webpacker](https://github.com/rails/webpacker)
- 前端 JavaScript: [Stimulus.js](https://stimulusjs.org/)
- 管理 Procfile 套件: [foreman](https://github.com/ddollar/foreman)
  - 執行 web server
  - 開發時執行 webpack-dev-server
- icon: [font awesome](https://fontawesome.com/)
- 文章編緝器: [Froala Editor](https://froala.com/wysiwyg-editor/)
- 管理敏感資訊: [figaro](https://github.com/laserlemon/figaro)
  - braintree 相關資訊
  - reCAPTCHA 相關資訊
- 線上刷卡: [braintree](https://www.braintreepayments.com/)
  - 測試卡號為 4111 1111 1111 1111,  
  到期日晚於當下即可
- 機器人驗證: [reCaptcha](https://www.google.com/recaptcha/about/)
  - 登入頁面使用reCAPTCHA v3
  - 註冊頁面使用reCAPTCHA v2

