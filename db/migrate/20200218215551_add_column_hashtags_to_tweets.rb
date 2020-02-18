class AddColumnHashtagsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :hashtags, :text, array: true, default: []
  end
end
