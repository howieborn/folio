class Contact
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :id, :name, :email, :subject, :message

  validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i },
                      :presence => true
  validates :name, :presence => true,
		   :length   => { :maximum => 50 }
  validates :message, :subject, :presence => true

  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end

  def read_attribute_for_validation(key)
    @attributes[key]
  end
 
  def to_key
  end

  def save
    if self.valid?
      ContactMailer.send_message(self).deliver!
      return true
    end
    return false
  end
  
  def persisted?
    false
  end
end
