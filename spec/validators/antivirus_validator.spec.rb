require "spec_helper_rails"

describe AntivirusValidator do
  let(:validatable) do 
    Class.new do
      # Without this, the validator would require a name option to be passed
      # to it.
      def self.model_name
        ActiveModel::Name.new(self, nil, "Validatable")
      end

      # Testing the validators
      include ActiveModel::Validations

      attr_accessor :file

      # Attach the validator to the model
      validates :file, antivirus: true
    end
  end
end