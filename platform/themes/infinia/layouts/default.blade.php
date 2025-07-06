@extends(Theme::getThemeNamespace('layouts.base'))

@section('content')
    <div class="container py-6">
        {!! Theme::get('beforeContent') !!}

        {!! apply_filters('ads_render', null, 'main_content_before', ['class' => 'my-2 text-center']) !!}

        {!! Theme::content() !!}

        {!! apply_filters('ads_render', null, 'main_content_after', ['class' => 'my-2 text-center']) !!}

        {!! Theme::get('afterContent') !!}
    </div>
@endsection
