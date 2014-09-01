class EntertainmentsDatatable
  delegate :params, :h,:current_user, :link_to, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Entertainment.count,
      iTotalDisplayRecords: entertainments.total_entries,
      aaData: data
    }
  end

private

  def data
    entertainments.map do |entertainment|
      [
        #link_to(entertainment.country, url_options = {}, html_options = {class: "first-column"}),
        entertainment.id,
        entertainment.name,
        entertainment.state_or_province,
        entertainment.url,
        entertainment.phone_number,
        link_to("edit", "/entertainments/#{entertainment.id}/edit", method: :get)
      ]
    end
  end

  def entertainments
    @entertainments ||= fetch_entertainments
  end

  def fetch_entertainments
    if current_user.role.present?
      if current_user.role.name == "Division Director"
        entertainments = Entertainments.order("#{sort_column} #{sort_direction}")
      else
        entertainments = current_user.entertainments.order("#{sort_column} #{sort_direction}")
      end
    else
      entertainments = current_user.entertainments.order("#{sort_column} #{sort_direction}")  
    end
    entertainments = entertainments.page(page).per_page(per_page)
    if params[:sSearch].present?
      entertainments = entertainments.where("name like :search or country like :search or state_or_province like :search  or url like :search or phone_number like :search", search: "%#{params[:sSearch]}%")
    end
    entertainments
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name country state_or_province url  phone_number]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end