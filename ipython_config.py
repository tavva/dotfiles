c = get_config()

from IPython.frontend.terminal.embed import InteractiveShellEmbed

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
    from django.db import models, transaction, connection, connections
    from django.conf import settings
    from django.core.cache import cache
    from django.utils.functional import memoize
    from django.contrib.auth.models import User, SiteProfileNotAvailable
    from django.db.models.expressions import F
    from django.core.urlresolvers import reverse, resolve

    def u(val):
        # For ipython
        from django.contrib.auth.models import User
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
    u = memoize(u, {}, 1)

    def a(app_name):
         globals().update(models.get_app(app_name).__dict__)

    try:
        cursor = connection.cursor()

        try:
            user = u('ben')
        except User.DoesNotExist:
            user = u('ben@ben-phillips.net')

        locals()['ben'] = user

        try:
            profile = user.get_profile()
            Profile = profile.__class__
        except SiteProfileNotAvailable:
            pass

    except User.DoesNotExist:
        pass

except ImportError:
    pass
except Exception, e:
    print "W: Not setting up Django imports due to: %r" % e
    raise
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
