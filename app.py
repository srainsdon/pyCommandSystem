from flask import Flask
application = Flask(__name__)


@application.route("/")
def hello():
    return "Hello World!"


@application.route("/test/")
def testing():
    return "Test is good"


if __name__ == "__main__":
    application.run(host='0.0.0.0')