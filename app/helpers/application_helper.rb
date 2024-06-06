module ApplicationHelper

  def date_to_spans(date)
    date.split(" ").each_with_index.map do |date_part, index|
      if index == 1
        content_tag(:span, date_part, class: "date-span-day")
      else
        content_tag(:span, date_part)
      end
    end.join.html_safe
  end
end
