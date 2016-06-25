#!/usr/bin/python

import smtplib

server = smtplib.SMTP_SSL('smtpout.secureserver.net', 465)

server.login("info@melify.com", "Melify")

msg = "Please work!!!!!!"
fromaddr = "info@melify.com"
toaddr = "mel.heravi@gmail.com"

server.sendmail(fromaddr, toaddr, msg)

