class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  require "date"

  def new
    @reports = Report.new
  end

  def create
    @reports = Report.new(reports_params)
    case params[:commit]
      when "出勤" ; @reports.start_of_work = Time.now
      when "開始" ; @reports.breakstart = Time.now
      when "終了" ; @reports.breakend = Time.now
      when "退勤" ; @reports.end_of_work = Time.now
      when "end_of_work" ; @reports.business_content
    end
    if @reports.save
      redirect_to root_path
    else
      render :index
    end  
  end

  private
  def reports_params
    params.permit(:start_of_work, :breakstart, :breakend, :end_of_work, :business_content).merge(user_id: current_user.id)
  end

end
