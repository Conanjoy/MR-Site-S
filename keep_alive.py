from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Program is online/active, all thanks to UpTimeRobot!"

if __name__ == "__main__":
    app.run()