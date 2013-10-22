class StudentController < ApplicationController
	def new #defines method for letting user create a new account
		@student = Student.new
	end

	def create #defines method for saving a new user into the db
		@student = Student.new(params[:student])
		if @student.save 
			render :success # displays the success html if the save is successful
		else render :fail # displays the fail html if the save is unsuccessful
		end
	end

	def list # defines method to extract all saved users in the db
		@students = Student.find(:all)
	end
	
end
