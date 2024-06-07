module ApplicationHelper

  def date_to_spans(date)
    date.split(" ").each_with_index.map do |date_part, index|
      if index == 1
        content_tag(:button, date_part, class: "date-span-day")
      elsif index == 0 || index == 2
        content_tag(:button, date_part, class: "hide-button")
      end
    end.join.html_safe
  end
end
