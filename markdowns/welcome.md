# Bienvenue au tutoriel Delphi pour codingame !
Ce tutoriel a pour but de vous rappeler quelques principes de base de la programmation Pascal Delphi, ainsi que le fonctionnement d'une classe particulièrement utile dans les exercices codingame (`TStringList`).

Vous pouvez tester les exemples ci-dessous en les recopiant dans la fenêtre ci-dessous et en cliquant sur *Run*.

## Quelques rappels du Pascal
- Pascal est _case insensitive_ donc la variable `Liste` est la même que `LISTE` et la même que `liste`
- les instructions sont séparées par des `;`
- tout ce qui est après `//` sur une ligne est un commentaire (sauf à l'intérieur d'une chaîne de caractères)
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
- la fonction `IntToStr(N)` permet d'obtenir la chaîne de caractères contenant la réprésentation décimale de l'entier `N` ; la fonction `StrToInt(S)` permet d'obtenir la valeur décimale de l'entier dont la chaîne S contient la représentation décimale (vous devez ajouter `uses sysutils;` au début de votre programme avant d'utiliser ces fonctions)
- l'instruction `break` permet d'interrompre la boucle directement englobante


## Un peu plus Delphi
Pour être plus proche du Delphi vous devez ajouter la directive suivante au début du programme :
```pascal
{$MODE DELPHI} 
```

## Pour lire sur l'entrée standard
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
   ...
end;
```
- la fonction `Length` retourne le nombre d'éléments du tableau
```
   writeln(IntToStr(Length(Nombres)));
```
- la déclaration d'un tableau dynamique dont la taille est définie ou modifiée avec la procédure `SetLength` et dont l'index va de `0` à `Length()-1`
```
var
   Nombres : array of Integer;
   I       : Integer;
begin
   SetLength(Nombres, 10);
   for I := 0 to Length(Nombres)-1 do
   begin
      Nombres[I] := I;
   end;
end;
```

## Le couteau suisse : TStringList
Vous aurez rapidement besoin d'une structure flexible de type hashmap ou dictionnaire clé/valeur. En Delphi vous pouvez utiliser `TStringList` pour remplir ce rôle de couteau suisse. Cette classe est très riche mais voici quelques cas d'usage simples à connaître :

- n'oubliez pas le `uses classes;` en début de votre programme pour avoir accès à ces classes
- avant l'ajout du premier élément, la structure doit être initialisée avec la fonction `TStringList.Create()` et lorsqu'elle n'est plus utilisée la mémoire allouée doit être libérée en utilisant la méthode `Free`.
- la méthode `Add` ajoute une chaîne à la liste
- la propriété `Count` retourne le nombre de chaînes dans la liste
- la fonction `IndexOf` retourne l'indice (base 0) de la chaîne dans la liste ou _-1_ si elle n'est pas dans la liste
- les `[]` permettent d'accéder à la chaîne à un indice donné (comme dans un tableau dynamique avec indice base 0)
- la propriété `Text` (resp. `CommaText`) retourne une chaîne contenant toutes les chaînes de la liste séparées par des `'\n'` (resp. `','`), et peut même être utilisée pour initialiser la liste mais cela dépasse le cadre de ce simple tuto
```
var
   Dict : TStringList;
begin
   Dict := TStringList.Create();
   Dict.Add('Un');
   Dict.Add('Deux');
   Dict.Add('Trois');
   writeln('Deux est en position : ' + IntToStr(Dict.IndexOf('Deux')));
   writeln('A la position 0 il y a : ' + Dict[0]);
   writeln(Dict.Text);
   Dict.Free;
end;
```


## Documentation complémentaire

- sur le type [array](http://wiki.freepascal.org/Array/fr) et pour aller plus loin en [anglais](http://www.delphibasics.co.uk/RTL.asp?Name=Array)
- sur la classe [TStringList](http://wiki.freepascal.org/TStringList-TStrings_Tutorial/fr) et pour aller plus loin [en anglais](http://www.delphibasics.co.uk/RTL.asp?Name=tstringlist)
- si vous voulez définir des [fonctions ou procédures](http://www.delphibasics.co.uk/Article.asp?Name=Routines) (en anglais)

# Pour expérimenter

Vous pouvez éditer la zone ci-dessous, et copier/coller les exemples et les exécuter :

@[Run]({stubs: [demo.pas], command: "sh -c 'fpc -Tlinux -gl -Mdelphi -WX -v0 -odemo demo.pas 2> /dev/null | tail -n +3 && ./demo'"})
