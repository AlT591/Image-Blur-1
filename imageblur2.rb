# Class image is the object we are programing.
class Image 
  
     #attr_accessor is a substitue for both reader and writer
     #allows the outside world to see and update the picture(data)
    attr_accessor :picture
     
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
  def blur!
    ones = get_ones
    ones.each do |found_row_number, found_col_number|        
      @picture[found_row_number -1][found_col_number] = 1 unless found_row_number == 0 #up
      @picture[found_row_number +1][found_col_number] = 1 unless found_row_number == @picture.length-1   #down
      @picture[found_row_number][found_col_number -1] = 1 unless found_col_number == 0 #left
      @picture[found_row_number][found_col_number +1] = 1 unless found_col_number == @picture[found_row_number].length-1  #right
    end
  end
  

  def output_image
    @picture.each do |data|
      puts data.join
    end
  end
end

#container image. Elements are the pixels 
image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])



puts 
image.blur!

image.output_image