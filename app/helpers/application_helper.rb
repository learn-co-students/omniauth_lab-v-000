module ApplicationHelper

  def render_info(user)
    if !user.nil?
      # raise params.inspect
      content_tag("p", user.name)
      content_tag("p", user.uid)
      content_tag("p", user.email)
      image_tag(user.image)
    end
  end
end
