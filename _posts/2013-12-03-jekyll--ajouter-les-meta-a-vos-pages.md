---
layout: post
title: "Jekyll : Ajouter les meta a vos pages"
description: ""
categories:
- web
tags:
- jekyll
- meta
- seo
date: 2013-12-03 21:53:24+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "#Jekyll : Ajouter les #meta a vos pages"
---
{% include JB/setup %}

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

Le thème Jekyll-Bootstrap que j'utilise est plutôt léger concernant les méta qui peuvent servir à faire du SEO (Search Engine Optimization). Voici ce qu'il est possible de faire pour améliorer ça.

<!-- *more* -->

De base dans le layout par défaut utiliser pour toutes les pages du thème hooligan, il y a quelques éléments dans les méta :

 * la description quand on est sur une page
 * l'auteur 

Et puis c'est tout !

# Quels sont les méta utiles et utilisables

Pour infos, ces informations viennent du très bon billet chez paradigmatic : [Generating html meta data with Jekyll](http://paradigmatic.streum.org/2011/02/generating-html-meta-data-with-jekyll/).

En plus de l'auteur que l'on va conserver, voici les meta que l'on va définir :

 * description
 * keywords
 * date
 * robots

## Description

La description est une des valeurs meta utilisée par les moteurs de recherche. Cette valeur ne sert qu'à l'amélioration de l'affiche de votre site sur les pages de recherche. Elle n'améliore en rien le classement de vos pages.

voici ce que j'utilise : 

    \{\%if page.title \%\}
    <meta name="description" content="\{\{ site.title \}\} : \{\{page.title\}\}" />
    \{\% else \%\}
    <meta name="description" content="\{\{ site.title \}\} : \{\{site.tagline\}\}" />
    \{\% endif \%\}

**Remarque :**


> Toutes les accolades et les pourcentages sont échappés dans le code afin d'éviter que Jekyll les interprète. Si vous souhaitez réutiliser le code présenté ici, je vous conseille directement d'aller voir le fichier cité plus haut qui contient les éléments décrits dans ces différentes sous-sections.

L'idée est ici d'utiliser les données qui sont présentes dans le fichier de configuration de Jekyll (`title` et `tagline`) et le titre des pages sur lesquelles on va aller. À savoir que lors de l'affichage d'un billet (post), on a aussi dans la variable `page` le titre du billet affiché.

## Keywords

Les mots-clés ou keywords ont beaucoup été utilisés, et malheureusement parfois de manière abusives et maintenant ils ne sont plus vraiment utilisés par les moteurs de recherche pour le classement des pages. Cependant, pour l'analyse de contenu ils peuvent s'avérer utiles.

    \{\% if page.tags \%\}
    <meta name="keywords" content="\{\{page.categories | join: ','\}\},\{\{page.tags | join: ','\}\},\{\{site.keywords | join: ','\}\}" />
    \{\% elsif page.categories \%\}
    <meta name="keywords" content="\{\{page.categories | join: ','\}\},\{\{site.keywords | join: ','\}\}" />
    \{\% else \%\}
    <meta name="keywords" content="\{\{site.keywords | join: ','\}\}" />
    \{\% endif \%\}

L'idée ici est de se service des mots-clés qui seront définis au sein du fichier `_config.yml` pour servir de base.

Ensuite, en fonction que l'endroit où l'on se trouve, on aura :

 * si on se trouve sur un billet on aura les catégories, plus les tags et ensuite les mots-clés définis dans le fichier de configuration
 * si l'on se trouve sur une page on aura les catégories plus les mots-clés définis dans le fichier de configuration
 * si on se trouve sur une page sans catégorie, on aura les mots-clés globaux

## Date

Si vous voulez ajouter la date dans les meta, voici la façon que j'utilise : 

    \{\% if page.date \%\}
    <meta http-equiv="date" content="\{\{page.date |date: '%A, %d  %Y %H:%M:%S GMT'\}\}" />
    \{\% else \%\}
    <meta http-equiv="date" content="\{\{site.time |date: '%A, %d  %Y %H:%M:%S GMT'\}\}" />
    \{\% endif \%\}

Ici, on va utiliser la date qui sera défini dans les pages (surtout dans les billets en fait) si jamais elle existe. Dans le cas contraire on utilise la variable que Jekyll définit de base `site.date`.

## Robots

Cette variable dit aux robots qui sont utilisés par les moteurs de recherche lors de l'indexation, si l'on souhaite effectivement que la page courante soit indexée ou si on souhaite par exemple suivre les liens présents dans les pages ou pas.

    <meta name="robots" content="\{\{page.index\}\}INDEX,\{\{page.follow\}\}FOLLOW" />

Ici par exemple, lorsque l'on défini dans les billets ou les pages les variables `index`ou `follow` à `NO` cela va générer les meta `NOINDEX` ou `NOFOLLOW` respectivement.

## Conclusion

Avec toutes ces infos vous pouvez facilement ajouter des meta à vos pages pour améliorer le SEO. C'est simple et ce serait dommage de s'en priver !