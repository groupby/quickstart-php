{% if not(results.availableNavigation is empty) %}
    <b>Refine Results</b>
    {% for nv in results.availableNavigation %}
        {{ partial('partial/navigation/navigationBlock') }}
    {% endfor %}
{% else %}
    <b>No refinements remain</b>
{% endif %}
