FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/hojunkimdev/django_pinterest.git

WORKDIR /home/django_pinterest/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN echo "SECRET_KEY=django-insecure-3+!g5+6y==02g12g=e9woq&_tjywtf*e2#t++l00hs^l8o+*%e" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["gunicorn", "django_pinterest.wsgi", "--bind", "0.0.0.0:8000"]
