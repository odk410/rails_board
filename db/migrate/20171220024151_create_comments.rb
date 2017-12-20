class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :post_id  #많은 쪽에서 적은 쪽의 정보를 갖고 있어야 한다.
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
