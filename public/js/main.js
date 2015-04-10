$(document).ready(function () {
    setInterval(redoQuery, 1000);
});

function redoQuery() {
    if ($.cookie('reload') == 'true') {
        $.cookie('reload', 'false');
    } else {
        return;
    }
    var formElement = $('#form');
    var sForm = $(formElement).serialize();
    $.ajax({
        type: 'post',
        url: 'index.html',
        data: $(formElement).serialize() + '&action=getOrderList',
        dataType: 'json'
    }).done(function (pResponse) {
        $('#scratchArea').html(pResponse);
        $('.replacementRow').each(function () {
            var row = $(this).attr('data-count');
            $('#row' + row).quicksand($('#replacementRow' + row + ' li'))
        });
    });
}

function saveForm() {
    var hashLocation = '';
    $('#cookieForm').find('input').each(function () {
        var myId = $(this).attr('id');
        if ($.cookie(myId)) {
            $(this).val($.cookie(myId));
            hashLocation += myId + '=' + $.cookie($(this).attr('id')) + '&';
        }
    });
    location.hash = hashLocation;
}

function setOrRefs(currentRefinements) {
    var orRefinementString = '';
    $('.or-check').each(function (i, checkbox) {
        if ($(checkbox).prop('checked')) {
            console.log($(checkbox).attr('nv-name'));
            orRefinementString += '~' + $(checkbox).attr('nv-name') + '=' + $(checkbox).attr('rf-val');
        }
    });

    $('#refinements').val(currentRefinements + orRefinementString);
}

function expandNavigation(params, navigationName) {
    $.ajax({
        type: 'post',
        url: 'searchRefinements',
        data: {
            params: JSON.parse(params),
            name: navigationName
        },
        dataType: 'html'
    }).done(function (response) {
        $('div.nav-link[nv-name="' + navigationName + '"]').replaceWith(response);
    }).error(function (err, message) {
        console.log('Could not get more navigations: ' + message);
    });
}