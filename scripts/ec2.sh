#!/bin/bash
yum update -y
amazon-linux-extras install python3 -y
pip3 install flask
cd /home/ec2-user
echo "from flask import Flask
app = Flask(__gopi__)
@app.route('/')
def home():
    return 'Web Tier Running'
app.run(host='0.0.0.0')" > app.py
python3 app.py
