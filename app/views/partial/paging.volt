<div class="page">
    {% if results.totalRecordCount >= 0 and results.pageInfo.recordStart > 1 %}
        {% set page_to_go_back = results.pageInfo.recordStart - (results.pageInfo.recordEnd - results.pageInfo.recordStart) %}
        {% if page_to_go_back > 0 %}
            <a href="javascript:" onclick="$('#p').val('{{ page_to_go_back }}');$('#form').submit()">Prev Page</a>
        {% else %}
            <a href="javascript:" onclick="$('#p').val('0');$('#form').submit()">Prev Page</a>
        {% endif %}
    {%  endif %}
    {% if results.totalRecordCount > 0 and results.pageInfo.recordEnd < results.totalRecordCount %}
        <a href="javascript:" onclick="$('#p').val('{{ results.pageInfo.recordEnd }}');$('#form').submit()">Next Page</a>
    {% endif %}
</div>