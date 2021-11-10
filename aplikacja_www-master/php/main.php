//Wyświetla na stronie komunikat napisany przez twórcę czy informacje zostały dodane do bazy czy nie 
<?php
	error_reporting(~E_ALL);
	//Wybranie bazy, do której ma się odnieść
	$baza = mysqli_connect('localhost', 'root', '', 'aplikacje2p');
	$good=false;
	if (isset($_POST['name'])) {
		if (!empty($_POST['name'])) {
			//Dodaje do bazy dane, które użytkownik wpisał na stronie
			mysqli_query($baza,"INSERT INTO `kontakty` (`imie`,`nazwisko`,`plec`,`tresc`,`email`) 
			VALUES ('{$_POST['name']}','{$_POST['lastname']}','{$_POST['sex']}','{$_POST['content']}',  
			'{$_POST['email']}');") or die ("Błąd zapytania");
			echo '<p>Dodano informacje do bazy danych</p>';
			$good=true;
		}
	}
	if (!$good)
		echo '<p>Nastąpił nieoczekiwany błąd - dane nie zostały dodane do bazy.</p>';
	
	mysqli_close($baza);
	//echo 'Odpowiedź z PHP ' . $_POST['email'];