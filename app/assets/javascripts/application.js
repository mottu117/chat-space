// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .



//共通関数には、app_を冠するものとする。

//文字列を指定日付形式へ加工する。ゼロパディングあり。
function app_toLocaleString(date) {
    return [
            date.getFullYear(),
            ('0' + date.getMonth() + 1).slice(-2),
            ('0' + date.getDate()).slice(-2)
        ].join('/') + ' ' +
        date.toLocaleTimeString();
}

//フラッシュメッセージコントロール flash_sign = (alert: 警告, notice: 情報, reset: 表示メッセージ除去)
function app_controll_Flash_Message(flash_sign, message) {
    if (flash_sign === 'alert') {
        $(document.body).prepend('<div class="flash_message--aleat">' + message);

        $('.flash_message--aleat').fadeOut(10000).queue(function() {
            this.remove();
        });

    } else if (flash_sign === 'notice') {
        $(document.body).prepend('<div class="flash_message--notice">' + message);

        $('.flash_message--notice').fadeOut(3000).queue(function() {
            this.remove();
        });

    } else if (flash_sign === 'reset') {
        $('.flash_message--aleat').remove();
        $('.flash_message--notice').remove();
    }
}

//最下まで自動スクロール(target_selector = アニメーションさせるセレクタ, index_selector = アニメーション量/高さ を取得するセレクタ )
function app_goBottom(target_selector, index_selector) {
  $(target_selector).animate({
      scrollTop: $(index_selector)[0].offsetHeight
  }, 'normal');
}
