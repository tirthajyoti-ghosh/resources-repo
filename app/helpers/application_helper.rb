module ApplicationHelper
  def display_vote_for(resource, user)
    vote_count = if resource.votes_count.nil?
                   0
                 else
                   resource.votes_count
                 end
    
    if user.nil?
      content_tag(:p, class: 'voted') do
        "<i class='far fa-heart'></i> #{vote_count}".html_safe
      end
    else
      vote_status = Resource.already_voted?(resource, user.id)    

      if vote_status
        content_tag(:p, class: 'voted') do
          "<i class='fas fa-heart'></i> #{vote_count}".html_safe
        end
      else
        link_to(resource_votes_path(resource), method: :post, class: 'vote') do
          "<i class='far fa-heart'></i> #{vote_count}".html_safe
        end
      end
    end
  end
end
