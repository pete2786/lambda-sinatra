require 'active_model'

class Test
  include ActiveModel::Model
  attr_accessor :thing

  validates :thing, presence: true

  def to_h
    {
      errors: errors.full_messages,
      thing: thing
    }
  end
end
