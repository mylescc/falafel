class Qualification < ActiveRecord::Base
  belongs_to :user

  validates :user, :level, :organisation, :grade, presence: true

  enum level: {
    'GCSE' => 1,
    'A Level' => 2,
    'Phd' => 3,
    'MBA' => 4,
    'BSc' => 5,
    'Msc' => 6,
    'BA' => 7,
    'HND' => 8,
    'HNC' => 9,
    'Other' => 10
  }
  enum grade: {
    'A*' => 1,
    'A' => 2,
    'B' => 3,
    'C' => 4,
    '1st' => 5,
    '2.1' => 6,
    '2.2' => 7,
    '3rd' => 8,
    'Merit' => 9,
    'Distinction' => 10,
  }
end
