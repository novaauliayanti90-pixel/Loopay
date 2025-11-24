<?php
session_start();
require_once '../vendor/autoload.php';
include '../koneksi.php';

// Konfigurasi Google OAuth
$client = new Google_Client();
$client->setClientId('204254093757-abks2ar0nudootkvcb4hns8jp6hb9gvt.apps.googleusercontent.com');
$client->setClientSecret('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');
$client->setRedirectUri('http://localhost/loopay/auth/google_callback.php');
$client->addScope('email');
$client->addScope('profile');

// === CEK APA ADA "code" DARI GOOGLE ===
if (isset($_GET['code'])) {
    try {
        // Ambil access token
        $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);

        // 🔍 Tambahan debug jika token gagal diambil
        if (isset($token['error'])) {
            die('⚠️ Gagal mengambil token: ' . htmlspecialchars($token['error_description'] ?? $token['error']));
        }

        // Set token ke client
        $client->setAccessToken($token);

        // Ambil data pengguna dari Google
        $oauth2 = new Google_Service_Oauth2($client);
        $userinfo = $oauth2->userinfo->get();

        // Simpan data yang diperlukan
        $email = $userinfo->email;
        $nama = $userinfo->name;

        // === CEK APA SUDAH ADA DI DATABASE ===
        $stmt = $conn->prepare("SELECT id_pengguna FROM pengguna WHERE email_pengguna = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows == 0) {
            // Belum ada, buat akun baru
            $stmt = $conn->prepare("INSERT INTO pengguna (nama_pengguna, email_pengguna) VALUES (?, ?)");
            $stmt->bind_param("ss", $nama, $email);
            $stmt->execute();
        }

        // Simpan ke session dan arahkan ke halaman utama
        $_SESSION['email'] = $email;
        header("Location: ../tampilan/awal.html");
        exit;

    } catch (Exception $e) {
        // Jika ada error Guzzle / koneksi SSL / lainnya
        echo "<h3>❌ Terjadi kesalahan:</h3>";
        echo "<pre>" . htmlspecialchars($e->getMessage()) . "</pre>";
    }
} else {
    echo "⚠️ Login dengan Google gagal. Tidak ada kode otorisasi.";
}
?>
