//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


////共通関数・変数には、app_を冠するものとする。

//////URL変数定義(正規表現)
var app_url_Message_Index = /groups\/\d+\/messages/; //http://localhost:3000/groups/1/messages



//////fanction群定義

////////フラッシュメッセージコントロール flash_sign = (alert: 警告, notice: 情報, reset: 表示メッセージ除去)
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

////////最下まで自動スクロール(target_selector = アニメーションさせるセレクタ, index_selector = アニメーション量/高さ を取得するセレクタ )
function app_goBottom(target_selector, index_selector) {
    $(target_selector).animate({
        scrollTop: $(index_selector)[0].offsetHeight
    }, 'normal');
}
