class Tape < ActiveRecord::Base
  has_many :tape_moves
  
  def self.load_sel_list
    self.find(:all).map {|ta| ["#{ta.label}", ta.id]}
  end
end
