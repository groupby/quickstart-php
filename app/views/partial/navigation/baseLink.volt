<div class="nav-link" nv-name="{{ nv.name }}">
    <b class="nav-title">{{ nv.displayName }} {% block orTitle %}{% endblock %}</b>

    <div class="nav-block">
        {% block refinements %}
        {% endblock %}
    </div>
    {% if nv.moreRefinements %}
        <a class="more-link"
           href="javascript:expandNavigation('{{ params|json_encode|escape }}','{{ nv.name }}')">More
            [+]</a>
    {% endif %}
</div>