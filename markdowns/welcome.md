# Bienvenue au tutoriel Delphi pour codingame !

Ce tutoriel a pour but de vous rappeler quelques principes de base de la programmation Pascal Delphi, ainsi que le fonctionnement d'une classe particulièrement utile dans les exercices codingame (`TStringList`).

Vous pouvez tester les exemples ci-dessous en les recopiant dans la fenêtre ci-dessous et en cliquant sur *Run*.

## Quelques rappels du Pascal
- Pascal est _case insensitive_ donc la variable `Liste` est la même que `LISTE` et la même que `liste`
- les instructions sont séparées par des `;`
- l'opérateur d'affectation est `:=`
- l'opérateur de comparaison est `=`
- les variables doivent être déclarées dans une section `var` avant d'être utilisées dans la section `begin...end` et ça vaut _même pour les indices de boucle !_
- les chaînes de caractères litérales sont entre `'` et pas entre `"` 
- l'opérateur de concaténation de chaînes de caractères est `+`
```
writeln('La valeur de NOM est ' + NOM);
```
- la fonction `Chr(n)` permet d'obtenir le caractère de code `n`
```
writeln(Chr(97));
```
- la fonction `Ord('x')` permet d'obtenir le code du caractère `'x'`
```
writeln(Ord('a'));
```
- la fonction `IntToStr(N)` permet d'obtenir la chaîne de caractères contenant la réprésentation décimale de l'entier `N`


## Un peu plus Delphi

Pour être plus proche du Delphi vous devez ajouter la directive suivante au début du programme :
```pascal
{$MODE DELPHI} 
```

## pour lire sur l'entrée standard

La procédure `readln` permet de lire une ligne sur l'entrée standard et la retourne dans la variable passée en paramètre
```
var
  Line : String;
begin
  readln(Line);
end;
```

## Pour écrire sur les sorties standards

La procédure `writeln` permet d'écrire une ligne sur les sorties standard `StdOut` (par défaut) et `StdErr` :
```pascal
writeln('Résultat sur StdOut');
writeln(StdErr, 'trace sur StdErr');
```

## Les tableaux

- la déclaration d'un tableau statique
```
var
   Nombres : array[1..10] of Integer;
```
- la sélection d'un élément se fait avec l'indice entre crochets `[]`
```
begin
   Nombres[5] := 5000;
```
- la fonction `Length` retourne le nombre d'éléments du tableau
```
   writeln(IntToStr(Length(Nombres)));
```
- la déclaration d'un tableau dynamique dont la taille est définie ou modifiée avec l'opération `SetLength`
```
var
   Nombres : array of Integer;
begin
   SetLength(Nombres, 10);
```

## Documentation complémentaire

- sur le type [array](http://wiki.freepascal.org/Array/fr)
- sur la classe [TStringList](http://wiki.freepascal.org/TStringList-TStrings_Tutorial/fr)

# Pour expérimenter

Vous pouvez éditer la zone ci-dessous, et copier/coller les exemples et les exécuter :

@[Run]({stubs: [demo.pas], command: "sh -c 'fpc -Tlinux -gl -Mdelphi -WX -v0 -odemo demo.pas 2> /dev/null | tail -n +3 && ./demo'"})
