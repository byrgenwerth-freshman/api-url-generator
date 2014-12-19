module APIURLGenerator
  class APIURLGeneratorTest < Minitest::Test
    def test_url_generator
      assignment = assignments(:roman)
      assert_equal "0.0.0.0:5000/assignments/#{assignment.id}",
                  SerializerUrlGenerator.generate_url(assignment)

    end

    def test_url_generator_nest
      assignment = assignments(:roman)
      assert_equal "0.0.0.0:5000/projects/#{assignment.project_id}/assignments/#{assignment.id}",
                  SerializerUrlGenerator.generate_url(assignment, "project")
    end

    def test_polymorphous
      comment = comments(:project)
      assert_equal "0.0.0.0:5000/projects/#{comment.commentable_id}/comments/#{comment.id}",
            SerializerUrlGenerator.generate_url(comment, "project", "commentable")
    end
  end
end