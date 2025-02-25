import sqlite3

# Create a dummy in-memory database
connection = sqlite3.connect(':memory:')
cursor = connection.cursor()

# Create a dummy table
cursor.execute('''
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
)
''')

# Insert some dummy data
employees = [
    (1, 'Alice', 'Engineering', 80000),
    (2, 'Bob', 'HR', 60000),
    (3, 'Charlie', 'Marketing', 70000)
]
cursor.executemany('INSERT INTO employees VALUES (?, ?, ?, ?)', employees)

# Commit changes
connection.commit()

# Query the table
cursor.execute('SELECT * FROM employees')
results = cursor.fetchall()

# Print results
for row in results:
    print(row)

# Close the connection
connection.close()
