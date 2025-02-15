<?php

$url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyC5o1bg9bACrpah5wLMFfxhePu5uHGfvSk";
$headers = [
    "Content-Type: application/json"
];
$body = json_encode([
    "contents" => [[
        "parts" => [[
            "text" => "Buat kalimat random-serandomnya dalam bahasa inggris apa saja yang tidak toxic dan pastikan maksimal adalah 50 karakter. Langsung jawab dan tanpa pakai penjelasan apapun seperti \"berikut ini blabla\", jadi langsung jawab saja. Beri aku 15 hasil berupa json dan tanpa harus memakai formatting ``` segala atau tanda newline segala."
        ]]
    ]]
]);

$options = [
    "http" => [
        "header" => implode("\r\n", $headers),
        "method" => "POST",
        "content" => $body
    ]
];
$context = stream_context_create($options);
$response = file_get_contents($url, false, $context);

if ($response !== FALSE) {
    $response_data = json_decode($response, true);
    $sentences = json_decode($response_data['candidates'][0]['content']['parts'][0]['text'], true);

    echo '<textarea>';
    foreach ($sentences as $i => $sentence) {
        echo 'spam:setText(' . $i . ', "' . $sentence['sentence'] . '")' . "\n";
    }
    echo '</textarea>';
} else {
    echo "HTTP request failed.";
}
?>
