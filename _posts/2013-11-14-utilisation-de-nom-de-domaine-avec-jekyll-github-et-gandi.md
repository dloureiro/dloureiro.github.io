---
layout: post
title: "Utilisation de nom de domaine avec Jekyll, Github et Gandi"
description: ""
categories:
- web
tags:
- jekyll
- github
- gandi
- nom de domaine
date: 2013-11-14 13:08:26+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "Utilisation de nom de domaine avec #Jekyll, #Github et #Gandi"
---
{% include JB/setup %}

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/image_billet_jekyll-github-gandi.png" alt='Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/" + "http://krampstudio.com/images/github.png" + "http://gandi.net"'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/" + "http://krampstudio.com/images/github.png" + "http://gandi.net"</figcaption>
</figure>
</p>

Si vous souhaitez faire le choix de Jekyll et de Github pour monter un blog c'est bien. Si vous avez un nom de domaine chez Gandi et que vous voulez l'utiliser voici les étapes à suivre pour faire marcher tout ça ensemble !

<!-- *more* -->

**Remarque :** Les instructions qui sont données ici pour Gandi sont assez génériques et peuvent à priori être utilisées pour d'autres registars.

# Côté Jekyll

Côté Jekyll il n'y a pas grand chose à faire, il faut modifier l'url de production ``production_url`` pour mettre le nom de domaine que vous possédez chez Gandi. Pour cela cela donner ainsi :

    production_url : http://testdriventrekkie.com

Et c'est tout pour Jekyll !

# Côté Github

Côté Github, il faut ajouter un fichier CNAME qui contiendra uniquement le nom de domaine à utiliser. Pour moi par exemple il y a ceci :

    testdriventrekkie.com

Si jamais vous utilisez les Github Pages, c'est la même procédure.

Plus d'infos sur la page associée : [Github | Setting up a custom domain with Pages](https://help.github.com/articles/setting-up-a-custom-domain-with-pages)

# Côté Gandi

Si vous avez acquis un domaine chez Gandi, il est nécessaire d'utiliser l'outil de gestion de zones DNS. En mode "normal" (et pas le mode "expert") voici ce que cela donne. 

Vous allez devoir créer une nouvelle version du fichier de zone et indiquer dans les enregistrements de type **A** ayant pour nom "@" et "\*" (ce second est facultatif) l'adresse de la zone DNS de Github. La valeur à entrer est **204.232.175.78**.

Une fois que vous avez modifié ces éléments, il faut activer la nouvelle version du fichier de zone que vous venez de créer et attendre la propagation de l'information dans les DNS.

C'est tout !

Plus d'infos sur ces pages : 

 * [Github | Setting up a custom domain with Pages](https://help.github.com/articles/setting-up-a-custom-domain-with-pages)
 * [Stackoverflow | How to point domain to site hosted on github pages?](http://stackoverflow.com/questions/11849058/how-to-point-domain-to-site-hosted-on-github-pages)
 * [Gandi | A Records](http://wiki.gandi.net/dokuwiki/en/dns/zone/a-record)

# Conclusion

C'est aussi simple que ça et ça marche plutôt bien :)