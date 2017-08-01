import IPython.ipapi

ip = IPython.ipapi.get()

o = ip.options
o.pprint = 1
o.confirm_exit = 0
o.banner = 0

ip.ex(r"""
import os
import re
import sys
import time
import posix
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
    from django.conf import settings
    from django.core.cache import cache
    from django.contrib.auth.models import User, SiteProfileNotAvailable
    from django.core.urlresolvers import reverse, resolve

    def u(username):
        return User.objects.get(username=username)

    try:
        username = 'benji'
        locals()[username] = user = u(username)

        try:
            profile = user.get_profile()
            Profile = profile.__class__
        except SiteProfileNotAvailable:
            pass

    except User.DoesNotExist:
        pass

except ImportError:
    pass
except Exception as e:
    print "W: Not setting up django stuff due to: %r" % e
""")

import ipy_greedycompleter
