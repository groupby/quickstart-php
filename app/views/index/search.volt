{{ content() }}

<div class="controls">
    {% if params.query %}
        <h1>Search results for {{ params.query }}</h1>
    {% endif %}

    {{ partial('partial/didYouMean') }}
    {{ partial('partial/refinements') }}

    <br>
    <br>

    {{ partial('partial/paging') }}
    {{ partial('partial/recordCount') }}
</div>

{% if results.template.name is 'Famous Person Landing Page' %}
    {{ partial('partial/results/famous') }}
{% elseif results.template.name is 'default' %}
    {{ partial('partial/results/default') }}
{% else %}
    <h2>Landing page not defined: "{{ results.template.name }}"</h2>
    {{ partial('partial/results/default') }}
{% endif %}