class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  SLOT = [["7-8", "1"],["8-9", "2"],["9-10", "3"],["10-11", "4"],["11-12", "5"],["12-13", "6"],["13-14", "7"],["14-15", "8"],["15-16", "9"], ["16-17", "10"]]
end
