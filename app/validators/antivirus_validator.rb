class AntivirusValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    tmp_file = Tempfile.new(value.filename, encoding: 'ascii-8bit')

    tmp_file.write(value.read)

    tmp_file.rewind

    unless Clamby.safe?(tmp_file.path)
      record.errors.add attribute, :antivirus_virus_detected
    end

    tmp_file.close
  end
end