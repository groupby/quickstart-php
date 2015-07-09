{% if nv.range %}
    {{ partial('partial/navigation/rangeLink') }}
{% else %}
    {{ partial('partial/navigation/valueLink') }}
{% endif %}
{% if not (nv.metadata is empty) %}
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