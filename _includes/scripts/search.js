{% capture NL %}
{% endcapture%}

{% assign searchable_docs = site.pages | concat: site.documents | where_exp:'it','it.title.size > 0' %}

site_search_init = function() {
  var search_content = [
  {% for doc in searchable_docs %}
    {% assign collection = doc.collection %}
    {% if collection == 'posts' %}{% continue %}{% endif %}
    {% assign url = doc.url %}{% if collection.size > 0 %}{% capture url %}{{ doc.url }}#/{{ collection | downcase }}/{% endcapture %}{% endif %}
    {% assign title = doc.title | default: doc.name %}
    {% assign category = doc.category | default: collection | default: '?' %}
    {% assign tags = doc.search_tags %}
    {% assign description = doc.description %}
    {% comment %} placing string values in single quotes, so need to escape any within the string {% endcomment %}
    {% if title == "'" %}{% assign title = "\'" %} {% comment %} allow title to be single char, assume other fields are not {% endcomment %}
    {% elsif title contains "'" %}{% assign title = title | split: "'" | join: "\'" %}
    {% endif %}
    {% if tags contains "'" %}{% assign tags = tags | split: "'" | join: "\'" %}{% endif %}
    {% if description.size > 0 %}{% assign description = description | split: NL | first | truncatewords: 7 | markdownify | rstrip %}{% endif %}
    {% if description contains "'" %}{% assign description = description | split: "'" | join: "\'" %}{% endif %}
    {% capture tags %}{% if tags.size > 0 %}, tags: '{{ tags }}'{% endif %}{% endcapture %}
    {% capture desc %}{% if description.size > 0 %}, description: '{{ description }}'{% endif %}{% endcapture %}
    { title: '{{ title }}', category: '{{ category }}'{{ tags }}{{ desc }}, url: '{{ site.baseurl }}{{ url }}' },
  {% endfor %}
  ];

  {% comment %} urls are auto-followed, so no callback needed {% endcomment %}
  $('#site-search').search({
    type: 'category',
    source: search_content,
    searchFields: [ 'title', 'tags', 'category', 'description' ],
    selectFirstResult: true,
  });

  {% comment %} set up shortut key for search input focus {% endcomment %}
  Mousetrap.bind('s', function() { $('#site-search .prompt').focus(); return false; });
};

$(site_search_init);
