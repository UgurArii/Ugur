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
        
                        $uyeSeviyeID = $_SESSION['Uye']['SeviyeID'];
                       $uyeBarID =  $_SESSION['Uye']['UyeID'];
                    //modül kayıt seti
        $query_rsModulBar = "SELECT ModulAdi,ModulDizin,ModulResim FROM modul WHERE ModulAktif=1 AND ModulSeviye >= $uyeSeviyeID  AND ModulID!=1 AND ModulID!=17  AND ModulID IN (SELECT ModulID FROM modul_uye WHERE UyeID='$uyeBarID') ORDER BY ModulSira ASC";
     
       // echo $query_rsModul;
        $rsModulBar = mysql_query($query_rsModulBar);
        $row_rsModulBar = mysql_fetch_object($rsModulBar);
        $num_row_rsModulBar = mysql_num_rows($rsModulBar);
        $num_row_rsModul = mysql_num_rows($rsModul);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stok Yönetimi Modülleri</title>
        
        <script src="../../includes/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
$(function(){
    
    //css özellikleri even, çift, veya odd tek olan satırlara uygulanacak
    $("#ModulListe  tr.listeVeri:even").addClass("evenTR");
    $("#ModulListe  tr.listeVeri:odd").addClass("oddTR");
    //satırın üzerine gelince highlight effecti uygulanacak
    
    $("#ModulListe tr.listeVeri").hover(
            function(){
                $(this).toggleClass("highlightTR");
                
                
            },
            function(){               
                
                 $(this).toggleClass("highlightTR");
                
            }


);
    
    
    
});    

    
</script>
    <style>
        .evenTR {
            background-color: #edf4f6;
            
        }
        .oddTR{
            background-color: #ccf0f9;
                
            
            
        }
        .highlightTR{
            
            background-color: #f1fde3;
            cursor: pointer;
            
        }
        #ModulListe tr th {
            
            background-color: #f00;
            color: #fff;
            padding:5px;
            text-align: left;
            
        }
                
    </style>
    
                <link href="../../includes/css/yonetim.css"  type="text/css" rel="stylesheet" />

    </head>
    <body>         <div id="yonetimToolbar">
        <ul>
            <li><a hreF="../index.php"><img src="../../includes/img/anasayfa.png" />Anasayfa</a></li>
            <?php do { ?>
            <li><a href="../<?= $row_rsModulBar->ModulDizin;?>"><img src="../../uploads/modul/<?=$row_rsModulBar->ModulResim;?>"  width="24"/><?= $row_rsModulBar->ModulAdi;?></a></li>
            <?php } while($row_rsModulBar= mysql_fetch_object($rsModulBar)); ?>
                <li><a hreF="../../index.php"><img src="../../includes/img/logout.png" />Çıkış</a></li>

        </ul>
    </div>
        <h1>Stok Yönetimi Modülleri</h1>
        <?php
        if(isset($_GET['Islem']))
{
            $islem = getValues($_GET['Islem']);
            
            if ($islem=='ModulEkle')                 
                echo "<p><strong>Modül Başarıyla eklendi</strong></p>"; 
    
            if ($islem=='ModulSil')                 
                echo "<p><strong>Modül Başarıyla Silindi</strong></p>"; 
            
            
        
            echo "<p>Modül Sayısı $num_row_rsModul </p>";

}
        ?>
        
        <h1>Modüller</h1>
        
        <?php if($num_row_rsModul!=0) :?>
        
        <a href="ekle.php">Modül Ekle</a>
        <table id="ModulListe">
            <tr>
                <th>Modül Adı</th>    
                <th> Dizin</th>    
                <th> Resim</th>    
                <th> Seviye</th>    
                <th> Sıra</th>    
                <th> Aktif</th>    
              <!--  <th> Ekleme Tarih</th>    -->
                <th>Düzenle</th>    
                
            </tr>
            <?php do { ?>
            <tr class="listeVeri">
                <td><?= $row_rsModul->ModulAdi;?></td>
                <td><?= $row_rsModul->ModulDizin;?></td>
                <td><img src="../../uploads/modul/<?= $row_rsModul->ModulResim;?>" width="50"/></td>
                <td><?= $row_rsModul->ModulSeviye;?></td>
                <td>
                
       
                    <a href="sirala.php?ModulID=<?= $row_rsModul->ModulID;?>&Islem=Artir&Sira=<?=$row_rsModul->ModulSira;?>">    <img src="../../includes/img/azalt_k.png"/></a>
                    
                    <?= $row_rsModul->ModulSira;?>
                    
                     <a href="sirala.php?ModulID=<?= $row_rsModul->ModulID;?>&Islem=Azalt&Sira=<?=$row_rsModul->ModulSira;?>">    <img src="../../includes/img/artir_k.png"/></a>
           
                </td>
                <td><?php  if( $row_rsModul->ModulAktif==1)  { echo "<a href='aktiflestir.php?ModulID=$row_rsModul->ModulID&Aktif=$row_rsModul->ModulAktif'><img src='../../includes/img/_aktif.png' /></a>"; } else { echo "<a href='aktiflestir.php?ModulID=$row_rsModul->ModulID&Aktif=$row_rsModul->ModulAktif'><img src='../../includes/img/_pasif.png' /></a>"; }?></td>
                <!--<td><?//  date("d/m/Y H:i:s", strtotime($row_rsModul->ModulEklemeTarih));?></td>-->
                <td>
                    
                    <a href="duzenle.php?ModulID=<?= $row_rsModul->ModulID;?>" >Düzenle </a>
                    
                    | 
                    
                    <a href="sil.php?ModulID=<?= $row_rsModul->ModulID;?>" >Sil </a>
                    </td>
                
            <?php } while($row_rsModul=mysql_fetch_object($rsModul)); ?>    
            </tr>
            
        </table>
        <?php else:?>
        
        <p>Henüz yüklenmiş bir modül yok</p><p><a href="ekle.php"> Modül eklemek için tıklayınız</a></p>
        
        <?php endif;?>
        
    </body>
</html>
