$(function() {

  //////変数宣言群-------------------------------------------------

  var search_PreWord = ""; //インクリメンタルサーチにおける、前回文字列記憶枠

  //////function群-------------------------------------------------

  function build_Users(searched_Users) { //サーチしたユーザの描画
    var html = "";
    $.each(searched_Users, function(i) {
      html += (
        '<div class="chat-group-user clearfix">' +

        '<p class="chat-group-user__name">' +
        searched_Users[i].nickname + '</p>' +

        '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' +
        searched_Users[i].id + '" data-user-name="' + searched_Users[i].nickname + '">追加</a>' +

        '</div>'
      );
    });
    return html;
  }

  //////action群-------------------------------------------------

  $(document).on('keyup', '#user-search-field', function() { //ユーザインクリメンタルサーチ
    setTimeout(function() { //発火間隔 2秒

      var get_Text = $('#user-search-field').val();
      var forword_Url = app_url_Group_New;

      if (get_Text.length !== 0 && search_PreWord != get_Text) { //検索文字があり、かつ前回発火時と異なる文字である時。
        $.ajax({
            type: 'GET',
            url: forword_Url + '.json',
            data: {
              search: get_Text
            },
            datatype: 'json'
          })
          .done(function(data) {
            $('#user-search-result').children().remove(); //初期化
            var user_html = build_Users(data);
            $('#user-search-result').append(user_html);
          })
          .fail(function(data) {
            app_controll_Flash_Message('alert', 'データ検索に失敗しました。');
          })
          .always(function() {
            search_PreWord = get_Text;
          });
      }
    }, 2000);
  });


  $(document).on('click', '.chat-group-user__btn--add', function() { //ユーザに対するグループへの追加処理
    app_controll_Flash_Message('reset', '');

    var id = $(this).attr('data-user-id');
    var name = $(this).attr('data-user-name');
    var check = $('#chat-group-user-' + id).attr('id');

    if ($('#chat-group-user-' + id).length) { //存在チェック
      app_controll_Flash_Message('alert', '指定のメンバーはすでに候補へ追加されています。');

    } else {
      $('#chat-group-users').append(

        '<div class="chat-group-user clearfix" id="chat-group-user-' + id + '">' +

        '<input name="group[user_ids][]" type="hidden" value="' + id + '">' +

        '<p class="chat-group-user__name">' + name + '</p>' +

        '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' +
        id + '" data-user-name="' + name + '">削除</a>' +

        '</div>'
      );
    }
    $(this).parent().prop("hidden", "true"); //候補へ追加したら、サーチ結果から隠す。
  });


  $(document).on('click', '.chat-group-user__btn--remove', function() { //ユーザに対するグループからの除外処理
    $(this).parent().remove();
  });


  $(document).on('click', '.chat-group-form__action-btn', function(e) { //submit時のエラーチェック
    app_controll_Flash_Message('reset', '');
    if ($('#chat-group-users').children().length === 0) { //候補ユーザがいないときは警告
      e.preventDefault();
      app_controll_Flash_Message('alert', 'メンバーを一人以上指定してください。');
    }
  });
});
