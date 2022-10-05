module BlogsHelper
  def flash_class(level)
    case level.to_sym
    when :notice
      'bg-primary'
    when :success
      'bg-success'
    when :alert
      'bg-warning'
    when :error
      'bg-danger'
    else
      'bg-info'
    end
  end
end
