# Using the chart

```
helm repo add pixelfed https://grrywlsn.github.io/pixelfed-helm
helm repo update
```

## Chart values

Required:

- APP_DOMAIN: "pixelfed.social"
- APP_NAME: "Pixelfed"
- APP_URL: "https://pixelfed.social"
- INSTANCE_CONTACT_EMAIL: "help@pixelfed.social"

## Laravel Passport (OAuth / mobile apps)

Passport signing keys must stay stable across pod restarts. Put PEMs in your Kubernetes `Secret` (for example via External Secrets from Scaleway Secrets Manager) as **`PASSPORT_PRIVATE_KEY`** and **`PASSPORT_PUBLIC_KEY`** — the full `-----BEGIN …-----` / `-----END …-----` blocks, one field per key. The chart mounts the secret with `envFrom`; Laravel reads them via `config/passport.php`.

When **both** variables are set, the container `start.sh` skips `php artisan passport:keys` so keys are not regenerated. If either is missing, startup still runs `passport:keys --force` (file-based keys on ephemeral disk).

For an **existing** instance, copy the current PEMs from the running container’s `storage/oauth-private.key` and `storage/oauth-public.key` so existing app tokens keep working. For a **new** install, generate once (any machine with PHP / the app image), then copy the files into the secret manager:

```bash
php artisan passport:keys --force
# read storage/oauth-private.key and storage/oauth-public.key
```
