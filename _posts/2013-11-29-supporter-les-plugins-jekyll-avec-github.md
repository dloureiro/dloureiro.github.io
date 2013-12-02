---
layout: post
title: "Supporter les plugins Jekyll avec Github"
description: ""
categories:
- web
tags:
- jekyll
- github
- plugins
date: 2013-11-29 16:06:34+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "Supporter les plugins Jekyll avec Github"
---
{% include JB/setup %}
<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

Dans la mise en place de ce site, j'ai fait le choix d'utiliser Github et son support de Jekyll. Mais Github apparemment n'utilise pas les plugins utilisés et encore moins les extensions ... Comment faire pour pallier cela ? Voici une solution, tout du moins, celle que j'ai appliqué de mon côté.

<!-- *more* -->

# Le problème

Dans le but d'ajouter des fonctionnalités, je me suis mis farfouiller le net pour trouver des plugins à Jekyll qui puisse le rendre plus sympa (comme par exemple l'internationalisation des chaînes de l'anglais vers le français).

Pour ceci j'ai notamment utilisé un plugin : `i18n_filters.rb` trouvé sur le net. J'avais l'impression quand même que ça faisait pas totalement ce que je voulais, mais les dates n'étant plus sous format US, ça m'allait.

En fait, ça ne fonctionnait pas, mais je ne le savais pas.

Je m'en suis rendu effectivement compte quand j'ai voulu ajouté un billet et que le site ne se mettait pas à jour. J'ai quelques minutes après reçu un mail de github m'expliquant que la compilation du site ne fonctionnait pas.

# Les recherches

J'ai, comme proposé sur Github, regardé les pages de l'aide associées à cette erreur ([ici](https://help.github.com/articles/using-jekyll-with-pages#troubleshooting) et [là](https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll)), et j'ai vu deux choses qui pouvaient s'appliquer:

 * Github compile avec l'option `--safe` de Jekyll qui évite tous les plugins
 * Si on veut en savoir plus il faut utiliser par exemple travis-ci pour tester la compilation et comprendre d'où vient le problème.

N'ayant pas vu de problème sur ma machine en compilation normalement avec jekyll et non plus avec `--safe`, j'ai testé travis-ci.

Je vous passe la création du compte, le lien fait avec github et la configuration du repos pour être testé par travis (vous trouverez ces informations ici : [https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll#viewing-build-error-messages](https://help.github.com/articles/pages-don-t-build-unable-to-run-jekyll#viewing-build-error-messages)), je me suis rendu compte en pushant qu'il y avait un problème dans le plugin que j'avais ajouté pour la partie internationalisation : apparemment il manque une `gem` chez github (i18n, éétonnamment).

Arrivé à cette étape, je me suis dit que c'était quand même bien dommage. Et j'ai cherché sur l'internet mondial quelles pouvaient être les parades. Je suis finalement tombé sur un billet de blog : [Jekyll : Handling Github page build failure and Jekyll plugins on Github](http://varunbpatil.github.io/2013/07/06/jekyll-build-fail/#.UpYfE2Tfwqt). Le monsieur, Varun B. Patil, explique la manière qu'il a d'utiliser Jekyll avec des plugins en restant sur Github, et elle est on ne peut plus simple : compilation locale et push des fichiers statiques à distance.

Bon la je simplifie, mais l'idée est là.

# La solution

Le but est donc de maintenir deux branches au sein de votre repository :

 * une branche, nommée `source` par exemple qui contiendra les sources de votre site web
 * une branche, la `master` qui hébergera la version compilée de votre site

L'idée est ainsi de faire toutes les modifications que vous souhaitez dans la branche source, commiter, pusher ces modifications sur la branche correspondante, et une fois que ce sera ok pour voir (avec une installation locale de jekyll), vous pourrez compiler vers une version statique que vous pousserez de force sur la branche master.

Outre le support de plugins, cette méthodologie est aussi utilisable si vous souhaitez utiliser `jekyll_ext` comme je le fais par exemple pour étendre les fonctionnalités possibles.

Cette méthode permet aussi aux hackers qui souhaitent se former à Ruby et développer des plugins qui dépendraient de gems spécifiques.

# La méthode

## Branches

Dans un premier temps, il est nécessaire de créer la branche qui hébergera les sources de votre site. Pour l'instant cela doit être la branche `master`. Nous devons donc créer une branche qui soit la copie de la branche master. Nous pourrons la nommer `source` ou quoi que ce soit d'autres, c'est vous qui voyez. 

    $ git checkout -b source master

Une fois que cette branche est créée, vous pouvez la pousser sur votre repository.

    $ git push -u origin source

Vous devriez à présenter voir deux branches sur votre repository (la master et la nouvelle que vous venez de créer).

## Les apparences

Si je dis les apparences, c'est que cette étape est purement cosmétique. L'idée est en fait de changer la branche affichée par défaut par Github.

En vous rendant dans les paramètres de votre dépôt sur le site de Github, vous pouvez changer la branche qui sera affichée par défaut pour votre dépôt. L'idée est juste que les personnes arrivant sur votre site ne voient pas la version compilée de votre site, mais les sources. L'idée est aussi que lorsqu'une personne clonera votre repository, elle récupérera les sources et pas la version compilée.

Moi je l'ai fait, vous faites comme vous voulez :).

## Compilation et Push vers la master

Compiler en local avec jekyll est plutôt simple. Pusher la sortie vers la branch master est simple.

L'idée est juste de ne pas trop perdre de temps à chaque fois que l'on souhaite juste corriger une typo sur le site ...

Ainsi, basé sur le script proposé par Varun B. Patil, j'ai mis en place un autre qui marche pour moi :)

Vous pourrez trouver le fameux script à l'adresse suivante : [https://github.com/dloureiro/dloureiro.github.io/raw/source/publish.sh](https://github.com/dloureiro/dloureiro.github.io/raw/source/publish.sh).

Vous n'avez qu'à ajouter ce script à votre dépôt contenant les sources du site web pour toujours avoir avec vous votre script qui pousse votre site compilé comme il faut.

Afin de simplifier son usage, j'ai ajouté des variables en tête du script qui permette de définir :

 * `TMP_DIR` : un dossier temporaire où va se faire la compilation
 * `TMP_SRC_DIR` : un dossier dans lequel va être placée une version clean des sources
 * `GIT_URL` : l'URL du repository git où va être poussée la version compilée du site
 * `JEKYLL_CMD` : la commande utilisée pour compiler le site

Vous n'avez qu'à adapter ce script à vos besoin et pousser la nouvelle version de votre site web sera aussi simple que ça :

    $ cd <your_local_clone_of_github_repo>
    $ ./publish.sh

Vous pouvez maintenant utiliser Jekyll avec les plugins et extensions les plus siouxes qu'il existe sans problèmes !