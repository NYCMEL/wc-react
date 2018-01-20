#!/usr/bin/python

import sqlite3
import json
import sys

DB = sys.argv[1]

conn = sqlite3.connect( DB )
conn.row_factory = sqlite3.Row # This enables column access by name: row['column_name'] 
db = conn.cursor()

rows = db.execute(sys.argv[2]).fetchall()

conn.commit()
conn.close()

print json.dumps( [dict(ix) for ix in rows] ) #CREATE JSON


####
#### ./query.py path-top/sqlite.db "select * from users where fname='Isac'"
