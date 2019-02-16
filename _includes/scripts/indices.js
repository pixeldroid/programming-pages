set_indices_scrolltop = function() {
  {% comment %} look for active item and scroll it into view (set by render_indices.liquid) {% endcomment %}
  var active_item = $('#active-page-index').first();
  if (active_item.length < 1) return;

  var y = active_item.position().top - 50; {% comment %} an arbitrary amount below the sidebar-collection-tabs element {% endcomment %}
  $('#sidebar-fixed').scrollTop(y);
}

collection_tabs_init = function() {
  $('#sidebar-collection-tabs .item').tab({
    history: true,
    historyType: 'hash',
    onFirstLoad: set_indices_scrolltop,
  });

  {% comment %} set up shortut key sequences to change tabs {% endcomment %}
  {% for collection in site.collections %}
  {% unless collection.label == 'posts' %}
  {% capture label %}{{ collection.label | downcase }}{% endcapture %}
  {% capture key %}{{ label | split: '' | first }}{% endcapture %}
  Mousetrap.bind('g {{ key }}', function() { window.location.hash = '#/{{ label }}/'; return false; });
  {% endunless %}
  {% endfor %}
};

$(collection_tabs_init);
