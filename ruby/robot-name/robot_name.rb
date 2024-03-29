# Write your code for the 'Robot Name' exercise in this file. Make the tests in
# `robot_name_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/robot-name` directory.
class Robot
  def self.forget
    @@name = [*'AA000'..'ZZ999']
  end

  def name
    @s ||= @@name.pop
  end

  def reset
    @s = nil
  end
end
