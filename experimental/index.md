---
layout: default
title: Home
description: AutoDIAL develops autonomous materials-discovery platforms, high-throughput experiments, and trustworthy AI at the University of Toronto.
---

<img src="{{ '/assets/images/Group_Picture_Fall_2026-640.webp' | relative_url }}" srcset="{{ '/assets/images/Group_Picture_Fall_2026-640.webp' | relative_url }} 640w, {{ '/assets/images/Group_Picture_Fall_2026-1200.webp' | relative_url }} 1200w" sizes="(max-width: 600px) 100vw, 500px" width="640" height="480" alt="Group Picture Fall 2026" decoding="async" fetchpriority="high" style="width:100%;max-width:500px;height:auto;display:block;margin:auto;">
<p style="text-align:center;">AutoDIAL Group Picture, Fall 2026</p>

We build tools, models, and systems that bridge the gap between theoretical predictions and experimental reality in materials science. Our focus is on developing autonomous platforms that are reproducible, reliable, and equitable—while prioritizing human insight, trust, and interpretability in the AI systems that guide them. We believe true progress lies not in blindly chasing performance, but in understanding why things work and sharing those insights openly. Our lab is a space for pragmatic scientists who value curiosity, clarity, and impact over hype.

# Research Areas

- High Throughput Experiments (HTE)
- Autonomous Laboratory Science
- Trustworthy AI
- Open Science

<section class="home-news" aria-labelledby="home-news-title">
  <div class="home-news__heading">
    <h1 id="home-news-title">Latest News</h1>
    <a href="{{ '/news' | relative_url }}">All news <span aria-hidden="true">→</span></a>
  </div>
  <div class="home-news__list">
    {% assign recent_news = site.news | sort: 'date' | reverse %}
    {% assign news_count = 0 %}
    {% for item in recent_news %}
      {% assign show_item = true %}
      {% if item.kind == 'publication' %}
        {% assign paper = site.data.publications | where: 'doi', item.doi | first %}
        {% unless paper and paper.type == 'journal' %}{% assign show_item = false %}{% endunless %}
      {% endif %}
      {% if show_item %}
        <article class="home-news__item">
          <time datetime="{{ item.month }}">{{ item.month | append: '-01' | date: '%B %Y' }}</time>
          <div>
            <h3><a href="{{ item.url | relative_url }}">{{ item.title | escape }}</a></h3>
            <p>{{ item.description | default: item.excerpt | default: item.content | strip_html | truncatewords: 28 | escape }}</p>
          </div>
        </article>
        {% assign news_count = news_count | plus: 1 %}
        {% if news_count == 3 %}{% break %}{% endif %}
      {% endif %}
    {% endfor %}
  </div>
</section>

# Contact

- Email: [jason.hattrick.simpers@utoronto.ca](mailto:jason.hattrick.simpers@utoronto.ca)

<!-- [Link to another page](./another-page.html). -->
