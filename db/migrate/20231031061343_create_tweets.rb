class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :message
      t.string :user_name #後にusersモデルのデータベースと連携してそっちから名前を持ってくる
      t.integer :user_id

      t.timestamps
    end
  end
end
