class Task < ActiveRecord::Base

  validates_presence_of :name
  default_scope :conditions => {:done => false}

end
