<b>
    <a class="delete-checkbox"
       href="{{ functions.toUrlRemove('default', q, results.selectedNavigation, 'selected', refinement) }}">x</a>
    {{ nv.displayName }}
</b>: {% if rf.type is 'range' %}
    {{ '%.2'|format(rf.low) }}{% rf.high is empty ? '+' : ' - ' %}{{ '%.2'|format(rf.high) }}
{% elseif rf.type is 'value' %}
    {{ rf.value }}
{% endif %}