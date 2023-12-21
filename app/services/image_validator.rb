class ImageValidator
  def initialize(image, user)
    @image = image
    @user = user
  end

  def valid?
    @user.errors.add(:avatar, 'should be less than 1MB') if @image.size > 1.megabyte
    @user.errors.add(:avatar, 'should be JPEG or PNG') unless @image.content_type.in?(%w(image/jpeg image/png))

    @user.errors.empty?
  end
end
