# Instructions

To create a project, run the following:

```
docker-compose run web django-admin.py startproject <project-name> .
```

In the project directory, edit the `<project-name>/settings.py` file. Replace the `DATABASES = ...` with the following:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
```

Run `docker-compose up` and navigate to `http://localhost:8000`.

To shut down, run `docker-compose down`.
