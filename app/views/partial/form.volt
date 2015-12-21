<fieldset>
    <div class="form-group">
        {{ form.render('clientKey', ['class': 'form-control', 'style': 'width:260px']) }}
        {{ form.render('customerId', ['class': 'form-control', 'style': 'width:120px']) }} |
        {{ form.render('area', ['class': 'form-control', 'style': 'width:120px']) }}
        {{ form.render('collection', ['class': 'form-control', 'style': 'width:120px']) }}
        {{ form.render('language', ['class': 'form-control', 'style': 'width:120px']) }} |
        {{ form.render('sortField', ['class': 'form-control', 'style': 'width:120px']) }}
        {{ form.render('sortOrder', ['class': 'form-control', 'style': 'width:160px']) }} |
        {{ form.render('includedNavigations', ['class': 'form-control', 'style': 'width:180px']) }}
        {{ form.render('excludedNavigations', ['class': 'form-control', 'style': 'width:180px']) }}
        {{ form.render('refinements', ['value': params.refinements]) }}
        {{ form.render('p', ['value': 0]) }}
        {{ form.render('ps', ['value': 0]) }}
    </div>
    <div class="form-group">
        {{ form.render('fieldList', ['class': 'form-control']) }}
    </div>
</fieldset>

<script>
    $.get('dust/autocompleteTemplate.dust', function (template) {
        dust.loadSource(dust.compile(template, 'at'));
    });
    $.get('dust/productTemplate.dust', function (template) {
        dust.loadSource(dust.compile(template, 'pt'));
    });

    $('#query').sayt({
        domain: function () {
            return $('#customerId').val();
        },
        collection: function () {
            return $('#collection').val();
        },
        selectSearchTerm: function (data) {
            $('#query').val(data.value);
            $('#form').submit();
        },
        selectNavigation: function (data) {
            $('#query').val('');
            var refs = $('#refinements');
            $(refs).val(
                    $(refs).val() + '~'
                    + data.category + '='
                    + data.value);
            $('#form').submit();
        },
        selectProduct: function (data) {
            // do product search here
        },
        autocompleteTemplate: 'at',
        productTemplate: 'pt'
    });

    var currentHash = location.hash;
    if (currentHash) {
        var hashes = currentHash.substring(1).split('&');
        hashes.forEach(function (pItem) {
            var keyValue = pItem.split('=');
            if (keyValue && keyValue.length == 2 && keyValue[0] && keyValue[1] && keyValue[1] !== 'undefined') {
                $('#' + keyValue[0]).attr('value', keyValue[1]);
                $.cookie(keyValue[0], keyValue[1]);
            }
        });
    }

    var cookieForm = $('#cookieForm').find('input');

    $(cookieForm).each(function () {
        $(this).keypress(function (e) {
            var code = (e.keyCode ? e.keyCode : e.which);
            if (code == 13) {
                e.preventDefault();
                e.stopPropagation();
                saveForm();
                $('#form').submit();
            }
        });
    });
    saveForm();
    $(cookieForm).bind('keyup blur click change', function () {
        $.cookie($(this).attr('id'), $(this).val());
    });

    $('#form').submit(function () {
        saveForm();
    });
</script>