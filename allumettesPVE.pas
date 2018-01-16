PROGRAM jeu_de_nim_PVE;

USES crt;

{//Partie algorithme

//ALGORITHME allumettes_pve
//BUT : Jouer au jeu des allumettes, le joueur pendant son tour retire 1 a 3 allumettes sur une ligne de 21. Le joueur qui retire la derniere allumette perd.
//ENTREE : Nombre d'allumettes a retirer
//SORTIE : Gagnant annonce
//PRINCIPE : Boucle REPETER JUSQU'A qui demande au joueur de saisir un chiffre entre 1 et 3 pour le nombre d'allumettes qu'il souhaite retirer. On soustrait le nombre choisi a 21 et le perdant et celui qui fait tomber le compteur a 0.

CONSTANTE  							//Declaration des constantes

	FIN<-1 :ENTIER
	MIN<-1 :ENTIER
	MAX<-3 :ENTIER
	PAQUET<-21 :ENTIER

VARIABLE							//Declaration des variables

	nbr_allumettes,choix,test_victoire:ENTIER
	joueur1:CHAINE

DEBUT
	nbr_allumettes<-PAQUET				//On initialise les variables
	choix<-0
	test_victoire<-0
	ECRIRE "Bienvenue dans le jeu des allumettes."
	ECRIRE "L'un apres l'autre, les joueurs decident d'enlever 1 a 3 allumettes. Celui qui retire la derniere allumette perd."
	ECRIRE "Joueur 1, veuillez rentrer votre nom. Ne pas laisser ce champ vide."	//On vérifie la saisie du nom du joueur 1 										//*Le joueur 1 s'appelle Paul																			
	LIRE joueur1
	JUSQUA LONGUEUR(joueur1) <> 0 				//La longueur de la chaine doit être différente de 0
	REPETER 		
		ECRIRE "Il reste ",nbr allumettes," allumettes."		//Debut du tour du joueur, on l'informe du nombre d'allumettes restantes							//* Paul est informé du nombre d'allumettes
		REPETER
			ECRIRE "Tour du joueur 1, combien d'allumettes voulez vous retirer?"																					//*Il décide retirer 4 allumettes mais ce n'est pas possible
			LIRE choix 																																				//*Il doit donc choisir une autre valeur, entre 1 et 3
				SI ((choix >=1) ET (choix <=3)) ALORS 						//On test la saisie du nombre d'allumettes a enlever,									//*Il décide d'enlever 1 allumette
					nbr_allumettes<-nbr_allumettes-choix 					//qui doit etre entre 1 et 3. Si la valeur n'est pas valide,							//*Une fois la saisie validée, on soustrait sa valeur au nombre
					ECRIRE "Il reste ",nbr_allumettes," allumettes." 		//il doit de nouveau rentrer une valeur.												//*Total d'allumettes. Il reste 20 allumettes
				SINON 
					ECRIRE "Veuillez rentrer une valeur entre 1 et 3"
				FINSI
		TANT QUE ((choix<=1)ET(choix>=3))									//Sortie de la boucle a condition que le lancer soit validée 							//*Le lancé ayant était validé, on sort de la boucle

		SI nbr_allumettes > FIN ALORS										//Debut du tour de l'IA
			ECRIRE "Il reste ",nbr_allumettes," allumettes."				//On dit au joueur combien il reste d'allumettes avant le tour de l'IA   				//*C'est au tour de l'IA, on test le nombre d'allumettes
			SI nbr_allumettes<=4 ALORS 										//L'IA joue intelligement, si il reste moins de 4 allumettes et plus de 1				//*Si il reste plus de 4 allumettes, l'IA genere une valeur
				choix<-nbr_allumettes-FIN 									//Il va faire en sorte d'en laisser une seule, et donc de gagner						//*Aléatoire comprise entre 1 et 3, admettons 2
			SINON																																					//*On soustrait donc 2 a 20, il reste 18 allumettes.
				choix<-aleatoire 											//Si il reste plus de 4 allumettes, l'IA va generer une valeur aleatoire 				//*La saisie de l'IA n'a pas besoin d'etre vérifiée
				ECRIRE "L'ordinateur enleve ",choix," allumettes" 			//Entre 1 et 3 afin de pouvoir poursuivre la partie 
				nbr_allumettes<-nbr_alumettes-choix
				ECRIRE "Il reste ",nbr_allumettes," allumettes."	 		//On informe le joueur du nombre d'allumettes restantes apres le tour de l'IA 			//*Vers la fin de la partie, il reste 4 allumettes, le bot
			FINSI																																					//*Décide donc de retirer 3 allumettes. Il n'en reste qu'une
		SINON  																																						//Le nombre d'allumettes est égale a 1, la condition de sortie
			test_victoire<-1												//Si le nombre d'allumettes est a 1 avant le tour de l'IA								//*Est respectée, on sort de la boucle en ayant la valeur				
																			//ça veut dire que le joueur 1 gagne 													//*0 dans test_victoire.
		FINSI

	JUSQUA nbr_allumettes<=FIN  												//On test si le nombre d'allumettes restantes est 1 pour sortir de la Boucle      		//*Le gagnant de la partie est l'IA.
	SI test_victoire=1 ALORS
		ECRIRE joueur1 " a gagne ! Bravo!"
	SINON 
		ECRIRE "L'ordinateur a gagne! Essaye encore!"
	FINSI
FIN }

CONST							//Declaration des constantes

	FIN=1;
	MIN=1;
	MAX=3;
	PAQUET=21;

VAR							//Declaration des variables

	nbr_allumettes,choix,test_victoire:integer;
	joueur1:string;

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
		BEGIN
		writeln('Il reste ',nbr_allumettes,' allumettes.');
		writeln('Tout du joueur 1, combien d allumettes voulez vous retirer?');
		readln (choix);
		clrscr;
			IF ((choix >=MIN) AND (choix <=MAX)) THEN
				BEGIN
					nbr_allumettes:=nbr_allumettes-choix;
					writeln('Il reste ',nbr_allumettes,' allumettes');
					readln;
					clrscr;

					IF nbr_allumettes > FIN THEN
					BEGIN
						writeln('Il reste ',nbr_allumettes,' allumettes');
						IF nbr_allumettes<=4 THEN
							choix:=nbr_allumettes-FIN;
							writeln('L ordinateur enleve ',choix,' allumettes');
							writeln('Il reste ',nbr_allumettes,' allumettes');
							readln;
							clrscr;

					END
					ELSE
						choix:=random(3);
						writeln('L ordinateur enleve ',choix,' allumettes');
						nbr_allumettes:=nbr_allumettes-choix;
						writeln('Il reste ',nbr_allumettes,' allumettes');
						readln;
						clrscr;
					END
				ELSE
					test_victoire:=1
				END

	UNTIL nbr_allumettes<=FIN;
	IF test_victoire=1 THEN
		writeln (joueur1,' a gagne ! Bravo !')
	ELSE
		writeln ('L ordinateur a gagne ! Essaye encore !');
	readln;
END.