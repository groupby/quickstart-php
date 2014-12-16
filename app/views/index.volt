<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('css/bootstrap.min.css') }}
        {{ stylesheet_link('css/main.css') }}
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="author" content="GroupBy Team">
    </head>
    <body>
        {{ javascript_include('js/jquery-1.11.2.min.js') }}
        {{ javascript_include('js/jquery-ui-1.10.4.custom.min.js') }}
        {{ javascript_include('js/bootstrap.min.js') }}
        {{ javascript_include('js/jquery.cookie.js') }}
        {{ javascript_include('js/sayt.js') }}
        {{ javascript_include('js/main.js') }}
        {{ javascript_include('js/jquery.quicksand.js') }}
        {{ content() }}
    </body>
</html>