<?php include_once 'top.php'; ?>
  <h2>Lorum Ipsum</h2>
  <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
  <?php 
  $str = "Fj09
Fjr1300
Fx-1
Fz07
Fz09
Fz1
Fz10
Fz6
Fzx700
Mt07
Outboard Motor 150
Personal Watercraft
Vmx12
Waverunner
Wr250
Wr450
Xc125
Xc50
Xj700
Xsr900
Xt225
Xv1600
Xv1700
Xv1900
Xv250
Xvs1100
Xvs1300
Xvs65
Xvs650
Xvs950
Xvz13
Yamaha Jetski
Yfm550
Yfm700
Yfz450
Yj125
Yp400
Yw125
Yw50
Yxm700
Yxr450
Yxr660
Yxz1000
Yz250
Yzfr1
Yzfr1s
Yzfr3
Yzfr6";
  $array = explode(PHP_EOL, $str);
  print_r($array);
foreach ($array as $value) {
	$query  = "INSERT INTO model (name, make_id) VALUES ('{$value}', 496)";
      $result = mysqli_query($connection, $query);
}
  ?>
<?php include_once 'bottom.php'; ?>