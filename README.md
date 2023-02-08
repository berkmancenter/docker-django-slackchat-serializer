# Docker machine for django-slackchat-serializer

It's a Docker devleopment machine for the https://github.com/The-Politico/django-slackchat-serializer application.

# How to use

```
cp .env.dev_example .env
```
Set environment variables for your instance
```
docker-compose up
```
```
docker-compose exec slack_liveblog bash
```
```
./serv
```

Visit `127.0.0.1:4949` on your host.

# Environment variables

| Variable | Description | Default |
| - | - | - |
| `DEBUG` | Enables verbosed output | `1`
| `SECRET_KEY` | Django secret key | `foo`
| `DJANGO_ALLOWED_HOSTS` | Hosts allowed by the Django application | `localhost 127.0.0.1 [::1] .ngrok.io`
| `SQL_ENGINE` | Django database engine used | `django.db.backends.postgresql`
| `SQL_DATABASE` | Database name | `slack_liveblog_dev`
| `SQL_USER` | Database username | `slack_liveblog_dev`
| `SQL_PASSWORD` | Database password | `123456`
| `SQL_HOST` | Database hostname | `postgres`
| `SQL_PORT` | Database connection port | `5432`
| `ENV_DIR` | Python virtual environment name | `slack_liveblog_dev_env`
| `SLACK_VERIFICATION_TOKEN` | Slack team verification token |
| `SLACK_API_TOKEN` | Slack API token |
| `NGROK_AUTHTOKEN` | Ngrok auth token |
| `SLACKCHAT_DEFAULT_OWNER` | Default channel owner |
| `SLACKCHAT_TEAM_ROOT` | Slack team root url |
| `NGROK_AUTHTOKEN` | Ngrok auth token |
| `SLACKCHAT_PUBLISH_ROOT` | Blog application root |
| `CELERY_BROKER_URL` | Celery broker url | `redis://redis:6379/0`
| `CELERY_RESULT_BACKEND` | Celery back-end for storing tasks results | `redis://redis:6379/0`
