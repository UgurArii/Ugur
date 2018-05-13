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
        $alan = 'Ekle';
             if(!yetkiVarmi($_SESSION['Uye']['SeviyeID'],4,$uyeID,$modulID,$alan)){
            header("Location:../index.php?Hata=YetkisizGiris");      
            }
        
        //seviye kayıt setinin oluşturulması
        
        $query_rsSeviye = "SELECT SeviyeID FROM uye_seviye";
        $rsSeviye = mysql_query($query_rsSeviye);
        $row_rsSeviye = mysql_fetch_object($rsSeviye);
        
        
        //form gönderildiğinde
        
        if(isset($_POST['modulEkleSubmit']))
{
            
            /*
            echo "form gönderildi <br>";
            
            echo "<pre>";
            
            print_r($_POST);
            print_r($_FILES);
            
            echo "</pre>";
            
            exit();
            

             *   [ModulAdi] => üye
    [ModulDizin] => uye
    [ModulSeviye] => 5
    [ModulSira] => 1
    [ModulAktif] => on
    [ModulResim] => Array
 
            [name] => 01-bakliyatlar.jpg
            [tmp_name] => /tmp/phpalFDXI

             */

            
            //formdan değerlerin alınması
            $modulAdi = postValues($_POST['ModulAdi']);
            $modulDizin = postValues($_POST['ModulDizin']);
            $modulSeviye = postValues($_POST['ModulSeviye']);
            $modulSira = postValues($_POST['ModulSira']);
            //ternary operator
            $modulAktif = isset($_POST['ModulAktif'])?1:0;
            
            //resim bilgisinin alınması
            $modulResim = postValues($_FILES['ModulResim']['name']);
            $modulTmpName = $_FILES['ModulResim']['tmp_name'];
            
            
            //query oluşturma
            $query_ModulEkle = "INSERT INTO modul
                (ModulAdi,ModulDizin,ModulResim,ModulSeviye,ModulSira,ModulAktif)
                VALUES
                ('$modulAdi','$modulDizin','$modulResim','$modulSeviye','$modulSira','$modulAktif')";
            
         $sonuc = mysql_query($query_ModulEkle);
         
         if ($sonuc) {
             
           /*  echo "Veritabanına başarıyla veri girildi, şimdi resim yükleme vakti";
             exit();*/
             
             $filename = $modulTmpName;
             $destination = "../../uploads/modul/" . $modulResim;
            $resimSonuc = move_uploaded_file($filename, $destination);
            
            if ($resimSonuc) {
                
                header("Location:index.php?Islem=ModulEkle");
                
    
}
             
             
    
}//veritabanına başarıyla veri girildi
}//form gönderildiğinde if cond. bitişi
        
        
              $uyeSeviyeID = $_SESSION['Uye']['SeviyeID'];
                    //modül kayıt seti
        $query_rsModul = "SELECT ModulAdi,ModulDizin,ModulResim FROM modul WHERE ModulAktif=1 AND ModulSeviye >= $uyeSeviyeID  AND ModulID!=1 AND ModulID!=17  AND ModulID IN (SELECT ModulID FROM modul_uye WHERE UyeID='$uyeID') ORDER BY ModulSira ASC";
     
       // echo $query_rsModul;
        $rsModul = mysql_query($query_rsModul);
        $row_rsModul = mysql_fetch_object($rsModul);
        $num_row_rsModul = mysql_num_rows($rsModul);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modül Ekle</title>
            <link href="../../includes/css/form.css" type="text/css" rel="stylesheet" />
                    <link href="../../includes/css/yonetim.css"  type="text/css" rel="stylesheet" />

    </head>
    <body>
                 <div id="yonetimToolbar">
        <ul>
            <li><a hreF="../index.php"><img src="../../includes/img/anasayfa.png" />Anasayfa</a></li>
            <?php do { ?>
            <li><a href="../<?= $row_rsModul->ModulDizin;?>"><img src="../../uploads/modul/<?=$row_rsModul->ModulResim;?>"  width="24"/><?= $row_rsModul->ModulAdi;?></a></li>
            <?php } while($row_rsModul= mysql_fetch_object($rsModul)); ?>
                <li><a hreF="../../index.php"><img src="../../includes/img/logout.png" />Çıkış</a></li>

        </ul>
    </div>
        <?php
        // put your code here
        ?>
        <h1>Modül Ekle</h1>
        <form action="<?= $_SERVER['PHP_SELF'];?>" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>Modül Bilgi</legend>
                <label for="ModulAdi">Modül Adı</label>
                <input type="text" name="ModulAdi" id="ModulAdi" required />
                
                <label for="ModulDizin">Modülün Dizini</label>
                <input type="text" name="ModulDizin" id="ModulDizin" required/>
                
                <label for="ModulResim">Modül Resim</label>
                <input type="file" name="ModulResim" id="ModulResim" />
                
            </fieldset>
            
            <fieldset>
                <legend>Modül Seviye ,Sıra ve Aktiflik</legend>
                <label for="ModulSeviye"> Modül Seviye</label>
                <select id="ModulSeviye" name="ModulSeviye">
                    <?php do{  ?>
                    <option value="<?= $row_rsSeviye->SeviyeID;?>" <?php if($row_rsSeviye->SeviyeID==5)echo " selected";?>><?= $row_rsSeviye->SeviyeID;?></option>
                    <?php  } while( $row_rsSeviye = mysql_fetch_object($rsSeviye)) ;?> 
                </select>
                <label for="ModulSira">Modül Sıra</label>
                <input type="text" name="ModulSira" id="ModulSira"  required/>
                
                <label for="ModulAktif">Aktif</label>
                <input type="checkbox" name="ModulAktif" id="ModulAktif" />
                <br>
                <input type="submit" name="modulEkleSubmit" value="Modül Ekle"/>
                
                
            </fieldset>
        
        
        </form>
        
    </body>
</html>
