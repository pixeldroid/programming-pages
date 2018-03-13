help_modal_init = function() {
  $('.ui.modal').modal({
    inverted: true
  });

  // set up shortut key sequence to toggle modal
  Mousetrap.bind('h', function() { $('#help').modal('toggle'); return false; });
};

$(help_modal_init);
