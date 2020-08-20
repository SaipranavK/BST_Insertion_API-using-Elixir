defmodule Bst.Router do
    use Plug.Router
    require  Logger

    plug(Plug.Logger)
    plug(:match)
    plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
    plug(:dispatch)
    
    get "/" do
        send_resp(conn, 200, "Binary Search Tree REST API")
    end

    post "/insert" do
   
       {status, body} =
            case conn.body_params do
                %{"value" => value, "tree" => tree} -> {200, process_node(tree, value)}
                _ -> {402, missing_node()}
            end
    
        
        send_resp(conn, status, body)
    end


    defp process_node(tree, value) do
        response = add_node(tree, value)
        # Do some processing on a list of events
        Poison.encode!(%{"response" => response})
    end
    
    # generates tree branch structure
    defp create_hashmap(value) do
    
        %{"left" => nil, "value" => value, "right" => nil}

    end
    
    # create new tree/branch with value as root element
    defp add_node(nil, value) do
    
        create_hashmap(value)
    
    end

    # insert new_value into exisiting tree 
    defp add_node(%{"left" => left, "value" => value, "right" => right},new_value) do
        
        if new_value < value do # fall into left branch
        %{"left" => add_node(left,new_value), "value" => value, "right" => right}
        
        
        else # fall into right branch
        %{"left" => left, "value" => value, "right" => add_node(right,new_value)}
        end

    end

    defp missing_node do
        Poison.encode!(%{error: " Expected Payload: %{'value' => n, 'tree' => tree}"})
    end

    match _, do: send_resp(conn, 404, "404 Error not found!")

end