module ThumbnailHelper
  include Rails.application.routes.url_helpers

  def make_thumbnail_url(thumbnail)
    if thumbnail.attached?
      url_for(thumbnail)
    else
      root_url + "images/noimage.png"
    end
  end
end