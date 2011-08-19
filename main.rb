Dir.glob('lib/*.rb').each do |reqfile|
  require reqfile
end

file = ARGV[0]

fr = FileReader.new file
fr.process_file
