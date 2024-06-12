class UpdateTotalJob
  include Sidekiq::Job

  def perform(s_id)
    # Do something
    # puts "-------- #{s_id} --------"
    Student.update(s_id,:total => Score.where(student_id: s_id).sum(:score))
  end
end
