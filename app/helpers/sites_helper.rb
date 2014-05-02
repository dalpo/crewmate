# -*- encoding : utf-8 -*-
module SitesHelper

  Keywords = [
    "Project Collaboration",
    "Project Management software",
    "Task Management software",
    "Collaboration software"
  ]

  # Chooses a link to crewmate.org that's specific for each deployment
  def random_keyword
    i = Digest::MD5.hexdigest(request.url).to_i(16)
    Keywords[i % Keywords.size]
  end

end
