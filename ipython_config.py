c = get_config()

try:
    from IPython.frontend.terminal.embed import InteractiveShellEmbed
except ImportError:
    from IPython.terminal.embed import InteractiveShellEmbed

STARTUP = r"""
import os
import re
import sys
import time
import posix
import random
import urllib
import urllib2
import datetime
import itertools
import subprocess

now = datetime.datetime.now
utcnow = datetime.datetime.utcnow

try:
    from BeautifulSoup import BeautifulSoup
    BS = BeautifulSoup
except ImportError:
    pass

try:
    from django import apps
    from django.db import models, transaction, connection, connections
    from django.conf import settings
    from django.core.cache import cache
    from django.utils.lru_cache import lru_cache
    from django.contrib.auth.models import User
    from django.db.models.expressions import F
    from django.core.urlresolvers import reverse, resolve
    from django.contrib.auth.models import User

    User.__unicode__ = lambda x: x.get_full_name()

    def u(val):
        # For ipython
        if not isinstance(val, basestring):
            return User.objects.get(pk=val)

        if '@' in val:
            return User.objects.get(email=val)

        for field in ('username', 'last_name', 'first_name'):
            if field not in [x.attname for x in User._meta.fields]:
                continue

            try:
                return User.objects.get(**{field: val})
            except User.DoesNotExist:
                pass

        if ' ' in val:
            first, last = val.split(' ')
            try:
                return User.objects.get(first_name=first, last_name=last)
            except User.DoesNotExist:
                pass

        raise User.DoesNotExist()

    try:
        def o(val):
            from styleme.orders.models import Order
            return Order.objects.get(pk=val)
    except ImportError:
        pass

    for model in apps.apps.get_models():
        globals()['%s_%s' % (model._meta.app_label, model._meta.object_name)] = model
        del model

    try:
        cursor = connection.cursor()

        user = u('ben@thread.com')

        locals()['ben'] = user

        try:
            profile = user.get_profile()
            Profile = profile.__class__
        except AttributeError:
            pass

    except User.DoesNotExist:
        pass

except ImportError:
    pass
except Exception, e:
    print "W: Not setting up Django imports due to: %r" % e
    raise

class redirect_output(object):
    def __init__(self, stdout='', stderr=''):
        self.stdout = stdout
        self.stderr = stderr

    def __enter__(self):
        self.sys_stdout = sys.stdout
        self.sys_stderr = sys.stderr

        if self.stdout:
            sys.stdout = open(self.stdout, 'w')
        if self.stderr:
            if self.stderr == self.stdout:
                sys.stderr = sys.stdout
            else:
                sys.stderr = open(self.stderr, 'w')

    def __exit__(self, exc_type, exc_value, traceback):
        sys.stdout = self.sys_stdout
        sys.stderr = self.sys_stderr
"""

c.TerminalIPythonApp.display_banner = False

def show_banner(self):
    self.run_cell(STARTUP)
InteractiveShellEmbed.show_banner = show_banner

c.TerminalIPythonApp.exec_lines = [STARTUP]

c.TerminalInteractiveShell.colors = 'Linux'
c.TerminalInteractiveShell.confirm_exit = False
c.TerminalInteractiveShell.pager = 'most'

c.IPCompleter.greedy = True
