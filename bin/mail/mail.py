#!/usr/bin/python

import smtplib

server = smtplib.SMTP_SSL('smtpout.secureserver.net', 465)
#server.starttls()

server.login("Info@TurnOnGreen.com", "RedOlive1")

msg = "Please work!!!!!!"
fromaddr = "Info@TurnOnGreen.com"
toaddr = "MelifyIT@gmail.com"

server.sendmail(fromaddr, toaddr, msg)

