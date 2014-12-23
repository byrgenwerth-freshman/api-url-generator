require 'test_helper'


module APIURLGenerator
  class APIURLGeneratorTest < Minitest::Test
    def test_url_generator
      object = Generic.new({
        id: 5,
        some_attribute: "This"
      })
      assert_equal "0.0.0.0:5000/generics/#{object.id}",
                  APIURLGenerator.generate_url(object)

    end

    def test_url_generator_polymorphic
      object = GenericPolymorphic.new({
        polymorphicable_type: "Project",
        polymorphicable_id: 22,
        id: 33
      })
      assert_equal "0.0.0.0:5000/generic_polymorphics/#{object.id}",
                  APIURLGenerator.generate_url(object)

    end


    def test_url_generator_nest
      object = Generic.new({
        id: 5,
        some_attribute: "This",
        project_id: 5
      })

      assert_equal "0.0.0.0:5000/projects/#{object.project_id}/generics/#{object.id}",
                  APIURLGenerator.generate_url(object, "project")
    end

    def test_url_generator_nest_not_nested
      object = Generic.new({
        id: 5,
        some_attribute: "This"
      })

      assert_raises(ArgumentError) do
        APIURLGenerator.generate_url(object, "project_mm")
      end

    end


    def test_polymorphous
      object = GenericPolymorphic.new({
        polymorphicable_type: "Project",
        polymorphicable_id: 22,
        id: 44

      })
      assert_equal "0.0.0.0:5000/projects/#{object.polymorphicable_id}/generic_polymorphics/#{object.id}",
            APIURLGenerator.generate_url(object, "project")
    end

    def test_polymorphous_error
      object = GenericPolymorphic.new({
        polymorphicable_type: "Project",
        polymorphicable_id: 22,
        id: 44

      })
      assert_raises(ArgumentError) do
        p APIURLGenerator.generate_url(object, "projectadfsd")
      end
    end


    def test_dectect_polymorphic_true
      object = GenericPolymorphic.new({
        polymorphicable_type: "Project",
        polymorphicable_id: 22,
        id: 44
      })

      response = {
        name: {polymorphicable_type: "Project"},
        id: {polymorphicable_id: 22}
      }

      assert_equal response, APIURLGenerator.dectect_polymorphic(object)
    end

    def test_dectect_polymorphic_false
      object = Generic.new({
        id: 5,
        some_attribute: "This",
        project_id: 5
      })

      refute APIURLGenerator.dectect_polymorphic(object)
    end

  end
end