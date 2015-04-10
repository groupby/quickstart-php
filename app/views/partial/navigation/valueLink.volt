{% extends 'partial/navigation/baseLink.volt' %}

{% block orTitle %}
    {% if nv.isOr() %}
        (OR)
    {% endif %}
{% endblock %}
{% block refinements %}
    {% if nv.isOr() %}
        {% for rf in nv.refinements %}
            <div>
                <label for="{{ rf.id }}">{{ rf.value }} ({{ rf.count }})</label>
                {{ check_field(nv.name ~ '=' ~ rf.value, 'id': rf.id, 'class': 'or-check', 'nv-name': nv.name, 'rf-val': rf.value) }}
            </div>
            <br>
        {% endfor %}
        <a class="nav-apply"
           href="javascript:setOrRefs('{{ params.refinements }}');$('#form').submit()">Apply
            >></a>
    {% else %}
        {% for rf in nv.refinements %}
            <div>
                <a class="nav-link"
                   href="javascript:$('#refinements').val('{{ params.refinements ~ '~' ~ nv.name ~ '=' ~ rf.value }}');$('#form').submit()">
                    {{ rf.value }} ({{ rf.count }})
                </a>
            </div>
        {% endfor %}
    {% endif %}
{% endblock %}