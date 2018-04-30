class Site::Profile::AdsController < Site::ProfileController
  def index
    @ads = Ad.of_the(current_member)
  end
end
