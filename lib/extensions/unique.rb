module Unique
  def generate_uuid
    self.uuid = UUIDTools::UUID.timestamp_create.to_s
  end
end