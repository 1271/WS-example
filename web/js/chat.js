$(function () {
    var conn = null;
    var message = $('#message');
    var inner = $('#messages').find('.inner');
    inner.data('counter', 0);

    function createConnection() {
        conn = new WebSocket('ws://ws2.localhost:8080');
    }

    createConnection();

    conn.onopen = function(e) {
        message.attr('disabled', false);
        console.log("Connection established!");
    };

    conn.onclose = function (e) {
        var msg = {
            'class': 'error',
            'text': 'Произошла ошибка. Следующая попытка восстановления соединения через 3 секунды'
        };
        Message(msg);
        setTimeout(function() {
            createConnection();
        }, 3000);
    };

    function Message(response) {
        var maxMessages = 20;

        if(inner.data('counter') > maxMessages) {
            var msgs = inner.find('msg');
            for (var i=maxMessages; i < msgs.length; i++) {
                msgs.eq(i).remove();
            }
        } else {
            inner.data('counter', parseInt(inner.data('counter')) + 1);
        }

        var _class = '';
        if(response.hasOwnProperty('class')) {
            _class = ' ' + response['class'];
        }

        inner.prepend('<msg class="' + response.status + _class + '">' + response.text + '</msg>');
    }

    function Users(response) {
        var html = '<ul>';
        response.users.forEach(function (item, i) {
            if(!item.hasOwnProperty('image')) {
                item.image = '';
            }
            html += '<li><img src="' + item.image + '"><span>' + item.login + '</span></li>';
        });
        html += '<ul>';

        $('#users').find('.list').html(html);
    }

    function Setup(response) {
        //
    }

    conn.onmessage = function(e) {
        var data = JSON.parse(e.data);
        if(data.type === 'message') {
            Message(data);
        } else if (data.type === 'users') {
            Users(data);
        } else if (data.type === 'setup') {
            Setup(data);
        //} else if (data.type === 'setup') {
        //} else if (data.type === 'setup') {
        }
    };

    $('#send').click(function () {
        var $this = $(this);
        if(message.val() && !$this.attr('disabled')) {
            conn.send(message.val());
            message.val('');
            $this.attr('disabled', 'disabled');
            message.attr('disabled', 'disabled');
            setTimeout(function () {
                $this.attr('disabled', false);
                message.attr('disabled', false);
            }, 500);
        }
    });

    inner.on('click', 'msg.error', function () {
        $(this).hide(100).remove();
    });

});
