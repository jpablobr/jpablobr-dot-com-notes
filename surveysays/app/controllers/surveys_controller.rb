class SurveysController < ApplicationController
  include  RestControllerMethods
  
  def new
    @survey = Survey.new
    3.times do
      question = @survey.questions.build
      4.times { question.answers.build }
    end
  end
end
