{% if results.selectedNavigation|length > 0 or params.query is not empty %}
    <div id="refinements">
        Refined by:

        {% if params.query is not empty %}
            <b>
                {#<a class="delete-checkbox"#}
                   {#href="{{ functions.toUrlAdd('default', '', results.selectedNavigation, 'selected', null) }}">x</a>#}
                Search
            </b>: {{ params.query }}
        {% endif %}

        {% for nv in results.selectedNavigation %}
            {% for rf in navigation.refinements %}
                {{ partial('partial/refinementCheckbox') }}
            {% endfor %}
        {% endfor %}

    </div>
{% endif %}