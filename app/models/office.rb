class Office < ActiveRecord::Base
	belongs_to :company
	belongs_to :site
end
