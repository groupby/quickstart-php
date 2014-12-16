{% if nv.availableNavigation is not empty %}
    <b>Refine Results</b>
    {% for nv in results.availableNavigation %}
        {% if nv.range %}
            {{ partial('partial/navigation/rangeLink') }}
        {% else %}
            {{ partial('partial/navigation/valueLink') }}
        {% endif %}
        {% if nv.metadata is not empty %}
            <div class="navigation-metadata-title">
                metadata:
                {% for mt in nv.metadata %}
                    <br>
                    <div class="navigation-metadata">
                        {{ mt.key ~ ' : ' ~ mt.value }}
                    </div>
                {% endfor %}
            </div>
        {% endif %}
    {% endfor %}
{% else %}
    <b>No refinements remain</b>
{% endif %}
