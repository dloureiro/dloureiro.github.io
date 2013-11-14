---
layout: post
title: "Ajouter un flux RSS à son blog Jekyll"
description: ""
categories:
- web
tags:
- jekyll
- rss
date: 2013-11-14 14:08:58+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "Ajouter un flux #RSS à son blog #Jekyll"
---
{% include JB/setup %}

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

De base il n'y a pas de flux RSS avec une install de Jekyll bootstrap, voici comment y remédier !

Vous pouvez retrouver un fichier ``feed.xml`` qui peut servir de base sur le repository Github [snaptortoise/jekyll-rss-feeds](https://github.com/snaptortoise/jekyll-rss-feeds).

Ce fichier est tout prêt pour être utilisé sur une install de Jekyll de base. Je l'ai simplement adapté pour éviter d'avoir à ajouter dans le fichier de configuration des variables qui seraient en doublons de ce qui existe déjà.

Notamment l'utilisation de :
 
 * ``site.production_url`` au lieu de ``site.url``
 * ``site.title`` au lieu de ``site.name``
 * ``site.tagline`` au lieu de ``site.description``

Si vous ne voulez pas vous embêter, vous pouvez récupérer ma version [ici](https://github.com/dloureiro/dloureiro.github.io/blob/master/feed.xml). Vous cliquez sur "Raw", clique-droit, "enregistrez-sous ..." et vous collez ça à la racine de votre Jekyll.

C'est tout !