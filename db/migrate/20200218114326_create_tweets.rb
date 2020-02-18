class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.integer :tweet_id
      t.string :mensagem
      t.string :autor
      t.date :data_publicacao

      t.timestamps
    end
  end
end
