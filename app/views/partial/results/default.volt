<div class="results">

    <hr>
    {{ partial('partial/siteParams') }}

    <table>

        <tr>
            <td width="160" valign="top">
                <div class="navigation">
                    {{ partial('partial/navigation') }}
                </div>
            </td>
            <td valign="top">
                {% block template %}
                {% endblock %}
                {{ partial('partial/results') }}
            </td>
        </tr>

    </table>

</div>