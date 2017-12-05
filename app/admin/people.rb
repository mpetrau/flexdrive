ActiveAdmin.register Person do

  # whitelisting params for updating in the form. Including nested resources for Person.
  permit_params :surName, :firstName, :salutation, :firstNameInitials, :birthDate,
    emails_attributes: [:id, :emailAddress, :_destroy],
    address_attributes: [:id, :_destroy, :addressType, :buildingName, :streetName, :streetNumber, :streetNumberSuffix, :postalCode, :city, :province, :country],
    telephones_attributes: [:id, :_destroy, :telephoneNumber]

  # Form for Editing a person. Needs to be moved intl a partial later
  form do |f|

      f.inputs "Details" do
        input :salutation, as: :radio, collection: %w(Dhr. Mevr.)
        input :firstNameInitials
        input :firstName
        input :surName
        input :birthDate, as: :datepicker

      end

      f.inputs "Emails" do
        f.has_many :emails, heading: false, allow_destroy: true do |a|
          a.input :emailAddress
        end
      end

      f.inputs "Telephones" do
        f.has_many :telephones, heading: false, allow_destroy: true do |a|
          a.input :telephoneNumber
        end
      end

      f.inputs "Address" do
        f.has_many :address, heading: false, new_record: (f.object.address.nil?), allow_destroy: true do |a|
          a.inputs :addressType, :buildingName, :streetName, :streetNumber, :streetNumberSuffix, :postalCode, :city, :province
          a.input :country, as: :string
        end
      end

      f.actions
    end

    # Customize the Show page. Needs to be moved into a partial later.
    show do

      attributes_table do
        rows :salutation, :firstName, :surName
        person.emails.each.with_index(1) do |email, index|
          row "Email #{index}" do email.emailAddress end
        end
        person.telephones.each.with_index(1) do |phone, index|
          row "Phone #{index}" do phone.telephoneNumber end
        end
        person.address do |address|
          row "Address" do address.postalCode end
        end
        row :address

        # panel "Address" do
        #   table_for person.address do
        #     column :postalCode
        #     column :city
        #     column :country
        #   end
        # end
      end

      active_admin_comments
    end

end
