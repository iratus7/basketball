<?php



$mail = $_POST['mail']; 

if(empty($mail)) {
		echo 'Το πεδίο του email είναι κενό.';
}

elseif (!is_email($mail) && !empty($mail)) {
		echo 'Παρακαλώ, συμπληρώστε σωστά το πεδίο του email.';
	}
	else 
	{

$to = "mai135@uom.edu.gr";  
$subject = "Εισαγωγή νέου mail";   
$message = "Παρακαλώ εισάγεται το mail μου στο newsletter ".$mail;
$from = $mail;
$headers = "From:" . $from;
mail($to,$subject,$message,$headers);
echo "Το Mail σας στάλθηκε και θα ενταχτεί στο newsletter του site μας...";
	}


function is_email($email) {
	if (!preg_match('/^[0-9A-Za-z][A-Za-z0-9_\-.]{0,50}@[A-Za-z0-9_\-]{1,50}\.[A-Za-z]{2,4}$/', $email)) {
		return false;
	}
	return true;
}


?>


