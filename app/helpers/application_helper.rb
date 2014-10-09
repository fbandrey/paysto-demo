module ApplicationHelper

  def print_flash
    if flash[:success]
      content_tag(:div, flash[:success], class: 'alert alert-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'alert alert-danger')
    end
  end

end
