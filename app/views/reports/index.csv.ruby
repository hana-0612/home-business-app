require 'csv'

CSV.generate do |csv|
  column_reports = %w(名前 勤務開始 休憩開始 休憩終了 勤務終了 実施報告 )
  csv << column_reports
  @reports.each do |report|
    column_values = [
      report.user.employee_number,
      report.user.last_name,
      report.start_of_work,
      report.breakstart,
      report.breakend,
      report.end_of_work,
      report.business_content
    ]
    csv << column_values
  end
end