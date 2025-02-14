<?php 
session_start();
require_once('connection.php');

// Check if user is logged in
if (!isset($_SESSION['email'])) {
    header("Location: login.php");
    exit();
}

$vehicleid = $_GET['id'];

// Fetch vehicle details
$sql = "SELECT * FROM vehicles WHERE VEHICLE_ID='$vehicleid'";
$cname = mysqli_query($con, $sql);
$vehicle = mysqli_fetch_assoc($cname);

// Fetch user details
$value = $_SESSION['email'];
$sql = "SELECT * FROM users WHERE EMAIL='$value'";
$name = mysqli_query($con, $sql);
$user = mysqli_fetch_assoc($name);
$uemail = $user['EMAIL'];
$vehicleprice = $vehicle['PRICE'];

if(isset($_POST['book'])){
    $bplace = mysqli_real_escape_string($con, $_POST['place']);
    $bdate = date('Y-m-d', strtotime($_POST['date']));
    $dur = mysqli_real_escape_string($con, $_POST['dur']);
    $phno = mysqli_real_escape_string($con, $_POST['ph']);
    $des = mysqli_real_escape_string($con, $_POST['des']);
    $rdate = date('Y-m-d', strtotime($_POST['rdate']));
    
    if(empty($bplace) || empty($bdate) || empty($dur) || empty($phno) || empty($des) || empty($rdate)){
        echo '<script>alert("Please fill all fields")</script>';
    }
    else{
        if($bdate < $rdate){
            $price = ($dur * $vehicleprice);
            $sql = "INSERT INTO booking (VEHICLE_ID, EMAIL, BOOK_PLACE, BOOK_DATE, DURATION, PHONE_NUMBER, DESTINATION, PRICE, RETURN_DATE) VALUES ($vehicleid, '$uemail', '$bplace', '$bdate', $dur, $phno, '$des', $price, '$rdate')";
            $result = mysqli_query($con, $sql);
            
            if($result){
                $_SESSION['booking_id'] = mysqli_insert_id($con); // Store booking ID for payment
                header("Location: payment.php");
                exit();
            }
            else{
                echo '<script>alert("Please check the connection")</script>';
            }
        }
        else{
            echo '<script>alert("Please enter a correct return date")</script>';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VEHICLE BOOKING - VeloRent</title>
    <link rel="stylesheet" href="css/booking.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>

<button class="cancel-btn" onclick="window.location.href='vehiclesdetails.php'">CANCEL</button>

<div class="content-box">
    <div class="register">
        <h2>BOOKING</h2>
        <form id="register" method="POST">
            <h2>VEHICLE NAME: <?php echo $vehicle['VEHICLE_NAME']?></h2>
            <label for="place">BOOKING PLACE:</label>
            <input type="text" name="place" id="place" placeholder="Enter Your Destination" required>
            
            <label for="date">BOOKING DATE:</label>
            <input type="date" name="date" id="datefield" required onchange="calculateDuration()">
            
            <label for="rdate">RETURN DATE:</label>
            <input type="date" name="rdate" id="dfield" required onchange="calculateDuration()">
            
            <label for="dur">DURATION (days):</label>
            <input type="number" name="dur" id="dur" readonly>
            
            <label for="ph">PHONE NUMBER:</label>
            <input type="tel" name="ph" id="ph" maxlength="10" placeholder="Enter Your Phone Number" required>
            
            <label for="des">DESTINATION:</label>
            <input type="text" name="des" id="des" placeholder="Enter Your Destination" required>
            
            <input type="submit" class="btnn" value="BOOK" name="book">
        </form>
    </div>
</div>

<script>
    function calculateDuration() {
        var bookingDate = new Date(document.getElementById('datefield').value);
        var returnDate = new Date(document.getElementById('dfield').value);
        
        if (bookingDate && returnDate && bookingDate < returnDate) {
            var differenceInTime = returnDate.getTime() - bookingDate.getTime();
            var differenceInDays = Math.ceil(differenceInTime / (1000 * 3600 * 24));
            
            document.getElementById('dur').value = differenceInDays;
        } else {
            document.getElementById('dur').value = '';
            alert("Please ensure the return date is after the booking date.");
        }
    }

    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; 
    var yyyy = today.getFullYear();
    if (dd < 10) {
         dd = '0' + dd
    }
    if (mm < 10) {
          mm = '0' + mm
    }

    today = yyyy + '-' + mm + '-' + dd;
    document.getElementById("datefield").setAttribute("min", today);
    document.getElementById("dfield").setAttribute("min", today);
</script>

</body>
</html>