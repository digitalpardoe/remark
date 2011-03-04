require 'spec_helper'

class SimulatedUpload
  attr_accessor :original_filename, :file_contents, :content_type
  
  def read
    @file_contents
  end
end

describe Document do
  before(:each) do
    @upload = SimulatedUpload.new
    @upload.original_filename = File.expand_path(File.join(File.dirname(__FILE__), 'ability_spec.rb'))
    @upload.content_type = "text/plain"
    @upload.file_contents = File.open(@upload.original_filename, "r").read
    
    @document = Document.new
    @document.document = @upload
    
    @duplicate = Document.new
    @duplicate.document = @upload
  end
  
  after(:each) do
    Document.all.each do |document|
      document.destroy
    end
  end
  
  it "stores a valid document" do
    @document.save!
  end
  
  it "changes the name to prevent duplication" do
    @document.save!
    @duplicate.save!
    
    @duplicate.name.should == "ability_spec-1"
  end
  
  it "checks to see if the document is an image" do
    @document.save!
    @document.image?.should be false
  end
end
