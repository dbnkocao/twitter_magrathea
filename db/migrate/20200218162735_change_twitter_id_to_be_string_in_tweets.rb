class ChangeTwitterIdToBeStringInTweets < ActiveRecord::Migration[6.0]
  def change
    change_column :tweets, :tweet_id, :string
  end
end
