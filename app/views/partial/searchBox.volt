<div class="bar">
    <div class="container-fluid">
        <fieldset>
            <div class="form-group">
                {{ form.render('query', ['class': 'form-control', 'style': 'width:200px']) }}
                {{ submit_button('Search') }}
                {{ link_to('index/index', 'Clear Search and Nav') }}
            </div>
        </fieldset>
    </div>
</div>