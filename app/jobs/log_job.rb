class LogJob < ApplicationJob
  queue_as :default

  def perform(*args)
    filename = File.join(Rails.root, "log/delayed_job.log")
    content  = Time.zone.now.strftime("%a %b %e %H:%M:%S %Z %Y")

    f = File.open(filename, "wb")
    f.write(content)
    f.close
  end
end
