{% extends 'navigation/baseLink' %}

{% if nv.or %}
    {% block orTitle %}(OR) {% endblock %}
    {% block link %}
        <div>
            <label for="{{ rf.id }}">{{ rf.value }} ({{ rf.count }})</label>
            {{ check_field([nv.name ~ '=' ~ rv.value, 'id' => rf.id]) }}
        </div>
    {% endblock %}

    {% block apply %}
        <a class="nav-apply" href="javascript:$('#form').submit()">Apply >></a>
        <br>
    {% endblock %}
{% else %}
    {% block link %}
        <div>
            <a class="nav-link">
                {{ rf.value }} ({{ rf.count }})
            </a>
        </div>
    {% endblock %}
{% endif %}
