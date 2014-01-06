# This migration comes from rez (originally 20140106010912)
class AddPhoneNumberToRezAddresses < ActiveRecord::Migration
  def change
    add_column :rez_addresses, :area_code, :text, limit: 3
    add_column :rez_addresses, :phone_number, :text, limit: 7
  end
end
