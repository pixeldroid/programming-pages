help_modal_init = function() {
  $('.ui.modal').modal({
    inverted: true
  });

  {% comment %} set up shortut key sequence to toggle modal {% endcomment %}
  Mousetrap.bind('h', function() { $('#site-help').modal('toggle'); return false; });
};

$(help_modal_init);
