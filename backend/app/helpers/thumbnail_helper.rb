module ThumbnailHelper
  include Rails.application.routes.url_helpers

  def make_thumbnail_url(thumbnail)
    if thumbnail.attached?
      url_for(thumbnail)
    else
      "https://elasticbeanstalk-ap-northeast-1-156811864214.s3-ap-northeast-1.amazonaws.com/noimage.png"
    end
  end
end