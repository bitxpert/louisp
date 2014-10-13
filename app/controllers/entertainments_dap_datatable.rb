class EntertainmentsDapDatatable
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
          entertainment.city,
          link_to(entertainment.url, entertainment.url),
          entertainment.email,
          entertainment.representative_name,
          link_to("edit", "/entertainments/#{entertainment.id}/edit_dap", method: :get)
        ]
      end
  end

  def entertainments
    @entertainments ||= fetch_entertainments
  end

  def fetch_entertainments
    entertainments = Entertainment.joins(:user).where("users.referrer" => current_user.user_main_id)
      
    entertainments = entertainments.page(page).per_page(per_page)
    if params[:sSearch].present?
      entertainments = entertainments.where("name ilike :search or country ilike :search or state_or_province ilike :search  or url ilike :search or phone_number ilike :search", search: "%#{params[:sSearch]}%")
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