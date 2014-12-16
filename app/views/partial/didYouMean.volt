{% if results.didYouMean|length > 0 %}
    Did you mean:
    {% for dym in results.didYouMean %}
        {#<a href="{{ functions.toUrlAdd('default', dym, results.selectedNavigation, 'selected', null) }}">{{ dym }}</a>#}
    {% endfor %}
{% endif %}

{% if results.relatedQueries|length > 0 %}
    Related:
    {% for rq in results.relatedQueries %}
        {#<a href="{{ functions.toUrlAdd('default', rq, results.selectedNavigation, 'selected', null) }}">{{ rq }}</a>#}
    {% endfor %}
{% endif %}