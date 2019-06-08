from flask import Flask, render_template, request, redirect, url_for, flash, jsonify
from flask_mysqldb import MySQL 

app = Flask(__name__)

# MySQL Connection
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'task'
mysql = MySQL(app)

# App Settings
app.secret_key = 'mysecretkey'

@app.route('/')
def Index():
	cur = mysql.connection.cursor()
	sql = 'SELECT * FROM task ORDER BY id ASC'
	cur.execute(sql)
	data = cur.fetchall()
	print(data)
	cur.execute('SELECT COUNT(*) FROM task LIMIT 1')
	count = cur.fetchall()
	count = count[0][0]
	return render_template('index.html', contacts = data, count = count )

@app.route('/add', methods=['POST'])
def add_task():
	if request.method == 'POST':
		title = request.form['title']
		description = request.form['description']
		priority = request.form['priority']

	print(title)
	print(description)
	print(priority)

	cur = mysql.connection.cursor()
	sql = 'INSERT INTO task(title, priority, description) VALUES(%s ,%s ,%s )'
	cur.execute(sql, (title, priority, description))
	mysql.connection.commit()
	flash('Task Added successfully')

	return redirect(url_for('Index'))

@app.route('/edit/<string:id>', methods=['POST'])
def edit_task(id):
	if request.method == 'POST':
		update_title = request.form['updateTitle']
		update_priority = request.form['updatePriority']
		update_description = request.form['updateDescription']

		cur = mysql.connection.cursor()
		query = 'UPDATE task SET title=%s , priority=%s, description=%s WHERE id=%s'
		cur.execute(query, (update_title, update_priority, update_description, id))
		mysql.connection.commit()
	flash("Task edited successfully")

	return redirect(url_for('Index'))

@app.route('/delete/<string:id>')
def delete_task(id):

	cur = mysql.connection.cursor()
	cur.execute('DELETE FROM task WHERE id = {0}'.format(id))
	mysql.connection.commit()
	flash("Task delete successfully")
	return redirect(url_for('Index'))

@app.route('/task/list')
def all_task():
	
	cur = mysql.connection.cursor()
	cur.execute('SELECT * FROM task')
	row = cur.fetchall()
	json_row = jsonify(row)

	return json_row

@app.route('/task/add', methods=['POST'])
def json_add_task():

	try:
		
		_json = request.json
		_title = _json['title']
		_description = _json['description']
		_priority = _json['priority']

		cur = mysql.connection.cursor()
		sql = "INSERT INTO task(title, description, priority) VALUES(%s, %s, %s)"
		cur.execute(sql, (_title, _description, _priority))
		mysql.connection.commit()

		resp = jsonify("Task Added Successfully!")
		resp.status_code = 200
		return resp


	except Exception as e:
		print(e)
	else:
		return not_found()
	finally:
		cur.close()


if __name__ == '__main__':
	app.run(port=3000, debug=True)