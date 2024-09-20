import os
from invoke import task


@task
def dev(ctx):
    ctx.run(
        "flask --app app.web run --debug --port 8000",
        pty=os.name != "nt",
        env={"APP_ENV": "development"},
    )

@task
def devworker(ctx):
    ctx.run(
        "watchmedo auto-restart --directory=./app --pattern=*.py --recursive -- celery -A app.celery.worker worker --concurrency=1 --loglevel=INFO --pool=solo",
        pty=os.name != "nt",
        env={"APP_ENV": "development"},
    )

@task
def prod(ctx):
    ctx.run(
        "flask --app app.web run --host=0.0.0.0 --port=5000",
        pty=os.name != "nt",
        env={"APP_ENV": "production"},
    )

@task
def prodworker(ctx):
    ctx.run(
        "celery -A app.celery.worker worker --concurrency=4 --loglevel=INFO",
        pty=os.name != "nt",
        env={"APP_ENV": "production"},
    )

