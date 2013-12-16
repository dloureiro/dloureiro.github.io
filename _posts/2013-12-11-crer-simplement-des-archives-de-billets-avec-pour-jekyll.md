---
layout: post
title: "Créer simplement des archives de billets pour #Jekyll"
description: ""
categories:
- web
tags:
- jekyll
- blog
- archives
- jekyll_ext
date: 2013-12-16 14:00:00+01:00
lang: fr
comments: true
sharing: true
author : David Loureiro
social: "Créer simplement des #archives de #billets pour #Jekyll"
---
{% include JB/setup %}

<p>
<figure style="background-color:white;">
<img style="background-color:white; display:block; margin-left:auto; margin-right:auto; width:300px" src="http://testdriventrekkie.com/assets/images/jekyll_logo_white.png" alt='Crédits : http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/'/>
<figcaption style="color:black; margin-top:auto; position:relative; bottom:0">Crédits : "http://jeffskinnerbox.me/2013/09/01/im-moving-so-i-can-blog-with-ipython-notebook/"</figcaption>
</figure>
</p>

Des archives de billets des blog et une liste par date dans une colonne, sont des éléments de base pour un blog. Voici comment les mettre en place simplement.

<!-- *more* -->

# Introduction et problème à traiter

J'ai parcouru un certain nombre de billets, de repository github ou de gist qui décrivent comment mettre en place des archives pour des blogs ou sites basés sur Jekyll.

La plupart se focalisent sur la partie "page d'archives". Sauf que j'ai aussi le besoin de pouvoir lister, par mois par exemple, le nombre de billets et d'éventuellement rediriger vers les pages mensuelles d'archives.

# La solution

La solution que j'ai trouvé est basée sur celle qu'a mis en place Richard Huang et qu'il décrit sur son billet : [Migrate Custom Blog to Jekyll and Disqus](http://blog.huangzhimin.com/2011/01/20/migrate-custom-blog-to-jekyll-and-disqus/).

Elle est basée sur l'usage de [jekyll_ext](https://github.com/rfelix/jekyll_ext) qui est un ensemble d'extension pour jekyll permettant, apparemment, de le rendre plus flexible sans modifier la structure du code. En fait il s'agit avant tout d'un système d'injection de dépendances.

Le problème avec ça, c'est que ce n'est pas déployable chez github, il faut donc faire la compilation du blog chez soi et ensuite pousser la version compilée chez github. J'explique la manière de le faire sur le billet de blog suivant : [Supporter les plugins Jekyll avec Github](http://testdriventrekkie.com/web/2013/11/29/supporter-les-plugins-jekyll-avec-github/).

Ainsi vous n'avez qu'à installer *jekyll_ext* comme expliqué sur le repo correspondant et utiliser `ejekyll` au lien de `jekyll` pour tout ce qui touche à la compilation, etc.

## La section d'archive dans la barre latérale

Il suffit d'ajouter le code suivant à votre `default.html` : 

```html
{%raw %}
<ul>
  {% for monthly_archive in site.monthly_archives reversed %}
  <li>
    <a href="{{ site.baseurl }}/{{ monthly_archive.url }}">{{ monthly_archive.name }}</a> ({{ monthly_archive.posts | size }} posts)
  </li>
  {% endfor %}
</ul>
{% endraw %}
```

## La page d'archive pour les billets de l'année

```html
{% raw %}
---
layout: page
title: Archives
---

<h1>{{ page.year }}</h1>

{% for m in (1..12) reversed %}
  {% if site.collated_posts[page.year][m] %}
    <h3>{{ m | to_month }}</h3>
    <ul>
    {% for d in (1..31) reversed %}
      {% if site.collated_posts[page.year][m][d] %}
        {% for p in site.collated_posts[page.year][m][d] reversed %}
          <li><a href='{{ p.url }}'>{{ p.title }}</a></li>
        {% endfor %}
      {% endif %}
    {% endfor %}
    </ul>
  {% endif %}
{% endfor %}

{% endraw %}
```

## La page d'archive pour les billets d'un mois

```html
{% raw %}
---
layout: page
title: Archives
---

<h1>{{ page.month | to_month }} {{ page.year }}</h1>
<ul>
  {% for d in (1..31) reversed %}
    {% if site.collated_posts[page.year][page.month][d] %}
      {% for p in site.collated_posts[page.year][page.month][d] reversed %}
        <li><a href='{{ p.url }}'>{{ p.title }}</a></li>
      {% endfor %}
    {% endif %}
  {% endfor %}
</ul>

{% endraw %}
```

## La page d'archive pour les billets d'un jour

```html
{% raw %}
---
layout: page
title: Archives
---
 
<h1>{{ page.month | to_month }} {{ page.day }}, {{ page.year }}</h1>
<ul>
  {% for p in site.collated_posts[page.year][page.month][page.day] reversed %}
    <li><a href='{{ p.url }}'>{{ p.title }}</a></li>
  {% endfor %}
</ul>

{% endraw %}
```

# Conclusion

C'est donc finalement plutôt simple d'arriver à mettre en place des archives pour ses billets :)