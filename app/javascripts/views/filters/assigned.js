(function () {

  var FilterAssigned = { tagName: 'select'
                       , id: 'filter_assigned'
                       , options_html: '<option value="">Anybody</option>'
                                     + '<option value="mine">My tasks</option>'
                                     + '<option value="unassigned">Unassigned</option>' };

  FilterAssigned.initialize = function (options) {
    var el = $(this.el);

    this.filters = options.filters;
    this.task_list = this.filters.task_list;
    el.update(this.options_html);
    _.bindAll(this, 'render');
    el.observe('change', FilterAssigned.filterTasks.bind(this));
  };

  FilterAssigned.render = function () {
    return this;
  };

  FilterAssigned.filterTasks = function () {
    this.filters.filter('assigned', this.el.value);
  };

  // expose
  Teambox.Views.FilterAssigned = Backbone.View.extend(FilterAssigned);

}());