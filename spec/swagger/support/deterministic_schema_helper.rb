module DeterministicSchemaHelper
  SECURE_RANDOM_LENGTH = 6
  def self.make_deterministic_examples(config)

    reset_all_primary_key_sequences(config)
    wrap_with_timecop_freeze(config)
    # mock_alpha_numeric_code(config)
    # replace_dynamic_carrierwave_names(config)
  end

  private

  def self.reset_all_primary_key_sequences(config)
    config.before(:all) do
      ActiveRecord::Base.connection.tables.each do |t|
        ActiveRecord::Base.connection.reset_pk_sequence!(t)
      end
    end
  end

  def self.wrap_with_timecop_freeze(config)
    config.around(:each, operation: true) do |example|
      # Ensure deterministic response by freezing the times (created_at etc)
      Timecop.freeze(Time.zone.local(2022, 1, 2, 15, 55, 22)) do
        example.run
      end
    end
  end

  # Some further handling of possible non-deterministic values
  #
  # def self.mock_alpha_numeric_code(config)
  #   config.before(:each, operation: true) do
  #     # # Ensure deterministic response by mocking the secure random that is f.e. used in slugs
  #     allow(SecureRandom).to receive(:base36).with(SECURE_RANDOM_LENGTH).and_return(*(0..9).map do |i|
  #       "abcde#{i}"
  #     end)
  #   end
  # end

  # def self.replace_dynamic_carrierwave_names(config)
  #   config.before(:each, operation: true) do |_example|
  #     # Paths would be random and thus set to a fixed value for the docs
  #     # rubocop:disable RSpec/AnyInstance
  #     allow_any_instance_of(CarrierWave::Uploader::Base).to receive(:filename).and_return('example.jpg')
  #     allow_any_instance_of(CarrierWave::Uploader::Base).to(receive(:url).and_wrap_original do |m, *args|
  #       "https://cdn.example.com/#{m.call(*args).split('/').last}"
  #     end)
  #     allow_any_instance_of(ProfilePictureUploader).to receive(:unique_filename).and_return('DPGPj1yR.jpg')
  #     # rubocop:enable RSpec/AnyInstance
  #   end
  # end
end
