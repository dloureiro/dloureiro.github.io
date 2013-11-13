---
author : David Loureiro
layout: post
title: "Jekyll, bootstrap et github pour un blog en quelques minutes"
description: ""
categories: 
- Web
tags: 
- jekyll
- bootstrap
- github
- blog
comments: true
date: 2013-11-13 17:16:00+01:00
lang: fr
sharing: true
social: "#Jekyll, #bootstrap et #Github pr un blog rapide!"
---
{% include JB/setup %}
<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

Pour mettre en place un site rapidement (ou un blog pour faire simple) il y a milles possibilités. L'expérience que j'ai me fait dire que l'on a trois gros points à regarder quand on souhaite faire cela sans trop se prendre la tête et en ayant quelque chose de simple :

 * Le moteur de blog
 * L'hébergeur
 * L'interfaçage entre les deux

# Le Besoin

Mon besoin était le suivant : Il me fallait un moteur assez simple à utiliser pour ne pas avoir à dépendre d'une grande quantité de pré-requis, il fallait que la communauté soit suffisamment grande pour disposer de documentation et de plugins, il fallait aussi que je puisse disposer d'une infra sous-jacente simple à utiliser.

Et tout cela sans débourser un copec.

# Le moteur de blog

## Les solutions classiques

Depuis une petite dizaine d'années, j'ai utilisé plusieurs moteurs de blog : 

 * [Dotclear](http://fr.dotclear.org/)
 * [Wordpress](http://fr.wordpress.org/)
 * Des moteurs plus light qui se reposent sur des bases de données de type sqlite ou xml : [plumxl-blog est un exemple](http://www.pluxml.org/)
 * Des CMS comme [Joomla](http://www.joomla.org/) ou [Drupal](http://drupalfrance.com/)
 * Des moteurs de wiki comme [mediawiki](http://www.mediawiki.org/wiki/MediaWiki/fr)
 * [Blogger](http://www.blogger.com/)

Tous sauf Blogger sont libres mais tous sont utilisables librement. [Wordpress online](http://fr.wordpress.com/) est un peu différent dans ses conditions d'utilisation.

Un des points importants est qu'il est important de trouver un outil qui correspondent à vos besoins, qui dispose d'une grande communauté, qui possède un grand nombre de plugins et qui soit bien supporté par la plate-forme sous-jacente (base de données, version de php, etc).

Wordpress en tant que leader incontesté est souvent le plus "standard". Il reste cependant lourd et il faut une base de données. Il possède cependant un grand nombre de plugins qui permettent souvent de lui adjoindre les fonctionnalités exotiques qu'il pourrait lui manquer et dont vous pourriez avoir besoin. Et je ne vous parle par de la communauté...

Dotclear est un concurrent de Wordpress en terme de fonctionnalités, et de pré-requis. Cependant il possède une communauté moins grande et un support moins grand quand on va du côté des plate-formes (typiquement l'hébergement de free ne permet pas son utilisation).

Les outils en ligne comme Blogger ou Wordpress online sont intéressants car vous n'avez pas à vous embêter avec la plate-forme, l'intégration la gestion des versions, etc. Mais vous perdez aussi la mains le code, sur la base de données en même temps.

Les moteurs de wiki peuvent être intéressants (notamment wikimedia qui est derrière wikipédia), mais ce n'est vraiment pas le même usage pour le même type de pré-requis que wordpress par exemple.

En ce qui concerne les moteurs de blog qui se basent des bases de type sqlite, ils ont une communauté restreinte et moins de plugins et de support que les autres solutions, mais en même temps ils ont des pré-requis plus simple (notamment en terme de base de données).

Les CMS sont intéressants, mais cela peut devenir compliqué pour un simple blog, les technologies comme Joomla ou encore Drupal imposent peut-être de franchir une marche trop haute pour pouvoir les prendre en main et aboutir à un blog.

Tout ceci ne me satisfaisait pas vraiment, j'avais besoin d'un outil simple pour rédiger les billets de blog, avec une bonne communauté, sans pré-requis importants.

## Solution choisie

[**Jekyll !**](http://jekyllrb.com/)

Cette techno possède plein de caractéristiques sympathiques :

 * Il s'agit d'un moteur de blog statique. Les pages sont pré-générées et une fois sur l'infrastructure qui hébergera le blog, le service des pages sera plus rapide. En fait si on regarde bien, assez peut de choses ont besoin d'être générées à la volée. Les commentaires vont éventuellement nécessiter quelque chose de dynamique, mais maintenant des technologies comme [Disqus](http://disqus.com/) fonctionnent.
 * Il n'a donc pas besoin de base de données et les billets sont écrits en [Markdown](http://daringfireball.net/projects/markdown/syntax). Magnifique, moi qui aime bien ce format de texte pur, c'est parfait.
 * La communauté est plutôt large car il s'agit en fait du moteur de page utilisé par [Github](https://github.com/), le plus grand réseau de social coding.
 * C'est bien intégré avec des outils comme bootstrap pour avoir des sites web responsive (notamment [Jekyll-bootstrap](http://jekyllbootstrap.com/) qui est la version que j'utilise).
 * C'est très extensible et il existe un grand nombre de plugins et de thèmes sur le net
 * Un système de build de chez ruby nommé rake qui vous permet de créer en un clin d'oeil, une page, un post, d'installer ou de changer le thème, etc.

Pour certains, le fait que cela soit en Ruby peut poser problème. Bon pour moi non, et comme j'utilise un hébergeur qui fournit le support de Jekyll, c'est pas un problème. Mais sinon, d'une certaine manière, comme Jekyll permet la génération d'un site statique, nous n'avez vraiment besoin de Ruby que sur votre machine

# Les plates-formes

Une fois que l'on a le moteur, il faut la voiture, ici en l'occurence la plate-forme d'hébergement qui se doit d'être gratuite. 

J'ai pu tester différents providers : 

 * [Free](http://pagesperso.free.fr/)
 * [Espace4you](http://www.espace4you.org/)
 * Du PaaS comme [OpenShift](https://www.openshift.com/)

Le problème avec Free c'est que l'on est limité par la version de PHP disponible et par la version de MySQL. Donc ça va bien pour certaines choses, mais pas pour tout. Par exemple, il n'est pas possible d'utiliser la dernière version de Wordpress par exemple ...

Pour Espace4You, il s'agit en fait d'un hébergeur qui à l'époque était affilié au [RHIEN](http://www.rhien.org/) un réseau d'hébergeurs gratuit qui fournit finalement un servir dont la qualité, est ce qu'elle est. Si vous ne craignez pas de débugguer le provider et que le fait que vos site soit down un peu de temps par-ci, par-là, alors allez-y. Ils sont sympa :)

Pour ce qui est d'OpenShift c'était un test qui finalement s'est avéré plutôt intéressant. L'idée derrière un PaaS est que vous n'avez pas à gérer la plate-forme, elle est gérée pour vous. Vous pouvez ainsi disposer d'une petite machine virtuelle pour pas cher avec quelques service comme PHP ou MySQL. Vous pouvez même utiliser des "gears" (cela correspond à une fonctionnalité comme PHP, MySQL, etc) pour Wordpress ou d'autres outils de ce type. Et en plus, cerise sur le gâteau, vous avez git à disposition pour versionner vos fichiers. Le rêve pour un geek :)

Bon pour avoir testé wordpress sur OpenShift, c'est pas top. Déjà parce qu'on doit rester dans les clous de ce que cela nous permet :la gestion des plugins wordpress est un bordel sans nom entre ceux que l'on installe soit même via l'interface et ceux que l'on pousse via git par exemple.

Plutôt rapide à mettre en place, on se prend pas la tête, la lenteur est peut-être juste le seul bémol selon moi.

# Solution choisie

En fait, quand j'ai découvert Jekyll, je me suis rendu compte que ce que Github pouvait fournir pour des pages de projet (avoir une page qui décrit un projet par exemple, sa doc, son utilisation, son installation, etc) via la branch ``gh-pages`` d'un repository, on pouvait l'avoir directement pour un utilisateur. Et comme ils hébergent directement Jekyll en interne, il suffit de pousser sur git ses modifications et elles sont prises en compte automatiquement !

En fait dans ce cadre-là, Github sert de plate-forme de PaaS car finalement on en revient globalement aux mêmes fonctionnalités qu'un PaaS.

Et tout ça est gratuit :)

La qualité de service est top (on parle de github hein) et git est une technologie de plus en plus utilisée pour le déploiement de code sur les plates-formes SaaS ou PaaS par exemple, donc ça fonctionne.

# En conclusion

Avec Jekyll-bootstrap qui est une version responsive et plus user-friendly je trouve que Jekyll (mais toujours compatible) et github, on arrive à avoir un simple simple à utiliser, gratuit, avec un moteur ayant une grosse communauté et plein de plugins et finalement on dispose d'une infra dont on ne s'occupe pas avec une super qualité de service.

Dans un poste suivant j'expliquerais comment changer le nom du blog qui est quelque chose comme  ``http://user.github.io``en ce que vous voulez.
