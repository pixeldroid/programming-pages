collection_tabs_init = function() {
  $('#collection-tabs .item').tab({
    history: true,
    historyType: 'hash',
  });

  // set up shortut key sequences to change tabs
  {% for collection in site.collections %}
  {% unless collection.label == 'posts' %}
  {% capture label %}{{ collection.label | downcase }}{% endcapture %}
  {% capture key %}{{ label | split: '' | first }}{% endcapture %}
  Mousetrap.bind('g {{ key }}', function() { window.location.hash = '#/{{ label }}/'; return false; });
  {% endunless %}
  {% endfor %}
};

$(collection_tabs_init);
