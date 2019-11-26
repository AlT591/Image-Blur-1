# Class image is the object we are programing.
class Image 
  
     #attr_accessor is a substitue for both reader and writer
     #allows the outside world to see and update the picture(data)
    attr_accessor :picture, :distance
     
     #initialize is the constructor its building up the image
    def initialize(picture)
    #@picture is a instance variable. You make it live long. so picture gets stored longer than just initialize.
    @picture = picture
  end
   #This method looks for the 1 pixle. So it could later apply the blur! method to it. 

  
  def get_ones
    ones = []
    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end 
    ones
  end

   
  
   # This blur! method instructs how to change the pixels around the 1.  
        def blur(distance)
    ones = get_ones

    @picture.each_with_index do |row, row_index|
      row.each_with_index do |item, column_index|
        ones.each do |found_row_index, found_column_index|
          if manhattan_distance(column_index, row_index, found_column_index, found_row_index) <= distance
            @picture[row_index][column_index] = 1
          end
        end
      end
    end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

#container image. Elements are the pixels 
image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]


])


image.output_image
puts


image.blur(4)
image.output_image
