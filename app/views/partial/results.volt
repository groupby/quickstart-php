{% for rc in results.records %}
    <div class="record">
        <h2>Record {{ loop.index0 + results.pageInfo.recordStart }}</h2>

        <div class="details">
            {% for key in rc.allMeta|keys %}
                <div class="key-value">
                    <b><span class="key">{{ key }}</span></b>:<span class="value">{{ rc.allMeta[key] }}</span>
                </div>
            {% endfor %}

            {% for key in rc.allMeta|keys %}
                {% for type in ['.jpg', '.jpeg', '.png', '.gif'] %}
                    {% set endChar = rc.allMeta[key]|length, startChar = endChar - type|length %}
                    {% if rc.allMeta[key][startChar:endChar] is type %}
                        <b><span class="key">{{ key }}</span></b>:<span
                            class="value">{{ image(rc.allMeta[key], ['class': 'result-image']) }}</span>
                    {% endif %}
                {% endfor %}
            {% endfor %}
        </div>
    </div>
    <hr>
    <br>
{% endfor %}

<script>
    $('.highlightCorresponding').mouseenter(function () {
        var matchingRecords = $(this).attr('data-id').substring(5);
        $('.' + matchingRecords).addClass('highlight');
    }).mouseleave(function () {
        $('.highlightCorresponding').removeClass('highlight');
    });

    var biasingProfile = $('#biasingProfile');

    $('.recordColumn input').keyup(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) {
            e.preventDefault();
            e.stopPropagation();
            saveForm();
            $('#form').submit();
        } else {
            var biasings = '';
            $('.recordColumn input').each(function () {
                biasings += $(this).val() + ","
            });
            biasings = biasings.substring(0, biasings.length - 1);
            $(biasingProfile).val(biasings);
            $(biasingProfile).trigger('change');
        }
    });

    function removeColumn(pIndex) {
        var biasing = $('#biasing' + pIndex);
        $(biasing).parent().hide('slide');
        $(biasing).remove();
        $('.recordColumn input').trigger('keyup');
        saveForm();
        $('#form').submit();
    }
    function addColumn(pIndex) {
        var oldValue = $('#biasingProfile').val();
        var newValue = oldValue + ',' + $('#biasing' + pIndex).val();
        $(biasingProfile).val(newValue);
        $(biasingProfile).trigger('change');
        saveForm();
        $('#form').submit();
    }
</script>