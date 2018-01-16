PROGRAM jeu_de_nim_2j;

USES crt;

{//Partie algorithme

//ALGORITHME allumettes_2joueurs
//BUT : Jouer au jeu des allumettes, chaque joueur pendant son tour retire 1 a 3 allumettes sur une ligne de 21. Le joueur qui retire la derniere allumette perd.
//ENTREE : Nombre d'allumettes a retirer
//SORTIE : Gagnant annonce
//PRINCIPE : Boucle REPETER JUSQU'A qui demande a chaque joueur l'un apres l'autre de saisir un chiffre entre 1 et 3 pour le nombre d'allumettes 
//qu il souhaite retirer. On soustrait le nombre choisi a 21 et le perdant et celui qui fait tomber le compteur a 0.

CONSTANTE								//Declaration des constantes

	FIN<-1 :ENTIER
	MIN<-1 :ENTIER
	MAX<-3 :ENTIER
	PAQUET<-21 :ENTIER

VARIABLE								//Declaration des variables

	nbr_allumettes,choix,test_victoire:ENTIER
	joueur1,joueur2:CHAINE

DEBUT	
	nbr_allumettes<-PAQUET					//On initialise les variables
	choix<-0			
	test_victoire<-0
	ECRIRE "Bienvenue dans le jeu des allumettes."
	ECRIRE "L'un apres l'autre, les joueurs decident d'enlever 1 a 3 allumettes. Celui qui retire la derniere allumette perd."     //Courte explication des règles de base
	REPETER			
		ECRIRE "Joueur 1, veuillez rentrer votre nom. Ne pas laisser ce champ vide."	//On vérifie la saisie du nom du joueur 1 					//*Le joueur 1 rentre Jean																					
		L joueur1
	JUSQUA LONGUEUR(joueur1) <> 0 	//La longueur de la chaine doit être différente de 0
	REPETER
		ECRIRE "Joueur 2, veuillez rentrer votre nom. Ne pas laisser ce champ vide"		//On vérifie la saisie du nom du joueur 2					//*Le joueur 2 rentre Marco
		Lire joueur2
	JUSQUA LONGUEur(joueur2) <> 0
	REPETER 
		ECRIRE "Il reste ",nbr allumettes," allumettes."						//On informe le joueur du nombre d'allumettes restantes				//* Début du jeu, il y'a 21 allumettes.
		ECRIRE "Tour du joueur 1, combien d'allumettes voulez vous retirer?"    																	//* Jean décide de retirer 3 allumettes
		LIRE choix
			SI ((choix >=MIN) ET (choix <=MAX)) ALORS 			//On test la saisie du nombre d'allumettes a enlever,								//* 3 rentre dans la condition, on soustrait donc
				nbr_allumettes<-nbr_allumettes-choix            //qui doit etre entre 1 et 3. Si la valeur n'est pas valide,						//* 3 a 21, il reste 18 allumettes
 				ECRIRE "Il reste ",nbr_allumettes," allumettes." //il doit de nouveau rentrer une valeur.
				SI nbr_allumettes > FIN ALORS 																										//* Le nombre d'allumettes restantes est différent de 1
					REPETER		
						ECRIRE "Tour du joueur 2, combien d'allumettes voulez vous retirer?" 														//* C'est au tour de Marco, il retire 5 allumettes    
						LIRE choix
						SI ((choix >=MIN) ET (choix <=MAX)) ALORS 																					//* La valeur n'est pas acceptée, il doit resaisir une valeur entre 1 et 3
							nbr_allumettes<-nbr_allumettes-choix
							ECRIRE "Il reste ",nbr_allumettes," allumettes."																		//* Marco rentre 2, on soustrait 2 a 18, il reste 16 allumettes.
						SINON
							ECRIRE "Veuillez rentrer une valeur entre 1 et 3"
							
					TANT QUE ((choix <MIN) ET (choix>MAX))		//Condition de sortie de la boucle, le lancer doit etre valide						//* La valeur de Marco étant valide, on sort de la boucle, c'est a Jean
				SINON
					test_victoire<-1					//Si le nombre d'allumettes est a 1 avant le tour du joueur 2 								//* Le nombre d'allumettes étant supérieur a 1, on continu le jeu
											//ça veut dire que le joueur 2 perd
			SINON 
				ECRIRE "Veuillez rentrer une valeur entre 1 et 3"																					//* La partie se déroule correctement, Marco arrive a 4 allumettes
																																					//* Il décide d'en retirer 3.
			FINSI

	JUSQUA nbr_allumettes<=FIN //On test si le nombre d'allumettes restantes est 1 pour sortir de la boucle  										//* Jean perd donc, on sort de la boucle et on affecte 0 a test.
	SI test_victoire=1 ALORS
		ECRIRE joueur1 " a gagne ! Bravo!"
	SINON 																																			//* Fin de la partie, Marco a gagné.
		ECRIRE joueur2 " a gagne! Bravo!"
	FINSI
FIN }
	
CONST 						//Declaration des constantes
	
	FIN=1;
	MIN=1;
	MAX=3;
	PAQUET=21;

VAR								//Declaration des variables

	nbr_allumettes,choix,test_victoire:integer;
	joueur1,joueur2:string;

BEGIN
	clrscr;
	nbr_allumettes:=PAQUET;					//On initialise les variables
	choix:=0;
	test_victoire:=0;
	writeln('Bienvenue dans le jeu des allumettes');
	writeln('L un apres l autre, les joueurs decident d enlever 1 a 3 allumettes. Celui qui retire la derniere allumette perd.');     //Courte explication des règles de bases
	REPEAT
		writeln('Joueur 1, veuillez rentrer votre nom');
		readln (joueur1);
	UNTIL Length(joueur1) <> 0;
	REPEAT
		writeln('Joueur 2, veuillez rentrer votre nom');
		readln (joueur2);
	UNTIL Length(joueur2) <> 0;
	REPEAT
			BEGIN
			writeln('Il reste ',nbr_allumettes,' allumettes.');
			writeln('Tout du joueur 1, combien d allumettes voulez vous retirer?');
			readln (choix);
				IF ((choix >=MIN) AND (choix <=MAX)) THEN
					BEGIN
						nbr_allumettes:=nbr_allumettes-choix;
						writeln('Il reste ',nbr_allumettes,' allumettes');

						IF nbr_allumettes > FIN THEN
							BEGIN
								REPEAT
									BEGIN
										writeln('Tour du joueur 2, combien d allumettes voulez vous retirer?');
										readln (choix);
										IF ((choix >=MIN) AND (choix <=MAX)) THEN
										BEGIN
											nbr_allumettes:=nbr_allumettes-choix;
											writeln('Il reste ',nbr_allumettes,' allumettes')
										END
										ELSE
											writeln('Veuillez rentrer une valeur entre 1 et 3')
									END
								UNTIL (choix >=MIN) AND (choix <=MAX);
							END
						ELSE
							test_victoire:=0;
					END
				ELSE
					writeln('Veuillez rentrer une valeur entre 1 et 3')
		END
	UNTIL nbr_allumettes<=FIN;
	IF test_victoire=1 THEN
		writeln (joueur1,' a gagne ! Bravo !')
	ELSE
		writeln (joueur2,' a gagne ! Bravo !');
	readln;
END.