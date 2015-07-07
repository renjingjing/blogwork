// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require nested_form_fields
//= require_tree .
// # Listen on an element
// initializeSortable -> ($assetfile)
//   $assetfile.sortable()
//   $assetfile.on 'fields_added.nested_form_fields', (event, param) ->
//     console.log event.target # The added field
//     console.log $(this)      # $el
//
// # Listen on document
// $(document).on "fields_added.nested_form_fields", (event, param) ->
//   switch param.object_class
//     when "assetfile"
//       console.log "Assetfile object added"
//     else
//       console.log "INFO: Fields were successfully added, callback not handled."
