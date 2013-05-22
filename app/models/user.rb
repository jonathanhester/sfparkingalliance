# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  phone      :string(255)
#  code       :string(255)
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  license    :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :address, :code, :email, :phone, :license

  validates :phone, :uniqueness => { :case_sensitive => false }
  validates :code, :uniqueness => { :case_sensitive => false }
  validates :phone, :format => { :with => /\d{10}/,
                                 :message => "Must be 10 digits" }
  validates :code, :format => { :with => /[a-zA-Z0-9]{4,10}/,
                                :message => "Must be alphanumeric and 4-10 characters"}
  validates :license, :format => { :with => /[a-zA-Z0-9]{4,10}/,
                                   :allow_blank => true,
                                   :message => "Must be alphanumeric and 4-10 characters"}

end
