{%- extends "_layout.swig" -%}
{%- import '_macro/post.swig' as post_template -%}
{%- import '_macro/archive.swig' as archive_template -%}

{%- block title -%} {{ config.title }} {%- endblock -%}

{%- block content -%}
  {%- set mode = theme.mode.toLowerCase() -%}
  <section id="cv">
    <h1>About Me</h1>
    <ul class="skills">
      <li>
        🖥  目前工作语言:
        {%- for language in theme.cv.languages -%}
         <i> {{ language }}{%- if !(loop.last) -%},{%- endif -%}</i>
        {%- endfor -%}
      </li>
      <li>📮 <em><a href=mailto: {{theme.cv.email }}>{{theme.cv.email}}</a></em></li>
    </ul>
  </section>

  <section id="posts" class="posts">
    {%- if mode == 'default' -%}
      {%- for post in page.posts -%}
        {{ post_template.render(post) }}
      {%- endfor -%}
      {%- include "_partial/pagination.swig" -%}
    {%- else -%}
      {{ archive_template.render() }}
    {%- endif -%}
  </section>
{%- endblock -%}
