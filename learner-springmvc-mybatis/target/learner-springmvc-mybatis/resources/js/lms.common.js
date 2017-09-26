// Comboboxの表示内容の長さにより、ComboboxのWidthを自動設定
$(document).ready(function() {
    $('select').each(function() {
        // 複数項目選択できるComboを実行しない。（apt730画面など）
        if ($(this).attr("multiple") != 'multiple') {
            createEasySelectbox(this);
            $(this).parent(".selectBoxW102,.selectBoxW124,.selectBoxW174,.selectBoxW200,.selectBoxW224").css("background", "");
        }
    });

    // ツールチップ
    $('.wordLimit, .wordLimit2, .esb-displayer, .esb-item').each(function(){
        $(this).attr('title', $(this).text().trim());
    });

    // wordLimit2 : 二行以上の場合、「...」で省略
    $('.wordLimit2').each(function() {
        $(this).dotdotdot({wrap : 'letter'});
    });
});

// 二重送信防止
function doSumit(target){
    $(target).attr('disabled', 'disabled');
    $('form #'+target.id).submit();
}

// オンとオフチェックボックスのスタイルを設定
function setOnOffCheckboxStyle(obj) {
    if ($(obj).is(":checked")) {
        $(obj).parent().removeClass("off");
        $(obj).parent().addClass("on");
    } else {
        $(obj).parent().removeClass("on");
        $(obj).parent().addClass("off");
    }
}

// 指定文字数を超える場合、「...」で省略
(function($) {
    $.fn.wordLimit = function(num) {
      this.each(function(){
        if(!num){
          var copyThis = $(this.cloneNode(true)).hide().css({
            'position': 'absolute',
            'width'   : 'auto',
            'overflow': 'visible'
          });
          $(this).after(copyThis);
          if (copyThis.width() > $(this).width()) {
            $(this).attr("title", $(this).text().trim());
            $(this).text($(this).text().substring(0,$(this).text().length-4));
            $(this).html($(this).html()+'...');
            copyThis.remove();
            $(this).wordLimit();
          } else {
            copyThis.remove();
            return;
          }
        } else {
          var maxwidth = num;
          if ($(this).text().length > maxwidth) {
            $(this).attr("title", $(this).text().trim());
            $(this).text($(this).text().substring(0, maxwidth));
            $(this).text($(this).text() + '...');
          }
        }
      });
    }
  })(jQuery);

// メッセージを一つにまとめます
function gatherErrors(formSelector, errorClass, targetMessage, destSelector){
    $(formSelector + ' .' + errorClass).each(function(){
        var messages = $(this).html().replace(/<br\s*\/?>/g, '<br />').split('<br />');
        var _messages = [];
        for(var i = 0, length = messages.length; i < length; i++) {
            if(messages[i] === targetMessage) {
                $(destSelector).text(targetMessage).show();
            } else {
                _messages.push(messages[i]);
            }
        }
        if (_messages.length > 0) {
            $(this).html(_messages.join('<br />'));
        } else {
            $(this).remove();
        }
    });
}

// Easy-selectboxを作成する。
function createEasySelectbox(obj) {
    var option = {speed:100};
    // エラーがある場合、「esb-displayer-error」を使用する。
    if ($(obj).hasClass("errorInput")) {
        option = {speed:100, classNames:{displayer:'esb-displayer-error'}};
    }
    $(obj).easySelectBox(option);
    
    // タブインデックスを再設定
    if (typeof($(obj).attr("tabindex")) != "undefined") {
        $(obj).next(".easy-select-box").attr("tabindex", $(obj).attr("tabindex"));
        $(obj).removeAttr("tabindex");
    }
}


/*
 * 指定されたコンボボックスの値を再設定
 * 
 * @param id Select element id
 * @param Datas json Object
 */
function setupComboList(selector, Datas , defaultLabel ) {
    
    $(selector).each(function(){
    
    var combo = this;
    combo.options.length = 0;
    if(defaultLabel != null && defaultLabel != ''){
        $(combo).append("<option value='' selected='selected'>"+defaultLabel+"</option>");
        var j = 0;
        for(var i=1; i < Datas.length+1; i++) {
            $(combo).append("<option value='"+Datas[j].code+"'>"+Datas[j].data+"</option>");
            j++;
        }
    }else{
        for(var i=0; i < Datas.length; i++) {
            $(combo).append("<option value='"+Datas[i].code+"'>"+Datas[i].data+"</option>");
        }
    }
    
    $(combo).next(".easy-select-box").remove();
    createEasySelectbox(combo);
    
    });
}

/*
 * 指定されたコンボボックスの値を再設定
 * 
 * @param url アクセスURL
 * @param handler ユーザカスタムハンドラ
 * @param comboId ComboオブジェクトID  
 */
function getComboListById(url, params, selector , defaultLabel) {
    $.ajax({
      type:"POST",
      url: url,      
      dataType: "json",
      data:JSON.stringify(params),
      contentType: "application/json; charset=UTF-8",
      success: function(json_data) {
        if(json_data){
            setupComboList(selector, json_data , defaultLabel );
             if($.isFunction(jQuery.fn.selectLoad)){
                 $('#'+selector).selectLoad();
             }
        }
      },
      error: function(XMLHttpRequest, textStatus) {
          alert("通信エラーが発生しました。再度、リスト選択を行ってください。");
      }
    });
}

/*
 * 指定されたコンボボックスの値を再設定
 * 
 * @param url アクセスURL
 * @param params パラメタ
 * @param handler ユーザカスタムハンドラ 
 */
function getComboListByHandler(url, params, handler) {
    $.ajax({
      type: "POST",
      url: url,      
      dataType: "json",
      data: JSON.stringify(params),
      contentType: "application/json; charset=UTF-8",
      success: function(json_data) {
        if(json_data){
            handler(json_data);
        }
      }
    });
}


//背景だけ描画
function setJqPlotGrid(id){
    $('#' + id + ' .jqplot-grid-canvas').each(function(){
        if($(this).hasClass('hooked'))
            return;
        $(this).addClass('hooked');

        $(this).parent().append($('<div class="grid-wrapper"></div>').append(this));
    });
    $('#' + id + ' .jqplot-axis').hide();
    $('#' + id + ' .jqplot-title').hide();
    $('#' + id + ' .jqplot-series-canvas').hide();
    //TODO: 他にいらないのがあれば全部消す
}

//背景以外描画
function setJqPlotSeries(id){
    $('#' + id + ' .jqplot-grid-canvas').each(function(){
        if($(this).hasClass('hooked'))
            return;
        $(this).addClass('hooked');

        $(this).hide();
    });
    //上下の余分な軸ラベルを消す
    $('#' + id + ' .jqplot-yaxis-tick:first').hide();
    $('#' + id + ' .jqplot-yaxis-tick:last').hide();
}

/*
    Y軸の上下マージンを確保してチャートを描画する。

    id0: 背景描画領域
        ・Y軸方向はgrid-wrapperクラスのついたdiv要素でclipするので適切な値（後述）を定義しておく
    id1: 背景以外描画領域。id0と同じ位置に配置されていること
    datum: jqPlotに渡すデータ系列の配列
    options: jqPlotに渡す描画オプション
        ・Y軸ラベルは最大・最小が存在しないものとして描画されるので、ticksの最初と最後の要素にマージン用の値を入れる
        ・gridPaddingでデータ領域（グリッド領域）を定義するが、実際はここからY軸ラベルのマージンが削除される
        　→"grid-wrapper"クラスのclipにはマージン削除済みのデータ領域を指定する
*/
function jplotWithDrawAreaMargin(id0, id1, datum, options){
    $.jqplot.postDrawHooks.push(function(id0, id1){
        setJqPlotGrid(id0);
        setJqPlotSeries(id1);
    }.bind(null, id0, id1));
    $('#' + id0).jqplot(datum, options);
    $('#' + id1).jqplot(datum, options);
}

// 読み込みアニメーションを表示し、FormをSubmitする。
(function($) {
  $.fn.showLoadingAndSubmit = function() {
    showLoading();
    this.submit();
  };
})(jQuery);

// 読み込みアニメーション
function showLoading() {

    var waitingBox = '<div id="overlay"><div id="waitingBox"></div></div>';
    $("main").append(waitingBox);
    //Spin.jsオプション
    var opts = {
          lines: 13 // The number of lines to draw
        , length: 10 // The length of each line
        , width: 5 // The line thickness
        , radius: 15 // The radius of the inner circle
        , scale: 1 // Scales overall size of the spinner
        , corners: 1 // Corner roundness (0..1)
        , color: '#000' // #rgb or #rrggbb or array of colors
        , opacity: 0.25 // Opacity of the lines
        , rotate: 0 // The rotation offset
        , direction: 1 // 1: clockwise, -1: counterclockwise
        , speed: 1 // Rounds per second
        , trail: 60 // Afterglow percentage
        , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
        , zIndex: 2e9 // The z-index (defaults to 2000000000)
        , className: 'spinner' // The CSS class to assign to the spinner
        , top: '50%' // Top position relative to parent
        , left: '50%' // Left position relative to parent
        , shadow: false // Whether to render a shadow
        , hwaccel: false // Whether to use hardware acceleration
    };
    $('#overlay').css({
        "position": "absolute",
        "margin-left": "0px",
        "margin-top": "0px",
        "top": "0px",
        "left": "0px",
        "background-color": "#FFFFFF",
        "height": function () { return $(document).height(); },
        "filter": "alpha(opacity=0)",
        "opacity": "0.3",
        "overflow": "hidden",
        "width": function () { return $(document).width(); },
        "z-index": "999"
    }).show();

    //optを渡してSpinneを作成し、ＩＤ指定して読み込み中アニメーション表示領域に描画する
    var spinner = new Spinner(opts).spin(document.getElementById('waitingBox'));
}

// 画面上のエラーメッセージをクリアする
function clearErrorMsg() {
    $(".errorTextAll,.errorText").remove();
    $(".errorInput").removeClass("errorInput");
    $(".esb-displayer-error").addClass("esb-displayer");
    $(".esb-displayer-error").removeClass("esb-displayer-error");
}

(function($) {
    customConfirm = function (title, cancelText, text) {
        var html = '<div id="dialog-confirm" title="' + title + '" ><p>' + text + '</p></div>';
        var buttons = {};
        buttons['OK'] = function() {
            $(this).dialog( "close" );
            if (confirmCallback && typeof(confirmCallback)=="function") {
                confirmCallback(true);
            }
          };
        buttons[cancelText] = function() {
            $(this).dialog( "close" );
            if (confirmCallback && typeof(confirmCallback)=="function") {
                confirmCallback(false);
            }
          };
        $(html).dialog({
            width: 400,
            resizable: false,
            modal: true,
            buttons: buttons
        });
    }
})(jQuery);