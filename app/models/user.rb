class User < ActiveRecord::Base
  attr_accessible :address, :code, :email, :phone

  validates :phone, :uniqueness => { :case_sensitive => false }
  validates :code, :uniqueness => { :case_sensitive => false }
  validates :phone, :format => { :with => /\d{10}/,
                                 :message => "Must be 10 digits" }
  validates :code, :format => { :with => /[a-zA-Z0-9]{4,10}/,
                                :message => "Must be alphanumeric and 4-10 characters"}
end
