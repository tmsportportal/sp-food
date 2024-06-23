from pathlib import Path
from datetime import timedelta
import os


BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = '5&django-insecure-71)-n-0k=8w!ojl=ftv(c)oe2*_%ce^v$#e(==a6p(_$tuhg'

DEBUG = True

ALLOWED_HOSTS = ['*']



INSTALLED_APPS = [
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    
    # restframework
    'rest_framework',
    'drf_yasg',
    'django_filters',
    
    # custom app's
    'product.apps.ProductConfig',
    'account.apps.AccountConfig',
    'basket.apps.BasketConfig',
    'checkout.apps.CheckoutConfig',
]


WHITENOISE_USE_GZIP = True


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'spfood.urls'

AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
)

REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        # 'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly',
        
    ],
    'DEFAULT_AUTHENTICATION_CLASSES': [
        # 'rest_framework_simplejwt.authentication.JWTAuthentication',
        # 'rest_framework.authentication.BasicAuthentication',
        # 'rest_framework.authentication.SessionAuthentication',
    ],
    'DEFAULT_SCHEMA_CLASS': 'rest_framework.schemas.coreapi.AutoSchema',
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 10
}

SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(minutes=5),
    "REFRESH_TOKEN_LIFETIME": timedelta(days=1),
    "ROTATE_REFRESH_TOKENS": False,
    "BLACKLIST_AFTER_ROTATION": False,
    "UPDATE_LAST_LOGIN": False,

    "ALGORITHM": "HS256",
    "SIGNING_KEY": SECRET_KEY,
    "VERIFYING_KEY": "",
    "AUDIENCE": None,
    "ISSUER": None,
    "JSON_ENCODER": None,
    "JWK_URL": None,
    "LEEWAY": 0,

    "AUTH_HEADER_TYPES": ("Bearer",),
    
}


SWAGGER_SETTINGS = {
   'SECURITY_DEFINITIONS': {
        'Bearer': {
            'type': 'apiKey',
            'name': 'Authorization',
            'in': 'header',
        }
    }
}


# JAZZMIN_SETTINGS = {
#     "site_title": "E-FOOD",
#     "site_header": "E-FOOD",
#     "site_brand": "E-FOOD",
#     "site_logo": "icons/logo.svg",
#     "site_logo_classes": "img-circle",
#     "site_icon": None,
#     "welcome_sign": "Welcome to the platform of Petronas",
#     "search_model": ["auth.User", "auth.Group"],
#     "user_avatar": None,
#     "topmenu_links": [
#         {"name": "Home",  "url": "admin:index", "permissions": ["auth.view_user"]},
#         {"name": "Support", "url": "https://github.com/farridav/django-jazzmin/issues", "new_window": True},
#         {"model": "auth.User"},
#         {"app": "books"},
#     ],

#     "usermenu_links": [
#         {"name": "Support", "url": "https://github.com/farridav/django-jazzmin/issues", "new_window": True},
#         {"model": "auth.user"}
#     ],
#     "show_sidebar": True,
#     "navigation_expanded": True,
#     "hide_apps": [],
#     "hide_models": [],
#     "order_with_respect_to": ["auth", "books", "books.author", "books.book"],
#     "custom_links": {
#         "books": [{
#             "name": "Make Messages", 
#             "url": "make_messages", 
#             "icon": "fas fa-comments",
#             "permissions": ["books.view_book"]
#         }]
#     },
#     "icons": {
#         "auth": "fas fa-users-cog",
#         "auth.user": "fas fa-user",
#         "auth.Group": "fas fa-users",
#     },
#     "default_icon_parents": "fas fa-chevron-circle-right",
#     "default_icon_children": "fas fa-circle",
#     "custom_css": None,
#     "custom_js": None,
#     "show_ui_builder": False,
# }


TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'spfood.wsgi.application'



DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}



AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]



LANGUAGE_CODE = 'ru'

TIME_ZONE = 'Asia/Ashgabat'

USE_I18N = True

USE_L10N = True

USE_TZ = True

LANGUAGES = (
    ('tk', 'Turkmen'),
    ('ru', 'Russian'),
    ('en', 'English'),
)


LOCALE_PATHS = [
    BASE_DIR / 'locale/'
]


MODELTRANSLATION_DEFAULT_LANGUAGE = 'tk'

MODELTRANSLATION_LANGUAGES = ('tk', 'ru')


STATIC_URL = '/static/'

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')

STATICFILES_DIRS = (os.path.join(BASE_DIR, "static"),)


DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
