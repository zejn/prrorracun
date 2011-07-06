from django.conf.urls.defaults import patterns, include, url
from django.conf import settings

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'proracun.views.home', name='home'),
    # url(r'^proracun/', include('proracun.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
    url(r'^p/$', 'proracun.views.proracun_list'),
    # treemap
    url(r'^p/(?P<po>(:?prihodki|odhodki))/(?P<leto>\d{4})/(?P<date>\d{4}-\d\d-\d\d)/$', 'proracun.views.treemap', name='proracun_treemap'),
    url(r'^p/proracun_(?P<po>(:?prihodki|odhodki))_(?P<leto>\d{4})_(?P<date>\d{4}-\d\d-\d\d)\.js$', 'proracun.views.treemap_js', name='proracun_treemap_js'),
    # areachart
    url(r'^p/proracun_area_(?P<po>(:?prihodki|odhodki))_(?P<sifra>\d+)_(?P<inflacija>\d).js$', 'proracun.views.areachart_js', name='proracun_areachart_js'),
    url(r'^p/a/(?P<po>(:?prihodki|odhodki))/(?P<inflacija>[012])/$', 'proracun.views.areachart', name='proracun_areachart'),
)


if settings.DEBUG:
    urlpatterns += patterns('',
        (r'^smedia/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    )

