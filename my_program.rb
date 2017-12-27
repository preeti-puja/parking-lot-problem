require 'pry'
class Vehicle
  attr_accessor :registration_no, :color

  def initialize(registration_no, color)
    @registration_no = registration_no
    @color = color
  end
end

class Slot
  attr_accessor :id, :vehicle

  def initialize (id)
    @id = id
  end

  def park(registration_no, color)
    if self.vehicle
      puts "vehicle parked"
    else
      self.vehicle = Vehicle.new(registration_no, color)
    end
  end

  def free
    self.vehicle = nil
  end

  def free?
    self.vehicle == nil
  end

  def vehicle_number
    vehicle.registration_no if vehicle
  end

  def vehicle_color
    vehicle.color if vehicle
  end
end

class MyProgram

  attr_accessor :slots

  def initialize(number_of_slots)
    @slots = []

    number_of_slots.to_i.times do |i|
      slot_number = i+1
      slots[i] = Slot.new(slot_number)
    end
    puts "Created a parking lot with #{number_of_slots} slots"
  end

  def park(registration_no, color)
    if free_slot
      puts "Allocated slot number #{free_slot.id}"
      free_slot.park(registration_no, color)
    else
      puts "Sorry, parking lot is full"
    end
  end

  def leave(slot_number)
    slot_number = slot_number.to_i
    if slot_number > 0 && slot_number < slots.length
      slots[slot_number - 1].free
      puts"slot number#{slot_number } is free"
    else
      puts "slot number doesnot exists"
    end
  end

  def status
    puts "Slot no\tRegistration no\tColor"
    slots.each do |slot|
      unless slot.free?
        puts "#{slot.id}\t#{slot.vehicle_number}\t#{slot.vehicle_color}"
      end
    end
  end

  def registration_numbers_for_cars_with_colour(color)
    slot = slots.find do |slot|
      slot.vehicle_color == color
    end
    puts  slot ? "#{slot.vehicle_number}" : "invalid"
  end

  def slot_numbers_for_cars_with_colour(color)
    slot = slots.find do |slot|
      slot.vehicle_color == color
    end
    puts slot ? "#{slot.id}" : "invalid"
  end

  def slot_number_for_registration_number(registration_no)
    slot = slots.find do |slot|
      slot.vehicle_number == registration_no
    end
    puts slot ? "#{slot.id}" : "not found"
  end

  private

  def free_slot
    @slots.find do |slot|
      slot.free?
    end
  end
end

def my_program(input = nil, output = nil)
  if input && output
    input_file = File.open(input, 'r')
    output_file = File.open(output, 'w')

    x = MyProgram.new input_file.lines.first.gsub('\n', '')

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")
    output_file.close

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")
    output_file.close

    slot_no = input_file.lines.first.gsub('\n', '')
    output_file.write x.leave(slot_no)
    output_file.write("\n")
    output_file.close

    status  = input_file.lines.first.gsub('\n', '')
    output_file.write x.status
    output_file.write("\n")
    output_file.close


    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")
    output_file.close

    records = input_file.lines.first.gsub('\n', '').split(' ')
    output_file.write x.park(records[1], records[2])
    output_file.write("\n")
    output_file.close

    color = input_file.lines.first.gsub('\n', '')
    output_file.write x.registration_numbers_for_cars_with_colour(color)
    output_file.write("\n")
    output_file.close

    color = input_file.lines.first.gsub('\n', '')
    output_file.write x.slot_numbers_for_cars_with_colour(color)
    output_file.write("\n")
    output_file.close

    vehicle_number = input_file.lines.first.gsub('\n', '')
    output_file.write x.slot_number_for_registration_number(vehicle_number)
    output_file.write("\n")
    output_file.close

    vehicle_number = input_file.lines.first.gsub('\n', '')
    output_file.write x.slot_number_for_registration_number vehicle_number
    output_file.write("\n")
    output_file.close
  else
    x = MyProgram.new 6
    x.park("KA-01-HH-1234", "white")
    x.park("KA-01-HH-9999", "white")
    x.park("KA-01-BB-0001", "black")
    x.park("KA-01-HH-1238", "red")
    x.park("KA-01-HH-7777", "blue")
    x.park("KA-01-HH-2701", "black")
    x.leave(4)
    x.status
    x.park("KA-01-HH-3141", "Black")
    x.park("KA-01-HH-3241", "Black")
    x.registration_numbers_for_cars_with_colour("white")
    x.slot_numbers_for_cars_with_colour("red")
    x.slot_number_for_registration_number("KA-01-HH-1235")
  end
end

