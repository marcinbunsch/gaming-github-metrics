require 'date'
require 'json'

start = Date.parse('2023-08-06')
days = (start..Date.today).to_a

days.map do |day|
  date1 = day.to_time
  date2 = (day + 1).to_time
  time = Time.at((date2.to_f - date1.to_f) * rand + date1.to_f)
  timestr = time.strftime('%Y-%m-%dT%H:%M:%S.%L%z')

  system "echo '#{day}' >> README.md"
  system 'git add README.md'
  command = "GIT_AUTHOR_DATE='#{timestr}' GIT_COMMITTER_DATE='#{timestr}' git commit -m 'Changes on #{day}'"
  system command
end
