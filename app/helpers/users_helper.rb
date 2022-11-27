module UsersHelper
  def back_to_users_link
    link_secondary t("back_to_index"), users_path if policy(:user).index?
  end

  def user_link(user)
    link_primary t("detail"), user if policy(user).show?
  end
end
