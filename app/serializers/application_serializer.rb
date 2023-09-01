class ApplicationSerializer < ActiveModel::Serializer
  type :data

  def id
    object.try(:hashid)
  end
end
