#!/bin/bash
cd /home/mohammed.fazil/django-projects
git pull origin main

# Activate virtualenv if using
source django-env/bin/activate

# Install/update dependencies
pip install -r requirements.txt

# Apply migrations
cd todo_project
python manage.py migrate

# Collect static files (if needed)
python manage.py collectstatic --noinput

# Restart gunicorn / uwsgi / systemd service
sudo systemctl restart django_todo_project
