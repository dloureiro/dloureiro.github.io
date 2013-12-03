---
layout: post
title: "Jekyll et les flux rss"
description: ""
categories:
- web
tags:
- jekyll
- rss
- disqus
date: 2013-12-03 18:38:38+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "#Jekyll et les #flux #rss"
---
{% include JB/setup %}

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

Un des éléments qui manquait aux thèmes de Jekyll-Bootstrap que j'ai pu voir était le support des flux rss. Voici comment j'y ai remédié.

<!-- *more* -->

Si l'on souhaite faciliter le suivi des billets qui peuvent être écrits, les flux rss sont une façon simple, rapide et supportée un peu de partout.

# Flux rss des billets

Le thème Jekyll Bootstrap que j'utilise ([hooligan](http://themes.jekyllbootstrap.com/preview/hooligan/) pour ceux que ça intéresse) ne fournit rien (en fait si, un flux atom, mais qui n'était pas détecté par feedly en l'occurence) et je trouvais que cela manquait.

Tout cela a ainsi abouti à ce fichier qui permet la génération de flux rss pour le site : [https://raw.github.com/dloureiro/dloureiro.github.io/source/feed.xml](https://raw.github.com/dloureiro/dloureiro.github.io/source/feed.xml)

J4ai en fait adapté ce qui est fourni par snaptortoise dans son dépôt [jekyll-rss-feeds](https://github.com/snaptortoise/jekyll-rss-feeds). J'ai repris et adapté la version feed.xml pour ne pas avoir à ajouter de variables dans le fichier `_config.yml` mais plutôt utiliser celles qui existent déjà.

# Flux rss des commentaires

Si comme moi vous utilisez [disqus](http://disqus.com/), il vous est aussi possible de récupérer les commentaires qui ont été postés sur vos billets à travers un flux rss que vous pouvez afficher.

Voici l'url du flux rss pour les commentaires de ce site : [http://dloureirogithub.disqus.com/latest.rss](http://dloureirogithub.disqus.com/latest.rss).

Pour vos propres besoins, vous n'avez qu'à modifier dloureirogithub par l'identifiant vous correspondant et c'est fini !