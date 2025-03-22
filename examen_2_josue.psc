Proceso exmen2
		
		Definir intentos, opc, historial_movi Como Entero
		Definir usuario, contra Como Caracter
		Definir deposito, retiro Como Real
		Dimension datos[2]
		Dimension saldo[2]
		Dimension historial[100]
		historial_movi = 1
		saldo[1] = 100
		datos[0] = "Anakin"
		datos[1] = "anakinlovespadme123"
		opc = 0
		intentos = 0
		
		Repetir
			Escribir "Ingrese su usuario: "
			Leer usuario
			Escribir "Ingrese su contraseña: "
			Leer contra
			
			Si Minusculas(usuario) = Minusculas(datos[0]) y contra = datos[1] Entonces
				Mientras opc <> 4 Hacer
					Escribir "Bienvenido Señor(a) ", datos[0], " al sistema de banco"
					Escribir "Seleccione la opción deseada"
					Escribir "1- Depositar dinero a la cuenta"
					Escribir "2- Sacar dinero de la cuenta"
					Escribir "3- Ver saldo"
					Escribir "4- Salir"
					Leer opc
					
					Si opc < 1 o opc > 4 Entonces
						Escribir "Opción inválida, intente de nuevo"
					Sino
						Segun opc Hacer
							1: 
								Escribir "Ingrese el monto que desea depositar: "
								Leer deposito
								Si deposito < 0 Entonces
									Escribir "El monto debe ser mayor que 0"
								Sino
									Si deposito >= 3000 Entonces
										deposito = deposito - (deposito * 0.01)
									FinSi
									saldo[1] = saldo[1] + deposito
									historial[historial_movi] = deposito
									historial_movi = historial_movi + 1
									Escribir "Usted depositó: ", deposito, " colones"
									Escribir "Se realizó el depósito correctamente, su saldo actual es: ", saldo[1]
								FinSi
							2:
								Escribir "Ingrese el monto que desea retirar: "
								Leer retiro
								Si retiro < 0 Entonces
									Escribir "El monto debe ser mayor a 100 colones"
								Sino
									Si retiro > saldo[1] Entonces
										Escribir "Saldo insuficiente, no se puede realizar el retiro"
									Sino
										Si retiro MOD 1000 <> 0 Entonces
											Escribir "Solo se pueden retirar cantidades múltiplos de 1000 colones"
										Sino
											saldo[1] = saldo[1] - retiro
											historial[historial_movi] = retiro
											historial_movi = historial_movi + 1
											Escribir "Usted retiró: ", retiro, " colones"
											Escribir "Se realizó el retiro correctamente, su saldo actual es: ", saldo[1]
										FinSi
									FinSi
								FinSi
							3:
								Escribir "Su saldo actual es de: ", saldo[1], " colones"
								Escribir "El historial de transacciones es: "
								Para i = 1 Hasta historial_movi - 1 Hacer
									Escribir historial[i]
								FinPara
							4:
								Escribir "Saliendo, tenga buen día..."
						FinSegun
					FinSi
				FinMientras
			Sino
				intentos = intentos + 1
				Si intentos < 4 Entonces
					Escribir "El usuario o contraseña son incorrectos, número de intentos: ", intentos
				Sino
					Escribir "Número de intentos superado, acceso bloqueado"
				FinSi
			FinSi
		Hasta Que Minusculas(usuario) = Minusculas(datos[0]) y contra = datos[1] o intentos = 4
FinAlgoritmo


