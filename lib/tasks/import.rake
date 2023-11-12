require 'roo'

namespace :import do
  desc "Import data from an Excel file"
  task import_data: :environment do
    filename = 'Dummier_data.xlsx' # Update this to your actual file path
    file_path = Rails.root.join('lib', 'assets', filename)
    spreadsheet = Roo::Spreadsheet.open(file_path.to_s)

    # Assuming that the first row contains the group name and the rest are field names
    group_name = spreadsheet.row(1).first
    field_headers = spreadsheet.row(1)[1..-1] # All headers except the first one
    
    # Find or create the group based on the group name
    group = Group.find_or_create_by!(group_name: group_name)

    # Store field ids in a hash to avoid repeated database lookups
    field_ids = field_headers.map do |header|
      field = Field.find_or_create_by!(field_name: header)
      [header, field.id]
    end.to_h

    # Starting from the second row, as the first row contains headers
    (2..spreadsheet.last_row).each do |i|
      row = spreadsheet.row(i)
      
      # Create data entries for each field value
      field_headers.each_with_index do |header, index|
        Data.create!(
          group_id: group.id,
          field_id: field_ids[header],
          data_value: row[index + 1] # +1 because row includes the group name
        )
      end
    end
  end
end
