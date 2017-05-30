<?php

class notas
{
	public $codalu;
	public $codcur;
	public $nombre;
	public $apellido;
	public $dni;
	public $nota1;
	public $nota2;
	public $nota3;
	public $media;
	
	public function __construct()
	{
		
	}
	
	public function GuardarNota($CODALU, $CODCUR, $NOMBRE, $APELLIDO, $DNI, $NOTA1, $NOTA2, $NOTA3, $MEDIA)
	{
		$this->codalu = $CODALU;
		$this->codcur = $CODCUR;
		$this->nombre = $NOMBRE;
		$this->apellido = $APELLIDO;
		$this->dni = $DNI;
		$this->nota1 = $NOTA1;
		$this->nota2 = $NOTA2;
		$this->nota3 = $NOTA3;
		$this->media = $MEDIA;
		
		$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
		$mysqli->set_charset ( "utf8" );
		$mysqli->query ( "INSERT INTO `notas`(`cod_cur`, `cod_alu`, `nota1`, `nota2`, `nota3`, `media`) VALUES ($this->codcur,$this->codalu,$this->nota1,$this->nota2,$this->nota3,$this->media)" );
	}
	
	public function GetAlumnos()
	{
		$alumnosLIST=array();
		
		$mysqli = new mysqli ( "localhost", "root", "", "ocupacional" );
		$mysqli->set_charset ( "utf8" );
		$result = $mysqli->query ( "select * from notas" );
		$rowCount = $result->num_rows;
		
		$i = 0;
		while ($i < $rowCount)
		{
			
			$mysqli->query ( "select alumnos.cod_alu, alumnos.cod_cur,alumnos.APELLIDOS,alumnos.NOMBRE, alumnos.DNI, nota1, nota2, nota3,media from notas inner join alumnos on notas.cod_alu = alumnos.COD_ALU limit $i,1" );
			$row = $result->fetch_row();
			
			$alu = new notas();
			$alu->codalu = $row[0];
			$alu->codcur= $row[1];
			$alu->nombre= $row[2];
			$alu->apellido= $row[3];
			$alu->dni= $row[4];
			$alu->nota1= $row[5];
			$alu->nota2= $row[6];
			$alu->nota3= $row[7];
			$alu->media= $row[8];
			
			array_push($alumnosLIST,$alu);
		}
	}
}