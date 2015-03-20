{%- macro rmstr(original, stringToRemove) %}
    <?php
        echo str_replace($stringToRemove, '', $original);
    ?>
{%- endmacro %}

{% if results.selectedNavigation|length > 0 or not (params.query is empty) %}
    <div id="refinements">
        Refined by:

        {% if not (params.query is empty) %}
            <b>
                <a class="delete-checkbox"
                   href="javascript:$('#query').val('');$('#form').submit()">x</a>
                Search
            </b>: {{ params.query }}
        {% endif %}

        {% for nv in results.selectedNavigation %}
            {% for rf in nv.refinements %}
                {{ partial('partial/refinementCheckbox') }}
            {% endfor %}
        {% endfor %}

    </div>
{% endif %}