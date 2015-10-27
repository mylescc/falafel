class Qualification < ActiveRecord::Base
  belongs_to :user

  validates :user, :level, :organisation, :grade, presence: true

  enum level: {'GCSE' => 1, 'A Level' => 2, 'Degree' => 3}
  enum grade: {'A' => 1, 'B' => 2, 'C' => 3, 'First' => 4, '2.1' => 5, '2.2' => 6, '3' => 7}
end
