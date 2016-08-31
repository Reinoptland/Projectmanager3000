class TodoSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :completed, :url

  def url
    todo_url(object)
  end
end
