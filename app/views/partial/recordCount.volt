{% if results.totalRecordCount > 0 %}
    <div>Records {{ results.pageInfo.recordStart }} - {{ results.pageInfo.recordEnd }}
        of {{ '%d'|format(results.totalRecordCount) }}</div>
{% else %}
    No records found for {{ params.query }}
{% endif %}