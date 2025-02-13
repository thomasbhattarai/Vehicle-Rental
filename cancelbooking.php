<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CANCEL BOOKING</title>
    <style>
        body {
            font-family: 'Inter', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form {
            background: rgba(255, 255, 255, 0.05);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 20px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
            text-align: center;
        }

        h1 {
            color: #6c5ce7;
            font-size: 24px;
            margin-bottom: 30px;
        }

        .hai {
            background: linear-gradient(90deg, #e74c3c, #e74c3c);
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.3s ease;
            text-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
        }

        .hai:hover {
            background: linear-gradient(90deg, #c0392b, #c0392b);
            transform: translateY(-2px);
        }

        .no {
            background: linear-gradient(90deg, #6c5ce7, #a29bfe);
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.3s ease;
            text-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
        }

        .no:hover {
            background: linear-gradient(90deg, #5a4ed1, #8e83ff);
            transform: translateY(-2px);
        }

        .no a {
            color: white;
            text-decoration: none;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
</head>
<body>
<?php
    
    require_once('connection.php');
    session_start();
    $bid = $_SESSION['bid'];
    if(isset($_POST['cancelnow'])){
        $del = mysqli_query($con,"DELETE FROM booking WHERE BOOK_ID = '$bid' ORDER BY BOOK_ID DESC LIMIT 1");
        if($del){
            echo "<script>window.location.href='vehiclesdetails.php';</script>";
        } else {
            echo "<script>alert('Failed to cancel booking. Please try again.');</script>";
        }
    }

?>

 <form class="form" method="POST">
        <h1>ARE YOU SURE YOU WANT TO CANCEL YOUR BOOKING?</h1>
        <input type="submit" class="hai" value="CANCEL NOW" name="cancelnow">
        <button class="no"><a href="payment.php">GO TO PAYMENT</a></button>
    </form>
</body>
</html>