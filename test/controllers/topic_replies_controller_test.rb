require 'test_helper'

class TopicRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic_reply = topic_replies(:one)
  end

  test "should get index" do
    get topic_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_topic_reply_url
    assert_response :success
  end

  test "should create topic_reply" do
    assert_difference('TopicReply.count') do
      post topic_replies_url, params: { topic_reply: { content: @topic_reply.content, references: @topic_reply.references, references: @topic_reply.references, string: @topic_reply.string, topic,: @topic_reply.topic,, user,: @topic_reply.user, } }
    end

    assert_redirected_to topic_reply_url(TopicReply.last)
  end

  test "should show topic_reply" do
    get topic_reply_url(@topic_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_topic_reply_url(@topic_reply)
    assert_response :success
  end

  test "should update topic_reply" do
    patch topic_reply_url(@topic_reply), params: { topic_reply: { content: @topic_reply.content, references: @topic_reply.references, references: @topic_reply.references, string: @topic_reply.string, topic,: @topic_reply.topic,, user,: @topic_reply.user, } }
    assert_redirected_to topic_reply_url(@topic_reply)
  end

  test "should destroy topic_reply" do
    assert_difference('TopicReply.count', -1) do
      delete topic_reply_url(@topic_reply)
    end

    assert_redirected_to topic_replies_url
  end
end
