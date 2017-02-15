module PerformancesHelper
  def get_youtube_id(url)
    YouTubeAddy.extract_video_id(url)
  end
end
