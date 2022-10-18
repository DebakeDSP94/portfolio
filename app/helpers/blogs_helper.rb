module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}", width: 60
  end

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

  def blog_status_color(blog)
    'color: red' if blog.draft?
  end
end
