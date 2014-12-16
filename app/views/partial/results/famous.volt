{% extends 'results/default' %}

{% block template %}
    <div id="famous">
        {{ image([results.template.zones['Picture of famous person'].content, 'alight': 'left', 'width': '400']) }}
        <div>
            <h2>{{ results.template.zones['Famous Person Text'].content }}</h2>
            {{ image([results.template.zones['SKU mentioned'].records[0].allMeta.largeImage, 'align': 'right']) }}
            {{ results.template.zones['SKU mentioned'].records[0].title }}
        </div>
    </div>
    <br clear="all">
{% endblock %}