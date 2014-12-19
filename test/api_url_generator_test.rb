class APIURLGenerator < Minitest::Test
  test "url generator" do
    assignment = assignments(:roman)
    assert_equal "0.0.0.0:5000/assignments/#{assignment.id}",
                SerializerUrlGenerator.generate_url(assignment)

  end

  test "url generator nest" do
    assignment = assignments(:roman)
    assert_equal "0.0.0.0:5000/projects/#{assignment.project_id}/assignments/#{assignment.id}",
                SerializerUrlGenerator.generate_url(assignment, "project")
  end

  test "polymorphous" do
    comment = comments(:project)
    assert_equal "0.0.0.0:5000/projects/#{comment.commentable_id}/comments/#{comment.id}",
          SerializerUrlGenerator.generate_url(comment, "project", "commentable")
  end


end