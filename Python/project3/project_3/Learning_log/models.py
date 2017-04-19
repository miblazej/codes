from django.db import models

import datetime
from django.utils import timezone


class Topic(models.Model):
    question_text = models.CharField(max_length=200)
    date_added = models.DateTimeField(auto_now_add=True)


def __str__(self):
    return self.text


# Create your models here.
