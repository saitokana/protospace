class Memo < ActiveRecord::Base
	enum status: [:need, :leftover]
	validates_presence_of :text
end
