{{ form('index/search', 'role': 'form', 'id': 'form') }}
    <nav class="navbar navbar-default navbar-inverse bar" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                {{ image('images/logo.png', 'height': '27px') }}
                {% if not(params.customerId is empty) %}
                    {{ link_to('https://' ~ params.customerId ~ '.groupbycloud.com/admin/keyManagement.html', 'Command Center') }}
                {% endif %}
            </div>
            {{ partial('partial/form') }}
        </div>
    </nav>

    {{ partial('partial/searchBox') }}
{{ endform() }}

<div class="container">
    {{ flash.output() }}
    {{ content() }}
</div>
