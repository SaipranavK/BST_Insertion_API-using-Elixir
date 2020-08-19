defmodule BstTest do
  use ExUnit.Case
  doctest Bst

  test "new tree" do
    assert Bst.add_node(nil,4) == %{left: nil, right: nil, value: 4}
  end
  
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

end
