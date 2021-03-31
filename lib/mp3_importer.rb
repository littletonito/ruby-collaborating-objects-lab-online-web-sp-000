
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    #a ||= b being equivalent to a = a || b 
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each{|f| Song.new_by_filename(f)}
  end
end
