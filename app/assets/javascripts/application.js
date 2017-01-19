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
