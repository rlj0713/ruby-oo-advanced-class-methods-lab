class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(input)
    if self.find_by_name(input)
      self.find_by_name(input)
    else
      self.create_by_name(input)
    end
  end

  def self.alphabetical
    self.all.uniq.sort_by {|obj| obj.name}
  end
  
  def self.new_from_filename(input)
    song = self.create_by_name(input)
    song.name = song.name.gsub(".mp3", "").split(" - ")
    song.artist_name = song.name[0]
    song.name = song.name[1]
    song
  end

  def self.create_from_filename(filename)
    filename = self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end


end
