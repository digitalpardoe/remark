module Unique
  def generate_uuid
    self.uuid = UUIDTools::UUID.random_create.to_s
  end
end