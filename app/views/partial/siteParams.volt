{% if not(results.siteParams is empty) %}
    Site Parameters:
    {% for p in results.siteParams %}
        <div class="sitewide-metadata">
            {{ p.key ~ ' : ' ~ p.value }}
        </div>
    {% endfor %}
    <hr>
{% endif %}