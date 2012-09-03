class HomeController < ApplicationController
  def index
    @all_coach = []
    CoachDetail.all.each do |each_coach|
      @all_coach.push(each_coach.name)
    end     
  end
end
