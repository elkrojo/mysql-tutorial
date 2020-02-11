# import os
import pymysql

# Get username from workspace
# username = os.getenv('')

# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='user',
                             db='Chinook')

try:
    # Run a query
    with connection.cursor() as cursor:
        sql = "SELECT * FROM Artist;"
        cursor.execute(sql)
        result = cursor.fetchall()
        print(result)
finally:
    # Close teh connection, regardless of whether the above was successful
    connection.close()
