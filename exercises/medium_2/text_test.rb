require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text'

class TextTest < Minitest::Test
  def setup 
    @text_file = File.open("sample_text.txt")
    @text_data = @text_file.read 
    @text = Text.new(@text_data)
  end

  def test_swap
    swapped_data = @text.swap('a', 'e') 
    assert_equal(@text_data.gsub('a', 'e'), swapped_data) 
  end

  def test_word_count 
    assert_equal 72, @text.word_count
  end


  def teardown 
    @text_file.close
  end
end


