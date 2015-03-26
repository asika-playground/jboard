class Job < ActiveRecord::Base

    validates_presence_of :title, :company, :min_salary, :location, :expire
end
