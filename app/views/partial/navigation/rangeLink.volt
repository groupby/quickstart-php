{% extends 'navigation/baseLink' %}

{% block link %}
    <a class="nav-link">
        {{ '%.2d'|format(rf.low) }}{{ rf.low is empty ? '+' : '-' }}{{ '%.2d'|format(rf.high) }}({{ rf.count }})
    </a>
{% endblock %}