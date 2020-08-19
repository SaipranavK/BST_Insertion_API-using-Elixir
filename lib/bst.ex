defmodule Bst do

  # generates tree branch structure
  def create_hashmap(value) do
  
    %{left: nil, value: value, right: nil}
  
  end
  
  # create new tree/branch with value as root element
  def add_node(nil, value) do
  
    create_hashmap(value)
  
  end

  # insert new_value into exisiting tree 
  def add_node(%{left: left, value: value, right: right},new_value) do
    
    if new_value < value do # fall into left branch
      %{left: add_node(left,new_value), value: value, right: right}
    
    
    else # fall into right branch
      %{left: left, value: value, right: add_node(right,new_value)}
    end

  end

end