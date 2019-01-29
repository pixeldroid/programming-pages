{% capture NL %}
{% endcapture%}
site_search_init = function() {
  var search_content = [
  {% for collection in site.collections %}
  {% unless collection.label == 'posts' %}
  {% for doc in collection.docs %}
    {% capture url %}{{ doc.url }}#/{{ collection.label | downcase }}/{% endcapture %}
    {% assign title = doc.title | default: doc.name %}
    {% assign category = doc.category | default: collection.label %}
    {% assign tags = doc.search_tags | default: "" %}
    {% assign description = doc.description | default: "" %}
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
  {% endunless %}
  {% endfor %}
  ];

  {% comment %} urls are auto-followed, so no callback needed {% endcomment %}
  $('#site-search').search({
    type: 'category',
    source: search_content,
    searchFields: [ 'title', 'description', 'tags' ],
    selectFirstResult: true,
  });

  {% comment %} set up shortut key for search input focus {% endcomment %}
  Mousetrap.bind('s', function() { $('#site-search .prompt').focus(); return false; });
};

$(site_search_init);
