defmodule Bst.Router do
    use Plug.Router

    # Log request information
    plug(Plug.Logger)
    # matching routes
    plug(:match)
    # parse json requests
    plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
    # dispatch response  
    plug(:dispatch)
    
    # sample route to check server status
    get "/" do
        send_resp(conn, 200, "Binary Search Tree REST API")
    end

    # enpoint to create/add tree/node
    ''' 
        POSTMAN REQUEST
        url: http://localhost:8080/insert
        body_type: raw->json
        body: {
            'tree': null/tree,
            'n': value  
        } 

    '''
    post "/insert" do   
       {status, body} =
            case conn.body_params do
                %{"n" => value, "tree" => tree} -> {200, process_node(tree, value)}
                _ -> {402, missing_node()}
            end

        send_resp(conn, status, body)
    end

    # process payload
    defp process_node(tree, value) do
        # reject if value is not an integer
        if !is_integer(value) do
             "Retry: Missing 'n' value. The value to be inserted must be a number."
        else
            response = add_node(tree, value)
            Poison.encode!(response)
        end
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

    # Invalid payload
    defp missing_node do
        "Error: Cannot process payload. Expected payload: %{'tree': tree, 'n': n}"
    end

    match _, do: send_resp(conn, 404, "404 Error not found!")

end