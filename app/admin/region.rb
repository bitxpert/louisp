ActiveAdmin.register Region do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
   permit_params do
    permitted = [:permitted, :territory, :population, :gdp_usd_billion, :gdp_person_usd, :ee_score, :first_language, :second_language ]
  #  permitted << :other if resource.something?
  #  permitted
    end


end
