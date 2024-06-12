class UpdateRankJob
  include Sidekiq::Job

  def perform(s_id,rank)
    # Do something
    # puts "------------  #{s_id} - #{rank}  ---------------"
    Score.where(student_id: s_id).update(rank: rank)
  end
end
