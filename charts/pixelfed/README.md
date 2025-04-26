# pixelfed

![Version: v1.7.1](https://img.shields.io/badge/Version-v1.7.1-informational?style=flat-square) ![AppVersion: 0.12.4](https://img.shields.io/badge/AppVersion-0.12.4-informational?style=flat-square)

Helm chart to deploy Pixelfed

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.domain.ADMIN_DOMAIN | string | `""` |  |
| config.domain.APP_DOMAIN | string | `""` |  |
| config.domain.SESSION_DOMAIN | string | `""` |  |
| config.federation.ACTIVITY_PUB | string | `"true"` |  |
| config.federation.AP_INBOX | string | `"true"` |  |
| config.federation.AP_OUTBOX | string | `"true"` |  |
| config.federation.AP_REMOTE_FOLLOW | string | `"true"` |  |
| config.federation.AP_SHAREDINBOX | string | `"true"` |  |
| config.federation.ATOM_FEEDS | string | `"true"` |  |
| config.federation.EXP_EMC | string | `"true"` |  |
| config.federation.NODEINFO | string | `"true"` |  |
| config.federation.WEBFINGER | string | `"true"` |  |
| config.horizon.HORIZON_BALANCE_STRATEGY | string | `"auto"` |  |
| config.horizon.HORIZON_DARKMODE | string | `"false"` |  |
| config.horizon.HORIZON_MAX_PROCESSES | string | `"20"` |  |
| config.horizon.HORIZON_MEMORY_LIMIT | string | `"64"` |  |
| config.horizon.HORIZON_MIN_PROCESSES | string | `"1"` |  |
| config.horizon.HORIZON_PREFIX | string | `"horizon-"` |  |
| config.horizon.HORIZON_SUPERVISOR_MEMORY | string | `"64"` |  |
| config.horizon.HORIZON_SUPERVISOR_NICE | string | `"0"` |  |
| config.horizon.HORIZON_SUPERVISOR_TIMEOUT | string | `"300"` |  |
| config.horizon.HORIZON_SUPERVISOR_TRIES | string | `"3"` |  |
| config.media.IMAGE_DRIVER | string | `"imagick"` |  |
| config.media.IMAGE_QUALITY | string | `"95"` |  |
| config.media.MEDIA_EXIF_DATABASE | string | `"true"` |  |
| config.media.PF_OPTIMIZE_IMAGES | string | `"true"` |  |
| config.media.PF_OPTIMIZE_VIDEOS | string | `"true"` |  |
| config.network.FORCE_HTTPS_URLS | string | `"true"` |  |
| config.network.TRUST_PROXIES | string | `"*"` |  |
| config.php.PHP_DATE_TIMEZONE | string | `"UTC"` |  |
| config.php.PHP_DISPLAY_ERRORS | string | `"off"` |  |
| config.php.PHP_ERROR_REPORTING | string | `"E_ALL & ~E_DEPRECATED & ~E_STRICT"` |  |
| config.php.PHP_MAX_FILE_UPLOADS | string | `"10"` |  |
| config.php.PHP_MEMORY_LIMIT | string | `"128M"` |  |
| config.php.PHP_OPCACHE_ENABLE | string | `"1"` |  |
| config.php.PHP_OPCACHE_REVALIDATE_FREQ | string | `"2"` |  |
| config.php.PHP_OPCACHE_VALIDATE_TIMESTAMPS | string | `"0"` |  |
| config.php.PHP_POST_MAX_SIZE | string | `"100M"` |  |
| config.php.PHP_UPLOAD_MAX_FILESIZE | string | `"100M"` |  |
| config.runtime.ADMIN_ENV_EDITOR | string | `"false"` |  |
| config.runtime.APP_DEBUG | string | `"false"` |  |
| config.runtime.APP_ENV | string | `"production"` |  |
| config.runtime.APP_LOCALE | string | `"en"` |  |
| config.runtime.APP_TIMEZONE | string | `"UTC"` |  |
| config.runtime.ENABLE_CONFIG_CACHE | string | `"true"` |  |
| config.runtime.LOG_CHANNEL | string | `"stack"` |  |
| config.runtime.LOG_LEVEL | string | `"debug"` |  |
| config.server.ACCOUNT_DELETE_AFTER | string | `"false"` |  |
| config.server.ACCOUNT_DELETION | string | `"true"` |  |
| config.server.BANNED_USERNAMES | string | `""` |  |
| config.server.ENFORCE_EMAIL_VERIFICATION | string | `"true"` |  |
| config.server.INSTANCE_CONTACT_FORM | string | `"true"` |  |
| config.server.INSTANCE_DESCRIPTION | string | `"Decentralized photo sharing social media powered by Pixelfed"` |  |
| config.server.INSTANCE_DISCOVER_PUBLIC | string | `"true"` |  |
| config.server.INSTANCE_LANDING_SHOW_DIRECTORY | string | `"true"` |  |
| config.server.INSTANCE_LANDING_SHOW_EXPLORE | string | `"true"` |  |
| config.server.INSTANCE_POST_EMBEDS | string | `"true"` |  |
| config.server.INSTANCE_PROFILE_EMBEDS | string | `"true"` |  |
| config.server.INSTANCE_PUBLIC_HASHTAGS | string | `"true"` |  |
| config.server.INSTANCE_SHOW_PEERS | string | `"true"` |  |
| config.server.LIMIT_ACCOUNT_SIZE | string | `"true"` |  |
| config.server.MAX_ACCOUNT_SIZE | string | `"2000000"` |  |
| config.server.MAX_ALBUM_LENGTH | string | `"10"` |  |
| config.server.MAX_AVATAR_SIZE | string | `"2000"` |  |
| config.server.MAX_BIO_LENGTH | string | `"300"` |  |
| config.server.MAX_CAPTION_LENGTH | string | `"500"` |  |
| config.server.MAX_LINKS_PER_POST | string | `"1"` |  |
| config.server.MAX_NAME_LENGTH | string | `"30"` |  |
| config.server.MAX_PHOTO_SIZE | string | `"15000"` |  |
| config.server.MIN_PASSWORD_LENGTH | string | `"8"` |  |
| config.server.OAUTH_ENABLED | string | `"true"` |  |
| config.server.OPEN_REGISTRATION | string | `"true"` |  |
| config.server.PF_ADMIN_INVITES_ENABLED | string | `"true"` |  |
| config.server.PF_COSTAR_ENABLED | string | `"false"` |  |
| config.server.PF_ENFORCE_MAX_USERS | string | `"true"` |  |
| config.server.PF_HIDE_NSFW_ON_PUBLIC_FEEDS | string | `"true"` |  |
| config.server.PF_MAX_COLLECTION_LENGTH | string | `"100"` |  |
| config.server.PF_MAX_DOMAIN_BLOCKS | string | `"50"` |  |
| config.server.PF_MAX_USERS | string | `"2000"` |  |
| config.server.PF_MAX_USER_BLOCKS | string | `"50"` |  |
| config.server.PF_MAX_USER_MUTES | string | `"50"` |  |
| config.server.RESTRICTED_INSTANCE | string | `"false"` |  |
| config.server.RESTRICT_HTML_TYPES | string | `"true"` |  |
| config.server.STORIES_ENABLED | string | `"true"` |  |
| config.server.instagram.PF_IMPORT_FROM_INSTAGRAM | string | `"true"` |  |
| config.server.instagram.PF_IMPORT_IG_ALLOW_VIDEO_POSTS | string | `"true"` |  |
| config.server.instagram.PF_IMPORT_IG_MAX_ATTEMPTS | string | `"-1"` |  |
| config.server.instagram.PF_IMPORT_IG_MAX_POSTS | string | `"100"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_ADMIN_FOLLOWS_ONLY | string | `"false"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_ADMIN_ONLY | string | `"false"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_MIN_ACCOUNT_AGE | string | `"0"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_MIN_FOLLOWER_COUNT | string | `"0"` |  |
| config.session.SESSION_DRIVER | string | `"database"` |  |
| config.session.SESSION_LIFETIME | string | `"86400"` |  |
| config.storage.FILESYSTEM_CLOUD | string | `"s3"` |  |
| config.storage.FILESYSTEM_DRIVER | string | `"local"` |  |
| config.storage.MEDIA_DELETE_LOCAL_AFTER_CLOUD | string | `"true"` |  |
| config.storage.PF_ENABLE_CLOUD | string | `"false"` |  |
| config.storage.PF_LOCAL_AVATAR_TO_CLOUD | string | `"false"` |  |
| createSecret | bool | `false` |  |
| image.repo | string | `"ghcr.io/grrywlsn/pixelfed-helm"` | repo to pull the Pixelfed image from |
| image.tag | string | `"v1.7.1"` | version of the image to pull |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
