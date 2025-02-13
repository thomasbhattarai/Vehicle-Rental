<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VEHICLE Details</title>
    <link rel="stylesheet" href="css/vehiclesdetails.css">
</head>

<body class="body">


<?php 
    require_once('connection.php');
    session_start();

    $value = $_SESSION['email'];
    $_SESSION['email'] = $value;
    
    $sql="select * from users where EMAIL='$value'";
    $name = mysqli_query($con,$sql);
    $rows=mysqli_fetch_assoc($name);
    $sql2="select *from vehicles where AVAILABLE='Y'";
    $vehicles= mysqli_query($con,$sql2);
?>

<div class="cd">
    <div class="navbar">
        <div class="icon">
            <h2 class="logo">Velorent</h2>
        </div>
        <div class="menu">
            <ul>
            <li><p class="phello"><a id="pname"><?php echo $rows['FNAME']." ".$rows['LNAME']?></a></p></li>
                <li><a id="stat" href="bookinstatus.php">BOOKING STATUS</a></li>
                <li><button class="nn"><a href="index.php">LOGOUT</a></button></li>
            </ul>
        </div>
    </div>

    <h1 class="overview">OUR VEHICLE OVERVIEW</h1>
    <ul class="de">
    <?php
        while($result= mysqli_fetch_array($vehicles)) {
            $res = $result['VEHICLE_ID'];
    ?>    
    <li>
    <form method="POST">
        <div class="box">
            <div class="imgBx">
                <img src="images/<?php echo $result['VEHICLE_IMG']?>">
            </div>
            <div class="content">
                <h1><?php echo $result['VEHICLE_NAME']?></h1>
                <h2>Fuel Type : <a><?php echo $result['FUEL_TYPE']?></a> </h2>
                <h2>CAPACITY : <a><?php echo $result['CAPACITY']?></a> </h2>
                <h2>Rent Per Day : <a>Rs<?php echo $result['PRICE']?>/-</a></h2>
                <button type="submit" name="booknow" class="utton" style="margin-top: 5px;">
                    <a href="booking.php?id=<?php echo $res;?>">Book</a>
                </button>
            </div>
        </div>
    </form>
    </li>
    <?php
        }
    ?>
    </ul>
</div>

<footer>
    <p>&copy; 2024 VeloRent. All Rights Reserved.</p>
    <div class="socials">
        <a href="#"><ion-icon name="logo-facebook"></ion-icon></a>
        <a href="#"><ion-icon name="logo-twitter"></ion-icon></a>
        <a href="#"><ion-icon name="logo-instagram"></ion-icon></a>
    </div>
</footer>

<script src="https://unpkg.com/ionicons@5.4.0/dist/ionicons.js"></script>
</body>
</html>
