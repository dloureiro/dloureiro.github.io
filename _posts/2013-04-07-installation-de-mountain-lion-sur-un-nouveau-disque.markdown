---
author: David Loureiro
comments: true
date: 2013-04-07 15:23:47+00:00
layout: post
lang: fr
sharing: true
slug: installation-de-mountain-lion-sur-un-nouveau-disque
title: "Installation de Mountain Lion sur un nouveau disque"
categories:
- Mac
tags:
- installation
- Mac
- Mountain Lion
- nouveau disque
social: "Install de #MountainLion sur un nouveau disque"
---

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/mac_osx_mountain_lion-300x179.png" alt='Crédits : http://images.apple.com'/>
<figcaption style="color:black">Crédits : "http://images.apple.com"</figcaption>
</figure>
</p>

Ma machine arrivait à bout de souffle et j'ai voulu lui redonner une jeunesse. Après un changement de disque dur et de l'ajout de mémoire, il a fallu réinstaller le système. Récit d'une opération finalement plus complexe que prévu! 

<!-- *more* -->

Mon MacBook Pro de fin 2008 a subit différentes montées de version :

* Migration depuis un G4
* Migration de Snow Leopard a Mountain Lion Et n'a jamais été réinstallé depuis son acquisition. Devenu lent, buggé et presque inutilisable, il était temps d'agir. Après le changement de matériel (Changement du disque pour un SSD) Doublement de la RAM

Il fallait réinstaller Mountain Lion. Sauf qu'Apple ne fournit plus de DVD d'installation. Voici donc les différentes étapes que j'ai tester avant d'enfin réussir!

## Le fantasme de la clef USB

Ayant du aller changer mon iPhone récemment dans un Apple Store, j'en ai profité pour demander à un "Genius" comment faire cette installation dans le cadre d'un changement de disque.

Il a tout d'abord confirmé qu'Apple ne fournissait plus DVD ou de clef USB avec une image du système. Il m'a ensuite appris qu'il existait une méthode passant par l'utilisation d'une clef USB, créée à partir du système téléchargé depuis l'App Store mais qu'il n'en savait pas plus.

Le moment venu, j'ai donc cherché à en savoir plus sur la pratique. Le web regorge de tutoriels présentant différentes méthodes permettant de créer cette clef USB et installer ensuite le système. Dans un premier temps il faut pouvoir récupérer une image du système à réinstaller. Différentes méthodes existent :

* Utilisation de la partition de recovery du disque à remplacer : Mountain Lion créé une partition de recovery que vous pouvez utiliser pour réinstaller le système. Lors du démarrage de votre Mac appuyez sur Cmd+Alt+R et choisissez de réinstaller le système sur la clef USB branchée.
* Téléchargement du système depuis l'App Store.


Dans tout ça, la seule chose un peu longue, c'est le téléchargement du système. 4,4 Go à récupérer c'est long, même quand on dispose de la fibre.

Une fois cela réalisé, vous pouvez utiliser le logiciel [LionDiskMaker](http://liondiskmaker.com/?lang=fr) qui vous permettra de créer une clée bootable ou un DVD d'installation avec Mountain Lion. Il vous suffira de trouver le fichier nommé InstallESD.dmg et de suivre les directives.

Il ne vous reste plus qu'à redémarrer votre Mac avec la clef branchée ou le DVD inseré pour réinstaller votre système!

...

Sauf que moi, cela ne fonctionnait pas :(

J'ai eu beau essayer cette méthode, essayer la méthode alternative avec la procédure de récupération disponible dans l'utilitaire de disque du mac (cette solution permet d'installer une image directement sur la clef USB comme si l'on utilisait une image ISO pour graver un CD ou un DVD), rien n'y a fait.

## L'installation de Snow Lepoard et la montée de version

Je me suis donc dit qu'il était encore possible d'installer Snow Leopard et ensuite de faire la montée de version vers Mountain Lion.

Finalement une solution plutôt sûre car je disposais du DVD d'installation et qu'il était en bon état... Mais pas mon lecteur de DVD. Il semble qu'il soit la prochaine pièce à changer sur le Mac.

Cette option n'était donc pas possible.

## La solution finale ... à laquelle je n'avais pas pensé

Arrivé à ce stade, je me demandais quelles pouvaient bien être les possibilités qu'il me restait à exploiter. J'ai finalement choisi de tester l'installation depuis la partition de recovery de mon ancien disque. En effet : dans la mesure où il est possible de booter le système depuis une clef USB, j'ai décidé de mettre le nouveau disque dans le Mac, et de mettre l'ancien dans un boitier externe pour disque dur et de booter sur la partition de recovery qu'il contient.

J'ai ainsi pu installer Mountain Lion sur le nouveau disque et repartir sur de bon rail avec une installation fraîche du système, et rien pour venir le ralentir.

Après quelques heures d'installation d'applications, de paquets mac ports, la récupération de mes repository svn, gits, de mes musiques, etc, ma machine était propre et rapide. Comme si je venais d'avoir un nouveau Mac!

Il faut quand même noter que j'ai du télécharger 4 fois le système afin de pouvoir arriver à l'installer correctement, presque 18Go!

Maintenant il faut que je m'occupe de mon lecteur superdrive ... Mais ceci est réservé à une prochaine fois!
