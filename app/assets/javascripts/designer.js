$(function() {
  var popUuid = function() {
    if (window.designer_uuids.length < 95) {
      $.ajax({
        method: "GET",
        url: "/api/uuids/100",
        success: function(data) {
          window.designer_uuids = data.uuids;
        }
      })
    }
    
    return window.designer_uuids.pop();
  };
  
  var addDesignTableRows = function(data) {
    var tbody = $('#report-designs-table tbody');
    tbody.empty();
    for (var i in data) {
      var row = '<tr><td class="ids">' +
        data[i].id + '</td><td class="titles"><a class="design-links" href="/designer/' +
        data[i].id + '">' +
        data[i].title + '</a></td><td class="period-counts">' +
        data[i].periods.length + '</td><td class="edit-button-cell"><a href="/designer/' +
        data[i].id + '/edit" class="btn btn-info design-links">Edit</a>&nbsp;<button data-id="' +
        data[i].id + '" class="btn btn-danger design-delete-buttons">Delete</button></td></tr>';
      tbody.append(row);
    
      $('.design-links').on('click', function(event) {
        handlePushState(event.currentTarget.pathname);
        event.preventDefault();
      });
      $('.design-delete-buttons').on('click', handleDeleteDesign);

      $('#designs-show-section').hide();
      $('#designs-form-section').hide();
      $('#designs-list-section').show();
    }
  };
  
  var loadListPage = function(data) {
    $.ajax({
      method: "GET",
      url: "/api/designs",
      success: addDesignTableRows
    })
  };
  
  var loadShowPage = function(id) { 
    if (id) {
      $.ajax({
        method: "GET",
        url: "/api/designs/" + id,
        success: function(data) {
          $('#design-title-heading').html(data.title);
          $('#number-of-periods').html("Periods: " + data.periods.length.toString());
          $('#designs-form-section').hide();
          $('#designs-list-section').hide();
          $('#designs-show-section').show();
        }
      })
    }
  };
  
  var loadAddForm = function() {
    $('#designs-list-section').hide();
    $('#designs-show-section').hide();
    $('#design-form-heading').html("Add a new design");
    $('#design-id').val("");
    $('#design-title').val("");
    $('#designs-form-section').show();
  };
  
  var loadEditForm = function(id) {
    $.ajax({
      method: "GET",
      url: "/api/designs/" + id,
      success: function(data) {
        $('#design-form-heading').html("Edit this design");
        $('#design-id').val(id);
        $('#design-title').val(data.title);
        $('#designs-list-section').hide();
        $('#designs-form-section').show();
      }
    });
  };
  
  var handleDeleteDesign = function(event) {
    var id = event.currentTarget.dataset.id;
    
    if (id) {
      $.ajax({
        method: "DELETE",
        url: "/api/designs/" + id,
        success: function(data) {
          handlePushState("/designer");
        }
      })
    }
    
    event.preventDefault();
  };
  
  var handleFormSubmission = function(event) {
    var id = $('#design-id').val();
    var title = $('#design-title').val();
    
    if (id.length <= 0) {
      // It's a create
      id = popUuid();
    }
    
    $.ajax({
      method: "PUT",
      url: "/api/designs/" + id,
      data: {
        "design" : {
          "title": title
        }
      },
      success: function(data) {
        handlePushState("/designer");
        $('#design-id').val("");
        $('#design-title').val("");
      }
    })
    
    event.preventDefault();
  };
  
  var handlePushState = function(path) {
    var segments = path.split('/').slice(1);
    
    if (segments.length === 1) {
      loadListPage();
    } else if (segments.length === 3) {
      loadEditForm(segments[1]);
    } else if (segments[1] === 'add') {
      loadAddForm();
    } else {
      loadShowPage(segments[1]);
    }
    
    history.pushState({}, '', path);
  };
  
  // Add design form
  $('#design-form').on('submit', handleFormSubmission);
  $('a.designer-links').on('click', function(event) {
    handlePushState(event.currentTarget.pathname);
    event.preventDefault();
  });
  
  handlePushState(window.location.pathname);
  
});