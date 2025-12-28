from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Audio Extractor v2 rodando!"

if __name__ == "__main__":
    app.run(debug=True)
