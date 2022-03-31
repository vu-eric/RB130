class TextAnalyzer
  def process
    file_data = File.read("sample_text.txt").split("\n")
    yield(file_data)
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |data|
  paragraphs = data.count("") + 1
  puts "#{paragraphs} paragraphs"
end

analyzer.process do |data|
  puts "#{data.size} lines"
end

analyzer.process do |data|
  words = data.join(" ").split.size
  puts "#{words} words"
end