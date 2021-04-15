# app/helpers/user_helper.rb

module UserValidations
  include ActiveSupport::Concern

  INVALID = "Missing/Invalid".freeze
  def validations
    fn_same?(params[:first_name])         &&
      ln_same?(params[:last_name])        &&
      college_same?(params[:college_id])  &&
      exam_same?(params[:exam_id])        &&
      time_same?(params[:exam_id], params[:start_time])
  end

  def fn_same?(fn)
    @errors << "#{INVALID} First Name" if fn.nil? || @user.first_name != fn  # This one is mandatory
    @errors.empty?
  end

  def ln_same?(ln)
    @errors << "#{INVALID} Last Name" if ln.nil? || @user.last_name != ln   # This one is mandatory
    @errors.empty?
  end

  def college_same?(id)
    @errors << "#{INVALID} College ID" if id.nil? || @user.college.id != id
    @errors.empty?
  end

  def exam_same?(id)
    @errors << "#{INVALID} Exam ID" if id.nil? || !@user.college.exams.pluck(:id).include?(id)
    @errors.empty?
  end

  def time_same?(exam_id, start)
    @errors << "#{INVALID} Start Time" if start.nil? || !found_time_slot(exam_id, start)
    @errors.empty?
  end

  def found_time_slot(exam_id, start)
    found = false
    Exam.find(exam_id).exam_windows.each { |ew|
      found ||= ew.within_time_slot(start)
    }
    found
  end
end
