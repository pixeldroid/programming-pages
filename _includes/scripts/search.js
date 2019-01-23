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

  // urls are auto-followed, so no callback needed
  $('#site-search').search({
    source: search_content,
    selectFirstResult: true,
  });

  // set up shortut key for search input focus
  Mousetrap.bind('s', function() { $( '#site-search .prompt' ).focus(); return false; });
};

$(site_search_init);
