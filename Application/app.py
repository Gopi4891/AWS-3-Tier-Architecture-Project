from flask import Flask
app = Flask(__gopi__)

@app.route("/")
def home():
    return {"message": "Backend API Running"}

if __gopi__ == "__main__":
    app.run(host="0.0.0.0")
