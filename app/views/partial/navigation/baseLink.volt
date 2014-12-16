<div class="nav-link">
    <b>{{ nv.displayName }} {% block orTitle %}{% endblock %}</b>
    {% for rf in nv.refinements %}
        {% block link %}
        {% endblock %}
        {% block apply %}
        {% endblock %}
    {% endfor %}
</div>