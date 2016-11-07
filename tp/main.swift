//
//  main.swift
//  tp
//
//  Created by Maxime Britto on 29/09/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation

//Déclarez vos fonctions en dessous de cette ligne
func exercice1() {
    print("Entrez votre prénom :")
    let valeurSaisie = readText()
    print("Bonjour \(valeurSaisie) !")
}

func exercice2() {
    print("Calcule de la moyenne de trois notes.")
    print("Entrez la note 1 :")
    let valeurNote1 = readInt()
    print("Entrez la note 2 :")
    let valeurNote2 = readInt()
    print("Entrez la note 3 :")
    let valeurNote3 = readInt()
    let moyenne:Double = Double(valeurNote1 + valeurNote2 + valeurNote3) / 3
    print("Moyenne = \(moyenne)")
    
}

func exercice3() {
    print("Calcule de l'air d'un triangle.")
    print("Entrez la base du triangle =")
    let base = readDouble()
    print("Entrez la hauteur du triangle =")
    let hauteur = readDouble()
    let air:Double = (base*hauteur)/2
    print("Aire du triangle = \(air)")
}

func exercice4() {
    let PI = 3.14159265
    print("Calcul de l'air d'un cercle.")
    print("entrez le rayon = ")
    let rayon = readDouble()
    let air = PI * pow(rayon,2)
    print("Air du cercle = \(air)")
}

func exercice5(){
    print("Calcule du factoriel d'un nombre")
    var n:Int
    
    repeat {
       print("Entrez un nombre entier positif = ")
       n = readInt()
    } while n < 0
    
    var factoriel = 1
    if n > 1 {
        for i in 2...n {
            factoriel = factoriel * i
        }
    }
    
    print("Factoriel de \(n) = \(factoriel))")
}

func exercice6() {
    print("Calculer de moyenne d'une liste de nombre")
    var nbNotes:Int = 0
    var noteSaisie:Double = 0
    var somme:Double = 0
    repeat {
        print("Entrez la note numéro \(nbNotes + 1 )")
        noteSaisie = readDouble()
        if noteSaisie >= 0 {
            somme = somme + noteSaisie
            nbNotes = nbNotes + 1
        }
    } while noteSaisie >= 0
    var moyenne:Double
    moyenne = somme / Double(nbNotes)
    
    /*
    print("Combien de note sont a saisir ? = ")
    let nombreNote = readInt()
    var n:Int = 1
    var moyenne:Double = 0
    var premierNombre = false
    while n<=nombreNote {
        print("Entrez le numero \(n) = ")
        let saisie = readDouble()
        if premierNombre == true {
           moyenne = (moyenne + saisie ) / 2
        } else {
         moyenne = saisie
         premierNombre = true
        }
        n = n + 1
    }
     */
    print("Moyenne egale = \(moyenne)")
 
}

func exercice7() {
    let nbrAleat = generateRandomNumber(min: 1, max: 100)
    print("Trouver le nombre choisis entre 1 et 100 et 0 pour arreter.")
    var trouve:Bool = false
    while trouve == false {
        print("Essai entrez un nombre =")
        let saisie = readInt()
        if saisie == nbrAleat {
            print("Bingo")
            trouve = true
        } else
            if saisie == 0 {
                print("Au revoir")
                trouve = true
        } else
        if saisie > nbrAleat {
            print("moins")
        } else {
            print("plus")
        }
    }
}

func exercice8() {
    print("Jeu de NIM")
    var nbRestantes = 20
    var termine:Bool = false
    var joueur1 = true
    while termine == false {
        if joueur1 {
            print("Il reste \(nbRestantes): Joueur 1 = saisir de 1 a 3 ")
        } else {
            print("Il reste \(nbRestantes): Joueur 2 = saisir de 1 a 3 ")
        }
        let saisie = readInt()
        nbRestantes = nbRestantes - saisie
        if nbRestantes == 1 {
            if joueur1 {
                print("Joueur 2 perdu")
            } else {
                print("Joueur 1 perdu")
            }
            termine = true
        } else
            if nbRestantes < 1 {
                if joueur1 {
                    print("Joueur 1 perdu")
                } else {
                    print("Joueur 2 perdu")
                }
        }
        joueur1 = !joueur1
    }
    
}

func exercice8_bis() {
    print("Jeu de NIM")
    var nbRestantes = 20
    var termine:Bool = false
    var joueur = 1
    var saisie:Int = 0
    while termine == false {
        print("Il reste \(nbRestantes): Joueur \(joueur) = saisir de 1 a 3 ")
        repeat {
           saisie = readInt()
        } while saisie < 1 || saisie > 3
        nbRestantes = nbRestantes - saisie
        if nbRestantes == 1 {
            if joueur == 1 {
                print("Joueur 2 perdu")
            } else {
                print("Joueur 1 perdu")
            }
        } else
            if nbRestantes < 1 {
                print("Joueur \(joueur) perdu")
        }
        if joueur == 1 {
            joueur = 2
        } else {
            joueur = 1
        }
        termine = nbRestantes <= 1
    }
    
}

func saisieIA(nbAllumettesDisponibles:Int) -> Int {
    var saisieIA:Int = (nbAllumettesDisponibles - 1) % 4
    if saisieIA == 0 {
        saisieIA = 1
    }
    
    print("L'IA a pris \(saisieIA) allumette" + (saisieIA > 1 ? "s" : ""))
    return saisieIA
}

func exercice8_trois() {
    var nbAllumettesRestantes:Int = 20
    var joueurActuel:Int = generateRandomNumber(min: 1, max: 2)
    
    while nbAllumettesRestantes > 0 {
        print("Il reste \(nbAllumettesRestantes) allumette(s)")
        var saisieJoueur:Int
        let saisieMax = min(3, nbAllumettesRestantes)
        if joueurActuel == 2 {
            saisieJoueur = saisieIA(nbAllumettesDisponibles: nbAllumettesRestantes)
        } else {
            repeat {
                print("Joueur \(joueurActuel), combien d'allumettes ?")
                saisieJoueur = readInt()
            } while saisieJoueur < 1 || saisieJoueur > saisieMax
        }
        nbAllumettesRestantes = nbAllumettesRestantes - saisieJoueur
        
        if joueurActuel == 1 {
            joueurActuel = 2
        } else {
            joueurActuel = 1
        }
    }
    print("Le joueur \(joueurActuel) a gagné")
}

// Deuxiemme Jour
// Exercice 1

func pythagore(coteA:Double, coteB:Double) -> Double {
    return sqrt(coteA*coteA + coteB*coteB)
}

func exercicePythagore() {
    print("Calcule de l'hypothenuse d'un triangle rectangle.")
    print("Entrez la valeur du 1ere coté = ")
    let saisieA = readDouble()
    print("Entrez la valeur du 2nd coté = ")
    let saisieB = readDouble()
    print("L'hypothenuse est egale a = \(pythagore(coteA: saisieA, coteB: saisieB))")
}


// Exercice 2

func demandeValeurs(diviseur:Int) {
    var valeur:Int = 0
    var nombre:Int = 0
    var nombreDivisibleParDiviseur:Int = 0
    print("Entrez une liste de nombre, pour finir tapez 0.")
    repeat {
        valeur = readInt()
        if valeur > 0 && valeur % diviseur == 0{
            nombreDivisibleParDiviseur = nombreDivisibleParDiviseur + 1
        }
        nombre = nombre + 1
    } while valeur > 0
    print("Vous avez entrez \(nombre-1) nombre(s) ")
    print("Vous avez \(nombreDivisibleParDiviseur) nombre(s) divisible par \(diviseur)")
}

// Exercice 3

func tableMutiplication() {
    print("Table de multiplication.")
    
    var n:Int = 0
    print("Entrez un nombre en 1 & 9 ")
    repeat {
        n = readInt()
    } while n < 1 || n > 9
    
    for ligne:Int in 1...9 {
        
        for colonne:Int in 1...n {
            print("\(colonne*ligne)  ",terminator:"")
        }
        print("")
    }
}


// Exercice 4

func plusProcheDuNombre(nombre:Int) {
    var precedent:Int = 1
    var suivant:Int = 1
    var compteur:Int = 1
    while suivant < nombre {
        precedent = suivant
        compteur = compteur + 1
        suivant = suivant + compteur
    }
    if abs(suivant-nombre) < abs(precedent-nombre) {
          print("Le plus proche de \(nombre) est \(suivant)")
    } else {
          print("Le plus proche de \(nombre) est \(precedent)")
    }

}

//Commencez vos instructions en dessous de cette ligne
// exercicePythagore()

//demandeValeurs(diviseur:7)
//demandeValeurs(diviseur:4)
//demandeValeurs(diviseur:2)

//tableMutiplication()

plusProcheDuNombre(nombre:14)
plusProcheDuNombre(nombre:18)
plusProcheDuNombre(nombre:19)



 
