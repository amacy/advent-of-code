require "date"

class GenerateEmptyFiles
  DAYS = 1..25
  DIRECTORIES = [
    CONFIG = "config",
    LIB = "lib",
    SPEC = "spec",
  ]

  def initialize(year=Date.today.year)
    @year = year.to_s
  end

  def run
    _create_empty_directories
    _generate_config_files
    _generate_lib_files
    _generate_spec_files
  end

  def _create_empty_directories
    DIRECTORIES.each do |directory|
      Dir.mkdir(directory) if !Dir.exists?(directory)
      Dir.mkdir(File.join(directory, @year)) if !Dir.exists?(File.join(directory, @year))
    end
  end

  def _generate_config_files
    file_name = lambda { |day| _config_file_name(day) }
    contents = lambda { |_| "# replace with puzzle input" }
    _generate_file(CONFIG, file_name, contents)
  end

  def _generate_lib_files
    file_name = lambda { |day| _ruby_file_name(day) }
    contents = lambda { |day|
      <<~FILE
        class Day#{day}
          def initialize(input=nil)
            @input = _parse_input(input)
          end

          def part_1
            # solve part 1
          end

          def part_2
            # solve part 2
          end

          def _parse_input(input)
            input ||= File.read("config/#{_config_file_name(day)}")
            # do something with the input
          end
        end
      FILE
    }
    _generate_file(LIB, file_name, contents)
  end

  def _generate_spec_files
    file_name = lambda { |day| _ruby_file_name(day, true) }
    contents = lambda { |day|
      <<~FILE
        require "pry"
        require_relative "../../lib/#{@year}/#{_ruby_file_name(day)}"

        RSpec.describe Day#{day} do
          context "part 1" do
            it "works for the sample input" do
              input = ""
              expect(Day#{day}.new(input).part_1).to eq 0
            end

            it "works for the puzzle input" do
              expect(Day#{day}.new.part_1).to eq 0
            end
          end

          context "part 2" do
            it "works for the sample input" do
              input = ""
              expect(Day#{day}.new(input).part_2).to eq 0
            end

            it "works for the puzzle input" do
              expect(Day#{day}.new.part_2).to eq 0
            end
          end
        end
      FILE
    }
    _generate_file(SPEC, file_name, contents)
  end

  def _generate_file(directory, file_name, contents)
    DAYS.each do |n|
      day = _day(n)
      file_path = File.join(directory, @year, file_name.call(day))
      if !File.exists?(file_path)
        File.open(file_path, "w") do |file|
          file << contents.call(day)
        end
      end
    end
  end

  def _config_file_name(day)
    "day_#{day}.txt"
  end

  def _ruby_file_name(day, spec=false)
    file_name = "day_#{day}"
    file_name << "_spec" if spec
    file_name << ".rb"
  end

  def _day(n)
    n.to_s.rjust(2, "0")
  end
end

GenerateEmptyFiles.new(ARGV.shift).run
