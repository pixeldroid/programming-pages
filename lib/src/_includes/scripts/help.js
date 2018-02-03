help_modal_init = function() {
  $('.ui.modal')
    .modal()
  ;

  // set up shortut key sequence to toggle modal
  Mousetrap.bind('?', function() { console.log('help requested'); $('#help').modal('toggle'); return false; });
};

$(help_modal_init);
