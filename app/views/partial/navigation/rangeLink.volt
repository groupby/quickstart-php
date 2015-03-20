{% extends 'partial/navigation/baseLink.volt' %}

{% block refinements %}
    {% for rf in nv.refinements %}
        <a class="nav-link"
           href="javascript:$('#refinements').val('{{ params.refinements ~ '~' ~ nv.name ~ ':' ~ rf.low ~ '..' ~ rf.high }}');$('#form').submit()">
            {{ '%.2d'|format(rf.low) }}{{ rf.low is empty ? '+' : '-' }}{{ '%.2d'|format(rf.high) }}({{ rf.count }})
        </a>
    {% endfor %}
{% endblock %}