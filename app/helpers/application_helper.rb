module ApplicationHelper

  def search_results_phrase
    phrase = ""
    if params[:query].present? || params[:location].present?
      phrase = "Results "
    end
    if params[:query].present?
      phrase += "for '#{params[:query]}'"
    end
    if params[:location].present?
      phrase += " in #{params[:location].split('-')[0].strip}"
    end
    if params[:query].present? || params[:location].present?
      phrase += ":"
    end
    return phrase
  end

end
