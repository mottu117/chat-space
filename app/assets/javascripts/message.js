$(function() {

    if (window.FormData) { //古いブラウザでないか、確認・ログする。
        console.log("HTML5 FormData に対応している");
    } else {
        console.log("HTML5 FormData に対応していない");
    }

    function build_message(message) {
        var html =
            $('<li class="chat__main__contents__chat-ul__chat-li">').append(
                '<span class="chat__main__contents__chat-ul__chat-li--userinfo--username">' + message.user.nickname,
                '<span class="chat__main__contents__chat-ul__chat-li--userinfo--datetime">' + app_toLocaleString(new Date(message.created_at)),
                '<p class="chat__main__contents__chat-ul__chat-li--userinfo--message">' + message.text
            );
        return html;
    }

    $('#new_message').on('submit', function(e) {
        e.preventDefault();

        //取得関連
        var get_Form = $('#new_message').get(0);
        var send_Data = new FormData(get_Form); //参考 http://js.studio-kingdom.com/javascript/operators/new, http://hakuhin.jp/js/form_data.html,  http://js.studio-kingdom.com/jquery/core/get
        var forword_Url = $('.new_message').attr('action'); //参考 http://js.studio-kingdom.com/jquery/attributes/attr

        $.ajax({
                type: 'POST',
                url: forword_Url + '.json',
                data: send_Data,
                processData: false,
                contentType: false,
                datatype: 'json'
            })
            .done(function(data, res) {
                console.log("json_res", res); //成功ログ
                var message_html = build_message(data);
                $('.chat__main__contents__chat-ul').append(message_html);
            })
            .fail(function(jqXHR, textStatus, errorThrown) {
                console.log('json_error', jqXHR, textStatus, errorThrown); //失敗ログ
                alert('error');
            });
    });
});
