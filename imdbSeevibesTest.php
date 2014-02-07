<?php
	//Retrait du premier argument car c'est le nom du script
	array_shift($argv);

	//concaténation des arguments ( si le titre contient des espaces)
	$titre = implode('+',$argv);

	//Envoit de la requete et retour du JSON
	$json = file_get_contents('http://www.omdbapi.com/?s=' . $titre);

	//Traitement du JSON en array
	$arrayData = json_decode($json);

	//Si un erreur trouvé on retourne le message d'erreur
	if(isset($arrayData->Error)){
		echo $arrayData->Error . "\n";
		return;
	} 
	//Sinon on affichage des données
	else{
		echo 'Title: ' . $arrayData->Search[0]->Title . "\n";
		echo 'Year: ' . $arrayData->Search[0]->Year . "\n";
	}
	
?>