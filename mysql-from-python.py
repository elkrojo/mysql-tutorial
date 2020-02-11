# import os
import pymysql

# Get username from workspace
# username = os.getenv('')

# Connect to the database
connection = pymysql.connect(
                             user='root',
                             password='',
                             db='Chinook')

try:
    # Run a query
    with connection.cursor(pymysql.cursors.DictCursor) as cursor:
        # row = ("Bob", 21, "1990-02-06 23:04:56")
        # rows = [("Bob", 21, "1990-02-06 23:04:56"),
        #         ("Joe", 33, "1997-03-21 10:15:33"),
        #         ("Frank", 73, "1957-03-21 10:15:33")]
        # rows = [(23, 'Bob'),
        #         (24, 'Joe'),
        #         (25, 'Frank')]
        # names = ['Joe', 'Bob']
        list_of_names = ['Frank', 'Joe', 'Bob']
        # Prepare a string with the same number of placeholders as list
        format_strings = ','.join(['%s']*len(list_of_names))
        # cursor.execute("INSERT INTO Friends VALUES (%s, %s, %s);", row)
        # cursor.executemany("INSERT INTO Friends VALUES (%s, %s, %s);", rows)
        # cursor.execute("UPDATE Friends SET age = 22 WHERE name = 'Bob';")
        # cursor.execute("UPDATE Friends SET age = %s WHERE name = %s;",
        #                 (23, 'Bob'))
        # cursor.executemany("UPDATE Friends SET age = %s WHERE name = %s;",
        #                    rows)
        # cursor.execute("DELETE FROM Friends WHERE name = 'Bob';")
        # cursor.execute("DELETE FROM Friends WHERE name = %s;", 'Bob')
        # cursor.executemany("DELETE FROM Friends WHERE name = %s;", ['Bob',
        #                                                             'Joe'])
        # cursor.execute("DELETE FROM Friends WHERE name in = %s;", 'Bob')
        # cursor.execute("DELETE FROM Friends WHERE name in (%s, %s);", names)
        cursor.execute("DELETE FROM Friends WHERE name in ({});"
                       .format(format_strings), list_of_names)
        connection.commit()
        # cursor.execute("""CREATE TABLE IF NOT EXISTS
        #                 Friends(name char(20), age int, DOB datetime);""")
        # Note the above will display a warning (not error)
        # if the table already exists
        # sql = "SELECT * FROM Genre;"
        # cursor.execute(sql)
        # result = cursor.fetchall()
        # print(result)
        # for row in cursor:
        #     print(row)
finally:
    # Close the connection, regardless of whether the above was successful
    connection.close()
