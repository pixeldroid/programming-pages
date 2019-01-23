set_indices_scrolltop = function() {
  // look for active item and scroll it into view (set by render_indices.liquid)
  var active_item = $('#active-page-index').first();
  if (active_item.length < 1) return;

  var y = active_item.position().top;
  $('#sidebar-fixed').scrollTop(y);
}

collection_tabs_init = function() {
  $('#collection-tabs .item').tab({
    history: true,
    historyType: 'hash',
    onFirstLoad: set_indices_scrolltop,
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
