$(function() {

  //////function群-------------------------------------------------

  function build_message(message) { //非同期メッセージ描画
    var img_Tag = ""; //画像タグの格納先

    if (message.image_url.url !== null) { //画像データが存在する時
      img_Tag = ('<p><img src="' + message.image_url.url + '"></p>');
    }

    var html =
      $('<li class="chat__main__contents__chat-ul__chat-li">').append(

        '<div class="data_message_id" data-message-id="' + message.id + '"></div>',

        '<span class="chat__main__contents__chat-ul__chat-li--userinfo--username">' +
        message.user.nickname,

        '<span class="chat__main__contents__chat-ul__chat-li--userinfo--datetime">' +
        message.created_at_Prepared,

        '<p class="chat__main__contents__chat-ul__chat-li--userinfo--message">' +
        message.text,

        img_Tag
      );

    return html;
  }

  function refresh_message() { //メッセージ自動更新処理
    console.log("into");
    var forword_Url = $('#new_message').attr('action');
    var searched_Group_Id = forword_Url.match(/\d/);
    var most_Recent_Message_Id = $('.chat__main__contents__chat-ul__chat-li:last > .data_message_id').attr('data-message-id');
    $.ajax({
        type: 'GET',
        url: forword_Url + '.json',
        data: {
          message: {
            group_id: searched_Group_Id
          },
          most_recent_message_id: most_Recent_Message_Id
        },
        datatype: 'json'
      })
      .done(function(data) {
        if (most_Recent_Message_Id.length !== 0) { //メッセージが存在するときだけは描画する。
          $.each(data, function(i) {
            var message_html = build_message(data[i]);
            $('.chat__main__contents__chat-ul').append(message_html);
          });
        }
      })
      .fail(function() {
        app_controll_Flash_Message('alert', '自動更新に失敗しました。');
      })
      .always(function(data) {
        app_goBottom('.chat__main__contents', '.chat__main__contents__chat-ul'); //最新メッセージまでスクロール。
      });
  }


  //////action群-------------------------------------------------

  $(document).on('turbolinks:load', function() { //Turbolinks5対応 ページ読み込みと同時に処理。
    if (location.pathname.match(app_url_Message_Index)) { //message.index画面である時の処理

      app_goBottom('.chat__main__contents', '.chat__main__contents__chat-ul'); //最新メッセージまでスクロール。

      var last_message_id = "";
      setInterval(refresh_message(), 5000); //自動更新インターバル指定
    }
  });


  $(document).on('submit', '#new_message', function(e) { //メッセージ投稿時処理
    e.preventDefault();
    app_controll_Flash_Message('reset', ''); //flash_message初期化

    //取得関連
    var get_Form = $('#new_message').get(0);
    var send_Data = new FormData(get_Form); //参考 http://js.studio-kingdom.com/javascript/operators/new, http://hakuhin.jp/js/form_data.html,  http://js.studio-kingdom.com/jquery/core/get
    var forword_Url = $('#new_message').attr('action'); //参考 http://js.studio-kingdom.com/jquery/attributes/attr

    $.ajax({
        type: 'POST',
        url: forword_Url + '.json',
        data: send_Data,
        processData: false,
        contentType: false,
        datatype: 'json'
      })
      .done(function(data) {
        var message_html = build_message(data);
        $('.chat__main__contents__chat-ul').append(message_html);
        app_controll_Flash_Message('notice', 'メッセージを投稿しました。');
      })
      .fail(function() {
        app_controll_Flash_Message('alert', '投稿できませんでした。テキストが未入力か、不正なデータです。画像は(jpg, jpeg, gif ,png)形式にして下さい。');
      })
      .always(function() {
        $('.chat__main__inputform__button-div--button').prop({ //ボタン機能復活
          disabled: false,
          value: "Send"
        });
        app_goBottom('.chat__main__contents', '.chat__main__contents__chat-ul'); //最新メッセージまでスクロール。
      });
    this.reset(); // フォームリセット
  });

});
