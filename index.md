---
layout: page
title: 那些年我们一起学的韩语
---
{% include JB/setup %}

<section>
  <h1>Recent Posts</h1>
  <ul id="recent_posts">
    {% for post in site.posts limit: 150 %}
      <li class="post">
        <a href="{{BASE_PATH}}{{ root_url }}{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
  </ul>
</section>

