# pixelfed

![Version: v2.0.0](https://img.shields.io/badge/Version-v2.0.0-informational?style=flat-square) ![AppVersion: 0.12.5](https://img.shields.io/badge/AppVersion-0.12.5-informational?style=flat-square)

Helm chart to deploy Pixelfed

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config.APP_NAME | string | `""` | The name for your Pixelfed server (how it appears in the UI) (REQUIRED) |
| config.APP_URL | string | `""` | The URL of your Pixelfed server (e.g. pixelfed.example.com) - Do not include https:// (REQUIRED) |
| config.INSTANCE_CONTACT_EMAIL | string | `""` | The email address for your Pixelfed admin/support address (REQUIRED) |
| config.aws.AWS_BUCKET | string | `""` |  |
| config.aws.AWS_DEFAULT_REGION | string | `""` |  |
| config.aws.AWS_ENDPOINT | string | `""` |  |
| config.aws.AWS_URL | string | `""` |  |
| config.aws.AWS_USE_PATH_STYLE_ENDPOINT | string | `""` |  |
| config.aws.AWS_VISIBILITY | string | `"public"` |  |
| config.database.DB_CONNECTION | string | `"pgsql"` |  |
| config.database.DB_DATABASE | string | `"postgres"` |  |
| config.database.DB_HOST | string | `"localhost"` |  |
| config.database.DB_PORT | string | `"5432"` |  |
| config.domain.ADMIN_DOMAIN | string | `""` | The URL for the domain access; defaults to APP_DOMAIN |
| config.domain.APP_DOMAIN | string | `""` | The URL at which your Pixelfed server is accessible (e.g. https://pixelfed.example.com) - Must include https:// (REQUIRED) |
| config.domain.SESSION_DOMAIN | string | `""` | The URL for the domain session; defaults to APP_DOMAIN |
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
| config.mail.MAIL_DRIVER | string | `"smtp"` |  |
| config.mail.MAIL_ENCRYPTION | string | `""` |  |
| config.mail.MAIL_FROM_ADDRESS | string | `""` |  |
| config.mail.MAIL_FROM_NAME | string | `""` |  |
| config.mail.MAIL_HOST | string | `""` |  |
| config.mail.MAIL_PASSWORD | string | `""` |  |
| config.mail.MAIL_PORT | string | `""` |  |
| config.media.IMAGE_DRIVER | string | `"imagick"` |  |
| config.media.IMAGE_QUALITY | string | `"95"` |  |
| config.media.MEDIA_EXIF_DATABASE | string | `"true"` |  |
| config.media.PF_OPTIMIZE_IMAGES | string | `"true"` |  |
| config.media.PF_OPTIMIZE_VIDEOS | string | `"true"` |  |
| config.network.FORCE_HTTPS_URLS | string | `"true"` | Redirects HTTP to HTTPS |
| config.network.TRUST_PROXIES | string | `"*"` | Proxies to trust, defaults to "*" to allow nginx-ingress or similar Kubernetes proxy |
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
| config.redis.BROADCAST_DRIVER | string | `"redis"` |  |
| config.redis.CACHE_DRIVER | string | `"redis"` |  |
| config.redis.QUEUE_DRIVER | string | `"redis"` |  |
| config.redis.REDIS_CLIENT | string | `"predis"` |  |
| config.redis.REDIS_HOST | string | `"localhost"` |  |
| config.redis.REDIS_PORT | string | `"6379"` |  |
| config.redis.REDIS_PREFIX | string | `""` |  |
| config.redis.REDIS_SCHEME | string | `"tcp"` |  |
| config.runtime.ADMIN_ENV_EDITOR | string | `"false"` | Whether to use the env editor in the admin panel |
| config.runtime.APP_DEBUG | string | `"false"` | Tells Laravel and the Pixelfed server to enable debugging mode |
| config.runtime.APP_ENV | string | `"production"` | Tells Laravel and the Pixelfed server to use the production environment |
| config.runtime.APP_LOCALE | string | `"en"` | Default locale to use for the server |
| config.runtime.APP_TIMEZONE | string | `"UTC"` | Default timezone to use for the server |
| config.runtime.ENABLE_CONFIG_CACHE | string | `"true"` | Tells Laravel and the Pixelfed server to cache config (this is recommended for production) |
| config.runtime.LOG_CHANNEL | string | `"stack"` | How the server should log messages |
| config.runtime.LOG_LEVEL | string | `"debug"` | The default level of logging to use |
| config.server.ACCOUNT_DELETE_AFTER | string | `"false"` | Set to either a number of days after which to purge a deleted account, or "false" to delete immediately |
| config.server.ACCOUNT_DELETION | string | `"true"` | Enable account deletion (may be a requirement in some jurisdictions) |
| config.server.BANNED_USERNAMES | string | `""` | Usernames to ban from registering |
| config.server.ENFORCE_EMAIL_VERIFICATION | string | `"true"` | Enforces email verification for new accounts, before the account is activated |
| config.server.INSTANCE_CONTACT_FORM | string | `"true"` | If the contact form should be shown on the instance landing page |
| config.server.INSTANCE_CUR_REG | string | `"false"` | Enable Curated Registration |
| config.server.INSTANCE_DESCRIPTION | string | `"Decentralized photo sharing social media powered by Pixelfed"` | A description of your Pixelfed server |
| config.server.INSTANCE_DISCOVER_PUBLIC | string | `"true"` | Enables public access to the Discover feature |
| config.server.INSTANCE_LANDING_SHOW_DIRECTORY | string | `"true"` | Enable the profile directory on the landing page |
| config.server.INSTANCE_LANDING_SHOW_EXPLORE | string | `"true"` | Enable the popular post explore on the landing page |
| config.server.INSTANCE_POST_EMBEDS | string | `"true"` | Enable the post embed feature |
| config.server.INSTANCE_PROFILE_EMBEDS | string | `"true"` | Enable the profile embed feature |
| config.server.INSTANCE_PUBLIC_HASHTAGS | string | `"true"` | Allow anonymous access to hashtag feeds |
| config.server.INSTANCE_SHOW_PEERS | string | `"true"` | Enable the api/v1/peers API endpoint |
| config.server.LIMIT_ACCOUNT_SIZE | string | `"true"` | Whether to enforce the account size limits |
| config.server.MAX_ACCOUNT_SIZE | string | `"2000000"` | The max allowed account size in KB |
| config.server.MAX_ALBUM_LENGTH | string | `"10"` | The max number of media per post album |
| config.server.MAX_AVATAR_SIZE | string | `"2000"` | The max user avatar size in KB |
| config.server.MAX_BIO_LENGTH | string | `"300"` | The max user bio length |
| config.server.MAX_CAPTION_LENGTH | string | `"500"` | The max post caption length |
| config.server.MAX_LINKS_PER_POST | string | `"1"` | Maximum number of URLs per post that will be rendered as a link |
| config.server.MAX_NAME_LENGTH | string | `"30"` | The max user display name length |
| config.server.MAX_PHOTO_SIZE | string | `"15000"` | The max photo/video size in KB	 |
| config.server.MIN_PASSWORD_LENGTH | string | `"8"` | The min password length |
| config.server.OAUTH_ENABLED | string | `"true"` | Enable oAuth support, required for mobile/3rd party apps |
| config.server.OPEN_REGISTRATION | string | `"true"` | If your server is open for public signups |
| config.server.PF_ADMIN_INVITES_ENABLED | string | `"true"` | Enable the Admin Invites feature |
| config.server.PF_COSTAR_ENABLED | string | `"false"` | Enable the Costar feature |
| config.server.PF_ENFORCE_MAX_USERS | string | `"true"` | Whether to enforce the max user limit |
| config.server.PF_HIDE_NSFW_ON_PUBLIC_FEEDS | string | `"true"` | Hide sensitive posts from public/network feeds |
| config.server.PF_MAX_COLLECTION_LENGTH | string | `"100"` | Max collection post limit |
| config.server.PF_MAX_DOMAIN_BLOCKS | string | `"50"` | The max number of domain blocks per account |
| config.server.PF_MAX_USERS | string | `"2000"` | Limit max user registrations |
| config.server.PF_MAX_USER_BLOCKS | string | `"50"` | The max number of user blocks per account |
| config.server.PF_MAX_USER_MUTES | string | `"50"` | The max number of user mutes per account |
| config.server.RESTRICTED_INSTANCE | string | `"false"` | If your server is open for public signups but requires email verification |
| config.server.RESTRICT_HTML_TYPES | string | `"true"` | Prevent risky HTML types from being parsed in comments and other user |
| config.server.STORIES_ENABLED | string | `"true"` | Enable the Stories feature |
| config.server.instagram.PF_IMPORT_FROM_INSTAGRAM | string | `"true"` | Whether to enable the Instagram import feature |
| config.server.instagram.PF_IMPORT_IG_ALLOW_VIDEO_POSTS | string | `"true"` |  |
| config.server.instagram.PF_IMPORT_IG_MAX_ATTEMPTS | string | `"-1"` |  |
| config.server.instagram.PF_IMPORT_IG_MAX_POSTS | string | `"100"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_ADMIN_FOLLOWS_ONLY | string | `"false"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_ADMIN_ONLY | string | `"false"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_MIN_ACCOUNT_AGE | string | `"0"` |  |
| config.server.instagram.PF_IMPORT_IG_PERM_MIN_FOLLOWER_COUNT | string | `"0"` |  |
| config.session.SESSION_DRIVER | string | `"database"` | The session driver to use to store user sessions |
| config.session.SESSION_LIFETIME | string | `"86400"` | The lifetime of the session in seconds, defaults to 86400 (24 hours) |
| config.storage.FILESYSTEM_CLOUD | string | `"s3"` |  |
| config.storage.FILESYSTEM_DRIVER | string | `"local"` |  |
| config.storage.MEDIA_DELETE_LOCAL_AFTER_CLOUD | string | `"true"` |  |
| config.storage.PF_ENABLE_CLOUD | string | `"false"` |  |
| config.storage.PF_LOCAL_AVATAR_TO_CLOUD | string | `"false"` |  |
| existingSecret | string | `""` | The name of a secret to use instead of generating it from input values |
| image.repo | string | `"ghcr.io/grrywlsn/pixelfed-helm"` | repo to pull the Pixelfed image from |
| image.tag | string | `"v2.0.0"` | version of the image to pull |
| secret.APP_KEY | string | `""` | The secret key used to encrypt user sessions and other sensitive data (REQUIRED) |
| secret.PIXELFED_PUSHGATEWAY_KEY | string | `""` |  |
| secret.aws.AWS_ACCESS_KEY_ID | string | `""` |  |
| secret.aws.AWS_SECRET_ACCESS_KEY | string | `""` |  |
| secret.database.DB_PASSWORD | string | `""` |  |
| secret.database.DB_USERNAME | string | `""` |  |
| secret.mail.MAIL_PASSWORD | string | `""` |  |
| secret.mail.MAIL_USERNAME | string | `""` |  |
| secret.redis.REDIS_PASSWORD | string | `""` |  |
| secret.redis.REDIS_USERNAME | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
