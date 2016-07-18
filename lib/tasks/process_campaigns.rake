desc "Process all campaigns and schedule sidekiq jobs"
task :process_campaigns => :environment do
  puts "Processing all Campaigns..."
    ProcessCampaignsWorker.new.perform
  puts "Done."
end
