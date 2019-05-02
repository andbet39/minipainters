require 'open-uri'
require 'json'
require "google/cloud/vision"

class VisionService

  def analyze(photo)


    key_file="C:\\Users\\andrea.terzani\\Desktop\\dev\\minipainters\\keyfiles\\atfspeech-01c386c26e7f.json"

    #creds = Google::Cloud::Credentials.new key_file

    image_annotator = Google::Cloud::Vision::ImageAnnotator.new

    detect_obj = image_annotator.object_localization_detection image: 'images/passport.png'

    detect_obj.responses.each do |response|
      response.localized_object_annotations.each do |object|
        puts "#{object.name} (confidence: #{object.score})"
        puts "Normalized bounding polygon vertices:"
        object.bounding_poly.normalized_vertices.each do |vertex|
          puts " - (#{vertex.x}, #{vertex.y})"
        end
      end
    end

    vision = Google::Cloud::Vision.new(
      project: "atfspeech",
      keyfile: key_file
    )

    image = vision.image photo.download
    p image

   end

end