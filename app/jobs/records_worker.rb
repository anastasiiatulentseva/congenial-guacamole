class RecordsWorker
  include Sidekiq::Worker

  def perform(record_id)
    record = Message.find_by_id(record_id)
    return unless record

    records_of_user = Message.processed.where(email: record.email)
    if records_of_user.present?
      last_record_ts_diff = record.created_at.to_i - records_of_user.order(created_at: :desc).last.created_at.to_i
      if last_record_ts_diff < 1
        record.delete
        return
      end

      record.amount = records_of_user.pluck(:amount).sum + record.amount
      records_of_user.delete_all
    end
    record.processed = true
    record.save
  end
end
