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
        $modulID = 17;
        $alan = 'Duzenle';
             if(!yetkiVarmi($_SESSION['Uye']['SeviyeID'],4,$uyeID,$modulID,$alan)){
            header("Location:../index.php?Hata=YetkisizGiris");      
            }
          
            
            //modül id değerinin alınması
            $modulID = getValues($_GET['ModulID']);
            
            //modül kayıt seti
            $query_rsModul = "SELECT ModulID, ModulResim FROM modul WHERE ModulID = '$modulID'";
            $rsModul = mysql_query($query_rsModul);
            $row_rsModul = mysql_fetch_object($rsModul);
            
             //query oluşturulması
            $query_ModulSil = "DELETE FROM modul WHERE ModulID= '$modulID' ";
            $sonuc = mysql_query($query_ModulSil);
            
            //eğer modül silindiyse
            if($sonuc){
            
            //modül resim silinmesi
                $filename = "../../uploads/modul/" . $row_rsModul->ModulResim;
                $resimSil = unlink($filename);
                
                if($resimSil){
                    
                    header("Location:index.php?Islem=ModulSil");
                    
                }
                
                
                }//eğer veri silindiyse if sonu
        
        
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
