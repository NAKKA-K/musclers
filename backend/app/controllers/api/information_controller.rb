module Api
  class InformationController < ApplicationController
    def index
      data = ActiveModel::Serializer::CollectionSerializer.new(
        Information.where(user_id: current_user.id),
        each_serializer: InformationSerializer
      ).as_json

      p data

      success_res(200, message: '取得しました', data: data) and return
    end
  end
end
