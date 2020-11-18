# 復刻 Medium 

- 網址: https://david-practice-my-medium.herokuapp.com/
  - **會員註冊**頁面使用 [reCAPTCHA V2](https://www.google.com/recaptcha/about/) 驗證是否為機器人
  - **會員登入**頁面使用[ reCAPTCHA V3](https://www.google.com/recaptcha/about/) 驗證是否為機器人
  - 部署到 Heroku，上傳儲存空間串接 [Amazon S3](https://aws.amazon.com/tw/s3/)
  - 付費金流串接 [Braintree](https://www.braintreepayments.com/)  
    測試卡號: 41111 1111 1111 1111  
    到期日: 大於當下日期即可
  - 使用有限狀態機 [AASM](https://github.com/aasm/aasm) 控制文章狀態，草稿或發佈  

- 首頁功能
  - 熱門文章  
    根據文章被拍手的數量,列出前四篇熱門文章
  - 文章列表  
    依照日期反向排序顯示
  - 追蹤作者  
    點選作者名稱可以顯示該作者所有文章
  - 訂閱文章  
    依訂閱時間反向排序顯示

- 會員功能
  - 註冊會員  
    自定使用者名稱，使用 Email 做為登入帳號
  - 會員登入前
    - 僅可瀏覽文章
  - 會員登入後
    - 新增文章
    - 故事列表
      - 列出會員的所有文章  
      - 標示出已發佈文章
      - 編輯或刪除文章
    - 個人資料
      - 修改 使用者名稱 / 密碼 / Email / 個人簡介
      - 上傳使用者照片
    - 會員升級
      - 引導至方案頁面並線上刷卡
- 文章功能
  - 文章編輯器
  - 文章網址設計  
    將文章網址以文章標題表示
  - 留言及回覆  
    留言後即時更新
  - 拍手(按讚功能)  
    拍手後即時更新
  - 追蹤作者  
    於首頁顯示已追蹤作者
  - 加書籤收藏文章  
    於首頁顯示已收藏文章  

- 已存在帳號
  - 帳號: test_no1@gmail.com  
    密碼: 123456  
  - 帳號: test_no2@gmail.com  
    密碼: 123456  
  - 帳號: test_no3@gmail.com  
    密碼: 123456  

- 測試刷卡資訊
  卡號: 4111 1111 1111 1111  
  到期日: 大於當下日期即可


## 開發
- 前端：Bulma, SCSS, Stimulus.js
- 後端：Rails(5.2.4.3), PostgreSQL
- 部署: Heroku, Amaron S3
- 原始碼管理: GitHub  

## 使用套件及第三方服務
- 會員功能: [Devise](https://github.com/heartcombo/devise)
- CSS Framework: [Bulma](https://bulma.io/)
- 有限狀態機:[AASM](https://github.com/aasm/aasm)
  - 控制文章狀態,草稿或發佈
- 文章網址設計: [friendly_id](https://github.com/norman/friendly_id)
  - 將文章網址以文章標題表示
- 文章軟刪除: [paranoia](https://github.com/rubysherpas/paranoia)
  - 要刪除的文章只標記為刪除,實際還存留在資料庫中.
- 使用 [Froala Editor](https://froala.com/wysiwyg-editor/)
- 檔案上傳: [Active Storage Overview](https://guides.rubyonrails.org/active_storage_overview.html)
- Amazon S3: [aws-sdk-s3](https://github.com/aws/aws-sdk-ruby)
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
    到期日大於當下日期即可
- 機器人驗證: [reCaptcha](https://www.google.com/recaptcha/about/)
  - 登入頁面使用reCAPTCHA v3
  - 註冊頁面使用reCAPTCHA v2

