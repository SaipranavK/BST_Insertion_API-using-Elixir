defmodule BstTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Bst.Router.init([])

  test "returns Binary Tree REST API" do
    conn = conn(:get, "/")
    conn = Bst.Router.call(conn, @opts)

    assert conn.status == 200
    assert conn.resp_body == "Binary Search Tree REST API"
  end

  
  test "new tree" do
    conn = conn(:post, "/insert", %{"tree" => nil, "value" => 3})
    conn = Bst.Router.call(conn, @opts)

    assert conn.status == 200
    #assert conn.resp_body == "%{'left' => nil, 'right' => nil, 'value' => 3}"
  end

  test "add node to tree" do
    conn = conn(:post, "/insert", %{"tree" => %{"left" => nil, "right" => nil, "value" => 3}, "value" => 2})
    conn = Bst.Router.call(conn, @opts)

    assert conn.status == 200
    #assert conn.resp_body == "%{'left' => nil, 'right' => nil, 'value' => 3}"
  end

  test "Invalid payload" do
    conn = conn(:post, "/insert", %{"value" => 2})
    conn = Bst.Router.call(conn, @opts)

    assert conn.status == 402
  end

  '''  
  test "left insertion" do
    assert Bst.add_node(%{left: nil, right: nil, value: 4}, 2) == %{left: %{left: nil, right: nil, value: 2}, right: nil, value: 4}
  end

  test "right insertion" do
    assert Bst.add_node(%{left: nil, right: nil, value: 4}, 5) == %{left: nil, right: %{left: nil, right: nil, value: 5}, value: 4}
  end

  test "left->left insertion" do
    assert Bst.add_node(%{left: %{left: nil, right: nil, value: 2}, right: nil, value: 4}, 1) == %{left: %{left: %{left: nil, right: nil, value: 1}, right: nil, value: 2}, right: nil, value: 4}
  end

  test "right->right insertion" do
    assert Bst.add_node(%{left: nil, right: %{left: nil, right: nil, value: 6}, value: 4}, 7) == %{left: nil, right: %{left: nil, right: %{left: nil, right: nil, value: 7}, value: 6}, value: 4}
  end

  test "left->right insertion" do
    assert Bst.add_node(%{left: %{left: nil, right: nil, value: 2}, right: nil, value: 4}, 3) == %{left: %{left: nil, right: %{left: nil, right: nil, value: 3}, value: 2}, right: nil, value: 4}
  end

  test "right->left insertion" do
    assert Bst.add_node(%{left: nil, right: %{left: nil, right: nil, value: 6}, value: 4}, 5) == %{left: nil, right: %{left: %{left: nil, right: nil, value: 5}, right: nil, value: 6}, value: 4}
  end
  '''
end
