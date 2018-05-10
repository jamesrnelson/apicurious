class Repo
  attr_reader :owner, :description, :name, :language, :stargazers_count, :forks_count

  def initialize(attributes)
    @owner            = attributes[:owner][:login]
    @description      = attributes[:description].to_s
    @name             = attributes[:name]
    @language         = attributes[:language]
    @stargazers_count = attributes[:stargazers_count]
    @forks_count      = attributes[:forks_count]
  end
end
