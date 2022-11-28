def configure_bullet
  Bullet.add_safelist type: :n_plus_one_query, class_name: "User", association: :setting
end
