module PostsHelper
  def show_follow
    "#{current_user.profile.id}!=object.profile.id &&" +
      " !following(#{current_user.profile.id}, object.profile.followers)"
  end

  def show_following
    "#{current_user.profile.id}!=object.profile.id &&" +
      " following(#{current_user.profile.id}, object.profile.followers)"
  end
end
