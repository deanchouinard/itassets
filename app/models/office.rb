class Office < ActiveRecord::Base
	belongs_to :company
	belongs_to :site
	has_many :users
	
	def self.load_sel_list
    self.find(:all).map {|of| ["#{of.site.code} #{of.company.description}", of.id]}
  end

  def self.display_str(id)
    of = self.find(id)
    "#{of.site.code} #{of.company.description}"
  end
end
