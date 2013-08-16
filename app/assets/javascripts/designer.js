$(function() {
  var loadDesignTable = function(data) {
    var tbody = $('#report-designs-table tbody');
    for (var i in data) {
      var row = '<tr><td class="ids">' +
        data[i].id + '</td><td class="titles">' +
        data[i].title + '</td><td class="period-counts">' +
        data[i].periods.length + '</td></tr>';
      tbody.append(row);
    }
  };
  
  $.ajax({
    method: "GET",
    url: "/api/designs",
    success: loadDesignTable
  })
});