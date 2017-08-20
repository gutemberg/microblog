module ApplicationHelper
  def th_ng_sort(title, value)
    command_sort = "sortObjects('#{value}', sorting.order)"
    ng_class = "sorting.sort_by == '#{value}' ? 'text-underline' : ''"
    ng_if = "sorting.sort_by == '#{value}'"
    _class = "glyphicon glyphicon-chevron-{{order}}"

    value = "<th ng-click=\"#{command_sort}\" ng-class=\"#{ng_class}\" class='col-md-3'>" +
      " #{title}<span ng-if=\"#{ng_if}\" class=\"#{_class}\" aria-hidden=\"true\"></span></th>"

    value.html_safe
  end
end
