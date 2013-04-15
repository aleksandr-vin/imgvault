require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test "should not save image without valid title" do
    img = Image.new :author => "John"
    assert !img.save, "Saved the image without title"
    img.title = "123"
    assert !img.save, "Saved the image with small title"
    img.title = "A" * 141
    assert !img.save, "Saved the image with big title"
    img.title = "Valid title greater than 5 chars"
    assert img.save, "Not saved the full crafted image"
  end

  test "should not save image without author" do
    img = Image.new :title => "Valid title greater than 5 chars"
    assert !img.save, "Saved the image without author"
    img.author = "Jay"
    assert img.save, "Not saved the full crafted image"
  end
end
