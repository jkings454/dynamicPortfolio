class Api::V1::ProjectGroupSerializer < ActiveModel::Serializer
  attributes :id, :title, :image_url, :description

  has_many :projects

  def created_at
  object.created_at.in_time_zone.iso8601 if object.created_at
  end

  def updated_at
    object.updated_at.in_time_zone.iso8601 if object.created_at
  end
end
