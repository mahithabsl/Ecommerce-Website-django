from django.urls import path,re_path
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('',views.index ),
    path('home/',views.index ),
    path('registration/', views.u_register),
    path('userlogin/', views.userlogin),
    path('userauth/', views.userauth),
    path('productdetails/', views.productdetails),
    path('login/', views.userauth),
    path('logout/', views.logout),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)