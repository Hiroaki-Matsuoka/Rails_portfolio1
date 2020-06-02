AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Item.create(name: "熱狂のWebマーケティング", price: 1500, user_id: 1)
Item.create(name: "0秒シンキング", price: 1200, user_id: 1)
Item.create(name: "死ぬこと以外、けっこう平気。", price: 1300, user_id: 1)

# test@example.com password
