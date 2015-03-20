{% if rf.getType() is 'Range' %}
    <b>
        <?php $refstr = str_replace('~' . $nv->name . ':' . $rf->low . '..' . $rf->high, '', $params->refinements) ?>
        <a class="delete-checkbox"
           href="javascript:$('#refinements').val('{{ refstr }}');$('#form').submit();">x</a>
        {{ nv.displayName }}
    </b>: {{ '%.2d'|format(rf.low) }}{{ rf.high is empty ? '+' : ' - ' }}{{ '%.2d'|format(rf.high) }}
{% elseif rf.getType() is 'Value' %}
    <b>
        <?php $refstr = str_replace('~' . $nv->name . '=' . $rf->value, '', $params->refinements) ?>
        <a class="delete-checkbox"
           href="javascript:$('#refinements').val('{{ refstr }}');$('#form').submit();">x</a>
        {{ nv.displayName }}
    </b>: {{ rf.value }}
{% endif %}