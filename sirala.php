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
            
                    //modül kayıt setinin oluşturulması
        $query_rsModul = "SELECT * FROM modul ORDER BY ModulSira , ModulEklemeTarih ASC";
        $rsModul = mysql_query($query_rsModul);
        $row_rsModul = mysql_fetch_object($rsModul);
        $num_row_rsModul = mysql_num_rows($rsModul);
            
       //modul id değeri alınır
            
            $modulID = getValues($_GET['ModulID']);
            $islem = getValues($_GET['Islem']);
            $modulSira = getValues($_GET['Sira']);
            echo "modül sayısı" .  $num_row_rsModul ."<br>";
            echo "modül sıra" .  $modulSira ."<br>";
                $dataTime = date("Y-m-d H:i:s",time());
           
                
                //listede düşürmek için  için sırano artırılır
            if($islem=='Artir'&& ($num_row_rsModul<=$modulSira)){
                
 
                //Artırma işlemi yapılacak
                $query_artir = "UPDATE modul SET ModulEklemeTarih= ' $dataTime'  WHERE ModulID='$modulID'";
                echo $query_artir;
                $sonuc = mysql_query($query_artir);
                if($sonuc){
                     header("Location:index.php");
                }
                
            }elseif($islem=='Artir') {
                
                              
                //Artırma işlemi yapılacak
                
                $query_artir = "UPDATE modul SET ModulSira =  ModulSira + 1 WHERE ModulID='$modulID'";
                $sonuc = mysql_query($query_artir);
                if($sonuc){
                       header("Location:index.php");
                }
                
                
            } 
            
            
            //listede yükletmek için azaltılır
            
            if ($islem=='Azalt'&&(1!=$modulSira)) {
                                $query_azalt = "UPDATE modul SET ModulSira =  ModulSira - 1 WHERE ModulID='$modulID'";
                $sonuc = mysql_query($query_azalt);
                if($sonuc){
                        header("Location:index.php");
                }
            }
            
            header("Location:index.php");
            
            //işlem türü belirlenir
            
       //eğer işlem artırma ise id değeri alınan modülün sıra numarası artırılır
            
            
            //eğer işlem azaltma ise id değeri alınan modülün sıra numarası bir azaltılır
            
            
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
