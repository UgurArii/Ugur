<?php
//session başlatılır
session_start();

//sunucu bağlantısı ve veritabanı seçimi
require_once '../../includes/connection.php';

//form fonksiyonları 
require_once '../../includes/functions.php';

     //giriş yapılmışmı kontrol ediliyor
     if(!GirisVarmi()){
            header("Location:../index.php?Hata=GirisYap");
        }
        
           //giriş yapılmış ise
      $uyeID = $_SESSION['Uye']['UyeID'];
        $modulID = 11;
        $alan = 'Duzenle';
             if(!yetkiVarmi($_SESSION['Uye']['SeviyeID'],4,$uyeID,$modulID,$alan)){
            header("Location:../index.php?Hata=YetkisizGiris");      
            }
            
            //modül id değeir alınır
            $modulID = getValues($_GET['ModulID']);
            
            $aktiflik = getValues($_GET['Aktif']);
            $aktif = $aktiflik?0:1;
            
            $query_ModulAktiflestir = "UPDATE modul SET ModulAktif ='$aktif' WHERE ModulID='$modulID'";
            $sonuc = mysql_query($query_ModulAktiflestir);
            
            if($sonuc){
                
                header("Location:index.php?Islem=Aktiflestirme");
                
            }
            
            
            
            
            
            
            
                    

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        ?>
    </body>
</html>
