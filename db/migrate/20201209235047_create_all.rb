class CreateAll < ActiveRecord::Migration[5.2]
  def change
      create_table "active_storage_attachments", force: :cascade do |t|
        t.string "name", null: false
        t.string "record_type", null: false
        t.bigint "record_id", null: false
        t.bigint "blob_id", null: false
        t.datetime "created_at", null: false
        t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
        t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
      end
    
      create_table "active_storage_blobs", force: :cascade do |t|
        t.string "key", null: false
        t.string "filename", null: false
        t.string "content_type"
        t.text "metadata"
        t.bigint "byte_size", null: false
        t.string "checksum", null: false
        t.datetime "created_at", null: false
        t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
      end
    
      create_table "api_users", force: :cascade do |t|
        t.integer "user_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.integer "api_id"
      end
    
      create_table "apis", force: :cascade do |t|
        t.integer "sender_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.string "json"
      end
    
      create_table "friend_requests", id: false, force: :cascade do |t|
        t.integer "user_id"
        t.integer "friend_user_id"
        t.index ["friend_user_id", "user_id"], name: "index_friend_requests_on_friend_user_id_and_user_id", unique: true
        t.index ["user_id", "friend_user_id"], name: "index_friend_requests_on_user_id_and_friend_user_id", unique: true
      end
    
      create_table "friendships", id: false, force: :cascade do |t|
        t.integer "user_id"
        t.integer "friend_user_id"
        t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true
        t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true
      end
    
      create_table "liked_restaurants", force: :cascade do |t|
        t.bigint "restaurant_id"
        t.bigint "winder_id"
        t.index ["restaurant_id"], name: "index_liked_restaurants_on_restaurant_id"
      end
    
      create_table "matches", force: :cascade do |t|
        t.bigint "user_id"
        t.bigint "restaurant_id"
        t.integer "sender_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["restaurant_id"], name: "index_matches_on_restaurant_id"
        t.index ["user_id"], name: "index_matches_on_user_id"
      end
    
      create_table "messages", force: :cascade do |t|
        t.string "body"
        t.integer "sender_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end
    
      create_table "recipients", force: :cascade do |t|
        t.string "message_id"
        t.integer "user_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
      end
    
      create_table "restaurants", force: :cascade do |t|
        t.string "name"
        t.integer "zomato_id"
        t.string "address"
        t.string "site"
      end
    
      create_table "users", force: :cascade do |t|
        t.string "email", default: "", null: false
        t.string "encrypted_password", default: "", null: false
        t.string "reset_password_token"
        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.string "name"
        t.string "bio"
        t.string "city"
        t.index ["email"], name: "index_users_on_email", unique: true
        t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      end
    
      create_table "winders", force: :cascade do |t|
        t.bigint "api_id"
        t.bigint "user_id"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        t.index ["api_id"], name: "index_winders_on_api_id"
        t.index ["user_id"], name: "index_winders_on_user_id"
      end
    
      add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
    end
  end

