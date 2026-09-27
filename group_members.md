---
layout: default
title: Group Members and Alumni
---

<link rel="stylesheet" href="{{ '/assets/css/group-members.css' | relative_url }}">

<h1>Group Members and Alumni</h1>

{% for section in site.data.members.sections %}
{% include member-section.html section=section %}
{% endfor %}

{% for section in site.data.members.sections %}
{% for member in section.members %}
{% include member-dialog.html member=member %}
{% endfor %}
{% endfor %}

<script src="{{ '/assets/js/group-members.js' | relative_url }}" defer></script>
