# == Schema Information
#
# Table name: tapes
#
#  id         :integer          not null, primary key
#  label      :string(20)
#  created_at :datetime
#  updated_at :datetime
#

class Tape < ActiveRecord::Base
  has_many :tape_moves
  
  def self.load_sel_list
    self.find(:all).map {|ta| ["#{ta.label}", ta.id]}
  end
end
