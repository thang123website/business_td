@php
    $style = $shortcode->style;
    $style = in_array($style, range(1, 2)) ? $style : 1;
@endphp

{!! Theme::partial("shortcodes.about-us-information.styles.style-$style", compact('shortcode', 'features')) !!}
