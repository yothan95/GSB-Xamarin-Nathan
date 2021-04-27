<?php
	include "cnx.php";
	$request_method = $_SERVER["REQUEST_METHOD"];
	
	function getLesSpecialites()
	{
		global $cnx;
		$reponse = array();
		$sql = $cnx->prepare("select * from specialite");
		$sql->execute();
		$lesSpecialites = $sql->fetchAll(PDO::FETCH_NUM);
		//var_dump($lesSpecialites);
		foreach($lesSpecialites as $row)
		{
			$uneSpecialite = [
				'spe_code' => $row[0],
				'spe_libelle' => $row[1],
			];
			$reponse[] = $uneSpecialite;
		}
		echo json_encode($reponse);
	}
	function getLaSpecialite($spe_code)
	{
		global $cnx;
		$sql = $cnx->prepare("select * from specialite where spe_code = ?");
		$sql->bindValue(1,$spe_code);
		$sql->execute();
		$row = $sql->fetch(PDO::FETCH_NUM);
		$laSpecialite = [
			'spe_code' => $row[0],
			'spe_libelle'=> $row[1],
		];
		echo json_encode($laSpecialite);
	}

	function AddSpecialite()
	{
		global $cnx;
		$json_str = file_get_contents('php://input');
		$spe_libelle = json_decode($json_str);
		$sql = $cnx->prepare("select max(spe_code) from specialite");
		$sql->execute();
		$row = $sql->fetch(PDO::FETCH_NUM);
		$sql = $cnx->prepare("insert into specialite values(?,?)");
		$sql->bindValue(1,intval($row[0]) + 1);
		$sql->bindValue(2,$spe_libelle->Spe);
		$sql->execute();
	}

	function UpdateSpecialite()
	{
		global $cnx;
		$json_str = file_get_contents('php://input');
		$laSpecialite = json_decode($json_str);
		$sql = $cnx->prepare("update specialite set spe_libelle = ? where spe_code = ?");
		$sql->bindValue(1,$laSpecialite->spe_libelle);
	 	$sql->bindValue(2,$laSpecialite->spe_code);
		$sql->execute();
	}
	switch($request_method)
	{
		case 'GET':
			if(!empty($_GET["spe_code"]))
			{
				getLaSpecialite($_GET["spe_code"]);
			}
			else
			{
				getLesSpecialites();
			}
			break;
		case 'POST':
			AddSpecialite();
			break;
		case 'PUT':
			UpdateSpecialite();
			break;
		default:
			header("HTTP/1.0 405 Method Not Allowed");
			break;
	}
?>