import FroalaEditor from 'froala-editor'
import 'froala-editor/js/languages/zh_tw.js' // icon的說明文字語言
import 'froala-editor/js/plugins/table.min.js'
import 'froala-editor/js/plugins/colors.min.js'
import 'froala-editor/js/plugins/draggable.min.js'
import 'froala-editor/js/plugins/font_size.min.js'
import 'froala-editor/js/plugins/fullscreen.min.js'
import 'froala-editor/js/plugins/image.min.js'
import 'froala-editor/js/plugins/link.min.js'
import 'froala-editor/js/plugins/lists.min.js'
import 'froala-editor/js/plugins/quote.min.js'
import 'froala-editor/js/plugins/video.min.js'

// document.addEventListener('DOMContentLoaded',function(event){
// rails 中預設使用了 turbolinks 技術做一些快取,
// editor 載入時,改監聽 turbolinks 的事件 
// 進到 editor 才會自動載入編輯器
// 但不一定有用.....
document.addEventListener('turbolinks:load',function(event){
    let editor = new FroalaEditor('#story_content',{
        language: 'zh_tw',
        spellcheck: false,
        imageUploadURL: '/api/upload_image' //設計的上傳路徑
    })
})