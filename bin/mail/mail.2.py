#!/usr/bin/python

import sys
import os
import re

from smtplib import SMTP_SSL as SMTP       # this invokes the secure SMTP protocol (port 465, uses SSL)
# from smtplib import SMTP                  # use this for standard SMTP protocol   (port 25, no encryption)

# old version
# from email.MIMEText import MIMEText
from email.mime.text import MIMEText

sender      = "Info@TurnOnGreen.com"
destination = ["MelifyIT@gmail.com"]
username    = "Info@TurnOnGreen.com"
password    = "RedOlive1"

# typical values for text_subtype are plain, html, xml
text_subtype = "plain"
content      = """Test message"""
subject      = "Sent from Python"

try:
    msg            = MIMEText(content, text_subtype)
    msg["Subject"] = subject
    msg["From"]    = sender # some SMTP servers will do this automatically, not all
    conn           = SMTP("smtpout.secureserver.net")

    conn.set_debuglevel(True)
    conn.login(username, password)

    try:
        conn.sendmail(sender, destination, msg.as_string())
    finally:
        conn.quit()

except Exception, exc:
    sys.exit( "mail failed; %s" % str(exc) ) # give a error message
