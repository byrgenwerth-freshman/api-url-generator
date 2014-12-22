
module APIURLGenerator
  class APIURLGeneratorTest < Minitest::Test
    def test_url_generator
      object = GenericKlass.new({
        id: 5,
        some_attribute: "This"
      })
      assert_equal "0.0.0.0:5000/generic_klasses/#{object.id}",
                  APIURLGenerator.generate_url(object)

    end

    def test_url_generator_nest
      object = GenericKlass.new({
        id: 5,
        some_attribute: "This",
        project_id: 5
      })

      assert_equal "0.0.0.0:5000/projects/#{object.project_id}/generic_klasses/#{object.id}",
                  APIURLGenerator.generate_url(object, "project")
    end

    def test_url_generator_nest_not_nested
      object = GenericKlass.new({
        id: 5,
        some_attribute: "This"
      })

      assert_throws "NameError", "NameError was not thrown!" do
        APIURLGenerator.generate_url(object, "project_mm")
      end

    end


    # def test_polymorphous
    #   comment = comments(:project)
    #   assert_equal "0.0.0.0:5000/projects/#{comment.commentable_id}/comments/#{comment.id}",
    #         APIURLGenerator.generate_url(comment, "project", "commentable")
    # end
  end
end