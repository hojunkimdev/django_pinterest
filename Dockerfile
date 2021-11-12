FROM python:3.9.0

WORKDIR /home/

RUN echo "testing-v5"

RUN git clone https://github.com/hojunkimdev/django_pinterest.git

WORKDIR /home/django_pinterest/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-3+!g5+6y==02g12g=e9woq&_tjywtf*e2#t++l00hs^l8o+*%e" > .env

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=django_pinterest.settings.deploy && python manage.py migrate --settings=django_pinterest.settings.deploy && gunicorn django_pinterest.wsgi --env DJANGO_SETTINGS_MODULE=django_pinterest.settings.deploy --bind 0.0.0.0:8000"]
