class AddQualificationExtraDescriptionAndInstitutionToQualification < ActiveRecord::Migration
  def change
    rename_column :qualifications, :organisation, :institution
    add_column :qualifications, :qualification_extra_description, :string
  end
end
