defmodule BstTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Bst.Router.init([])

  test "returns Binary Tree REST API" do
    # Establish connection and trigger plug endpoint
    conn = conn(:get, "/")
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "Binary Search Tree REST API"
  end

  test "new tree" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => nil, "n" => 4})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":null,\"left\":null}"
  end

  test "left insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => nil, "right" => nil, "value" => 4}, "n" => 2})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":null,\"left\":{\"value\":2,\"right\":null,\"left\":null}}"
  end

  test "right insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => nil, "right" => nil, "value" => 4}, "n" => 6})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":{\"value\":6,\"right\":null,\"left\":null},\"left\":null}"
  end

  test "left->left insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => %{"left" => nil, "right" => nil, "value" => 2}, "right" => nil, "value" => 4}, "n" => 1})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":null,\"left\":{\"value\":2,\"right\":null,\"left\":{\"value\":1,\"right\":null,\"left\":null}}}"
  end

  test "right->right insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => nil, "right" => %{"left" => nil, "right" => nil, "value" => 6}, "value" => 4}, "n" => 7})
    conn = Bst.Router.call(conn, @opts)
    
    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":{\"value\":6,\"right\":{\"value\":7,\"right\":null,\"left\":null},\"left\":null},\"left\":null}"
  end

  test "left->right insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => %{"left" => nil, "right" => nil, "value" => 2}, "right" => nil, "value" => 4}, "n" => 3})
    conn = Bst.Router.call(conn, @opts)
    
    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":null,\"left\":{\"value\":2,\"right\":{\"value\":3,\"right\":null,\"left\":null},\"left\":null}}"
  end
  
  test "right->left insertion" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => %{"left" => nil, "right" => %{"left" => nil, "right" => nil, "value" => 6}, "value" => 4}, "n" => 5})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "{\"value\":4,\"right\":{\"value\":6,\"right\":null,\"left\":{\"value\":5,\"right\":null,\"left\":null}},\"left\":null}"
  end

  test "non-integer value entry" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"tree" => nil, "n" => nil})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 200
    assert conn.resp_body == "Retry: Missing 'n' value. The value to be inserted must be a number."
  end

  test "Invalid payload" do
    # Establish connection and trigger plug endpoint
    conn = conn(:post, "/insert", %{"n" => 2})
    conn = Bst.Router.call(conn, @opts)

    # Assert response
    assert conn.status == 402
    assert conn.resp_body == "Error: Cannot process payload. Expected payload: %{'tree': tree, 'n': n}"
  end
  
end
