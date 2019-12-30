class ApplicationController < ActionController::API
  include Authenticatable
  include ErrorResponseHandleable

  before_action :authenticate_user!

  # トークン生成済みのユーザーのみ認証する
  def authenticate_user!
    authenticate_user_from_token!
  end

  def success_res(status, message: nil, data: nil, meta: nil)
    render status: status, json: {
      status: status,
      message: message,
      data: data,
      meta: meta,
    }
  end

  def error_res(status, message: nil, err: nil)
    render status: status, json: {
      status: status,
      message: message,
      errors: [
        { message: err }
      ],
      data: nil
    }
  end

  def make_paginator_meta(obj)
    {
      total_pages: obj.total_pages,
      total_count: obj.total_count,
      size: obj.size,
      current_page: obj.current_page,
      next_page: obj.next_page,
      prev_page: obj.prev_page,
      is_first_page: obj.first_page?,
      is_last_page: obj.last_page?,
    }
  end

end
