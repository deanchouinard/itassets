class Office < ActiveRecord::Base
	belongs_to :company
	belongs_to :site
	has_many :users
	
	def self.load_sel_list
    self.find(:all).map {|of| ["#{of.code} #{of.description} | #{of.company.description}, #{of.site.city},
    #{of.site.state}", of.id]}
  end

  def self.display_str(id)
    of = self.find(id)
    "#{of.description} #{of.company.description}"
  end
end
