#!/bin/bash

# Criar pastas principais
mkdir -p backend/static
mkdir -p data/outputs

# Backend - app.py com Flask básico
cat > backend/app.py << 'EOF'
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Audio Extractor v2 rodando!"

if __name__ == "__main__":
    app.run(debug=True)
EOF

# Configurações
cat > backend/config.py << 'EOF'
# Configurações básicas do projeto
OUTPUT_DIR = "data/outputs"
EOF

# Requirements
cat > backend/requirements.txt << 'EOF'
flask
yt-dlp
pydub
EOF

# README do backend
cat > backend/README.md << 'EOF'
# Backend - Audio Extractor v2

Este backend usa Flask + yt-dlp + pydub para extrair áudio de vídeos.
EOF

# Frontend - HTML básico
cat > backend/static/index.html << 'EOF'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Audio Extractor v2</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Audio Extractor v2</h1>
    <form id="extractForm">
        <input type="text" name="url" placeholder="Cole o link do vídeo" required>
        <button type="submit">Extrair Áudio</button>
    </form>
    <script src="main.js"></script>
</body>
</html>
EOF

# CSS básico
cat > backend/static/style.css << 'EOF'
body {
    font-family: Arial, sans-serif;
    margin: 40px;
    background: #f4f4f4;
}
h1 {
    color: #333;
}
EOF

# JS básico
cat > backend/static/main.js << 'EOF'
document.getElementById("extractForm").addEventListener("submit", async (e) => {
    e.preventDefault();
    const url = e.target.url.value;
    const formData = new FormData();
    formData.append("url", url);

    const response = await fetch("/extract", {
        method: "POST",
        body: formData
    });

    if (response.ok) {
        const blob = await response.blob();
        const link = document.createElement("a");
        link.href = URL.createObjectURL(blob);
        link.download = "audio.mp3";
        link.click();
    } else {
        alert("Erro ao extrair áudio");
    }
});
EOF

# Criar LICENSE vazio
touch LICENSE

# Mensagem final
echo "Estrutura inicial do projeto criada com sucesso!"
#!/bin/bash

# Criar pastas principais
mkdir -p backend/static
mkdir -p backend/__pycache__
mkdir -p data/outputs

# Criar arquivos vazios
touch backend/app.py
touch backend/config.py
touch backend/task.py
touch backend/task_queue.py
touch backend/requirements.txt
touch backend/README.md

touch backend/static/index.html
touch backend/static/style.css
touch backend/static/main.js

touch LICENSE

# Mensagem final
echo "Estrutura inicial do projeto criada com sucesso!"
