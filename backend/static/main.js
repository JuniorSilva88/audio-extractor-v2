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
