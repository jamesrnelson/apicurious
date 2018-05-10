class OtherGithubUser
  attr_reader :avatar, :name
  
  def initialize(attributes)
    @avatar = attributes[:avatar_url]
    @name = attributes[:login]
  end
end
