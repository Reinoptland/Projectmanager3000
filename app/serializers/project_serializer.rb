class ProjectSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :project_name, :project_active

end
