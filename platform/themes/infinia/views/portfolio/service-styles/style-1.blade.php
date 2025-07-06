<section class="section-services-details pt-80">
    <div class="container">
        @if ($service->image)
            {{ RvMedia::image($service->image, $service->name, 'medium', attributes: ['class' => 'rounded-3']) }}
        @endif
        <div @class(['row', 'pt-8' => $service->image])>
            @if ($serviceSidebar)
                <div class="col-lg-4 sidebar d-flex flex-column gap-5">
                    {!! $serviceSidebar !!}
                </div>
            @endif
            <div @class(['content', 'col-lg-8 ps-lg-4 mt-lg-0 mt-8 ' => ! empty($serviceSidebar)])>
                <div class="ck-content">
                    {!! BaseHelper::clean($service->content) !!}
                </div>
                <div class="d-flex align-items-center justify-content-end mt-5 py-3">
                    <div class="d-lg-flex align-items-center">
                        <p class="fw-bold text-500 mb-0 me-2">{{ __('Share this service') }}:</p>
                        {!! Theme::renderSocialSharing($service->url, SeoHelper::getDescription(), $service->image) !!}
                    </div>
                </div>
                {!! apply_filters(BASE_FILTER_PUBLIC_COMMENT_AREA, null, $service) !!}
            </div>
        </div>
    </div>
</section>
