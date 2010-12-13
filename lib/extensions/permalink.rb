module Permalink
  def generate_permalink
    if self.permalink.blank? && self.title
      self.permalink = self.title.gsub(" ", "-").gsub(/[^a-z\-]/i, "").squeeze("-").downcase
    end
  end
end
