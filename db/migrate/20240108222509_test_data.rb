class TestData < ActiveRecord::Migration[7.1]
  def change
    user1 = User.new(username: "User1", password: "123")
    user2 = User.new(username: "User2", password: "123")
    user3 = User.new(username: "User3", password: "123")

    user1.save
    user2.save
    user3.save

    Application.new(app_id: "app_id1", client_id: "client_id1", client_secret: "client_secret1", users_id: user1.id).save
    Application.new(app_id: "app_id2", client_id: "client_id2", client_secret: "client_secret2", users_id: user2.id).save
    Application.new(app_id: "app_id3", client_id: "client_id3", client_secret: "client_secret3", users_id: user3.id).save
  end
end
