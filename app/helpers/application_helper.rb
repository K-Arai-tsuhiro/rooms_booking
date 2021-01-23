module ApplicationHelper
  
  def avatar_url(profile)
    return profile.profile_photo.url(:icon) unless profile.profile_photo.blank?
    image_path("parts3.png")
  end
end
