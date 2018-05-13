<?php
//session başlatılır
session_start();

//sunucu bağlantısı ve veritabanı seçimi
require_once 'includes/connection.php';
                                             
//form fonksiyonları 
require_once 'includes/functions.php';

if(isset($_POST['uyeGirisSubmit']))
{

/*    echo "form gönderildi .<br>";
        echo "<pre>";
    print_r($_POST);
    echo "</pre>";    
    
exit();

  [KullaniciAdi] => rcegitim
    [Eposta] => iletisim@rcegitim.com
    [Parola] => 123456
    [uyeGirisSubmit] => Giriş Yap*/
    
    //formdan gelen değerle alınır
    $kullaniciAdi = postValues($_POST['KullaniciAdi']);
    $eposta = postValues($_POST['Eposta']);
    $parola = postValues($_POST['Parola']);
    $parola = md5($parola);
    
    
    //değerler veritabanında kontrol edilir
    $query_UyeVarmi = "SELECT * FROM uye WHERE
          KullaniciAdi = '$kullaniciAdi' AND
          Eposta = '$eposta' AND
          Parola =  '$parola'

        ";
    ///echo $query_UyeVarmi;
    //exit();
    $result = mysql_query($query_UyeVarmi);
    $row_rsUye = mysql_fetch_object($result);
    $row_UyeVarmi = mysql_num_rows($result);
    
    echo $row_UyeVarmi;
    
    if($row_UyeVarmi==0){
        
       // echo "üye yok geri dön <br>";
        header("Location:index.php?Hata=GirisBasarisiz");
        
    }elseif($row_UyeVarmi==1){
        
                
        //echo "üye var giriş yapılacak <br>";
        $_SESSION['Uye']['KullaniciAdi'] = $kullaniciAdi;
        $_SESSION['Uye']['Eposta'] = $eposta;
        $_SESSION['Uye']['UyeID'] = $row_rsUye->UyeID;
        $_SESSION['Uye']['SeviyeID'] = $row_rsUye->SeviyeID;
          
        $uyeID =  $_SESSION['Uye']['UyeID'];
        //giriş tablosuna değerleri girilecek
        $girisIP = $_SERVER['REMOTE_ADDR'];
        
      $query_UyeGiris = "INSERT INTO uye_giris (UyeID,GirisIP) VALUES ('$uyeID','$girisIP')"; 
      $sonuc = mysql_query($query_UyeGiris);
      
      if ($sonuc) {
    header("Location:yonetim/index.php");
}
        
    }
    
    
    
    //kontorl başarılı ise session'da KullaniciAdi, Eposta ve UyeID ve SeviyeID
    
    
    //session işlemlerinden sonra ise yönetim index sayfasına geçilir
    


}



?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <title>Arı Stok Yönetim Paneline Hoşgeldiniz</title>
      <link href="includes/css/style.css" rel="stylesheet" type="text/css"/>
    
</head>
<body>
<div id="girisResim" ><img src="includes/img/loginHeaderIcon.png" />
    
       <h1>Stok Yönetim Paneline Hoşgeldiniz</h1>

            <div id="girisBilgi">
        <?php  
        if(isset($_GET['Hata']))
{
            $hata= getValues($_GET['Hata']);
            
            if($hata=='GirisBasarisiz') {
                
                echo "<p><strong>Kullanıcı adınızı ,Eposta Adresinizi veya Parolanızı kontrol ediniz. </strong></p>";
                
            }    elseif ($hata=='GirisYap') {
                
                echo "<p><strong>Lütfen giriş yapınız.</strong></p>";
                
            }          

}//hata parametresi varmı kontrol ediliyor
        ?>
</div>
        <!-- girisBilgi div sonu-->
    
    </div>
    <!-- girisResim div sonu-->
 <form action="<?= $_SERVER['PHP_SELF'];?>" method="post">
    <fieldset>
        
        <legend>Giriş Bilgileri</legend>
        <label for="KullaniciAdi">Kullanıcı Adı</label>
        <input type="text" name="KullaniciAdi" id="KullanicAdi" required/>
        <label for="Eposta">Eposta</label>
        <input type="email" name="Eposta" id="Eposta" required/>
        <label for="Parola">Parola</label>
        <input type="password" name="Parola" id="Parola" required/>
        <br>
        <input type="submit" name="uyeGirisSubmit" value="Giriş Yap" />
        
        
    </fieldset>



</form>
</body>
</html>
