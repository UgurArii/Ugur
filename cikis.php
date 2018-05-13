<?php
session_start();
//sunucu bağlantısı ve veritabanı seçimi
require_once 'includes/connection.php';

//form fonksiyonları 
require_once 'includes/functions.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
    <?php
    
   echo "<pre>";
   
   print_r($_SESSION);
   
   echo "</pre>";
   
   /*
    *  [Uye] => Array
        (
            [KullaniciAdi] => rcegitim
            [Eposta] => iletisim@rcegitim.com
            [UyeID] => 1
            [SeviyeID] => 1
        )
    * 
    */
   
   unset($_SESSION['Uye']['KullaniciAdi']); 
   unset($_SESSION['Uye']['Eposta']);
   unset($_SESSION['Uye']['UyeID']);
   unset($_SESSION['Uye']['SeviyeID']);
   
header("Location:index.php?Islem=CikisYapildi");
    ?>
</body>
</html>
