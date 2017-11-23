module ApplicationHelper

  def controller?(*controller)
    controller.include?(controller_name)
  end

  def action?(*action)
    action.include?(action_name)
  end

end
