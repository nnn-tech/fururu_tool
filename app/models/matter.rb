class Matter < ApplicationRecord
  validates :name, {presence: true}
  validates :english, {presence: true}
  validates :rap, {presence: true}
  validates :domain, {presence: true}
  validates :rwd, inclusion: {in: [1, 2]}
  validates :ssl, inclusion: {in: [1, 2]}

  # validates :name, {presence: true, length: {maximum: 16}}
  # validates :english, {presence: true, length: {maximum: 32}}
  # validates :rap, {presence: true, length: {maximum: 6}}
  # validates :domain, {presence: true, length: {maximum: 100}}

  # enum rwd: { yes: 1, no: 2 }

  def self.import(file)
    xlsx = Roo::Excelx.new(file.tempfile)
    xlsx.each_row_streaming(offset: 1) do |row|
      matter = self.new(
        name: row[0].value, 
        english: row[1].value, 
        rap: row[2].value, 
        domain: row[3].value, 
        rwd: row[4].value, 
        ssl: row[5].value 
      )
      next if self.pluck(:id).include?(matter.id)
      matter.save
    end
  end
end
