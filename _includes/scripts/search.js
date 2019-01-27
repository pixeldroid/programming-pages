site_search_init = function() {
  var search_content = [
  {% for collection in site.collections %}
  {% unless collection.label == 'posts' %}
  {% for doc in collection.docs %}
    {% capture url %}{{ doc.url }}#/{{ collection.label | downcase }}/{% endcapture %}
    { title: '{{ doc.title }}', url: '{{ site.baseurl }}{{ url }}' },
  {% endfor %}
  {% endunless %}
  {% endfor %}
  ];

  {% comment %} urls are auto-followed, so no callback needed {% endcomment %}
  $('#site-search').search({
    source: search_content,
    selectFirstResult: true,
  });

  {% comment %} set up shortut key for search input focus {% endcomment %}
  Mousetrap.bind('s', function() { $( '#site-search .prompt' ).focus(); return false; });
};

$(site_search_init);
