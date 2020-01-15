#= Excercise for Chapter 2

=#

let #necessary for some scoping reason
    @time begin
    #create a 16x16 array of zeros
    # 1 = life
    # 0 = dead
    #=
    init_array = [0 0 0 0 0;
                  0 1 1 1 0;
                  0 0 0 0 0;
                  0 0 0 0 0;
                  0 0 0 0 0]
                  =#
    N = 100
    init_array = rand([0,1], N, N)
    curr_array = init_array #transfer inital array into the working array for each generation
    num_gens = 10000 #number of generations to run the simulation for
    
    for g in 1:num_gens
        println("Generation:", g)
        #neighbor array
        #circshift shifts a copy of the array by one and adds the eight neighboring arrays shifted by one
        #therefore generating a neighbor count array
        # (-1,-1) (-1,0) (-1,1)
        # (0, -1) ORIG. (0,1)
        # (1,-1) (1, 0) (1,1)
        neigh = circshift(curr_array, (1,1))+circshift(curr_array, (1,0))+circshift(curr_array, (1,-1))+circshift(curr_array, (0,1))+circshift(curr_array, (0,-1))+circshift(curr_array, (-1,-1))+circshift(curr_array, (-1,0))+circshift(curr_array, (-1,1))
    
        for i = 1:N, j =1:N #row number then column number
            #rules
            if (neigh[i,j] < 2) || (neigh[i,j] > 3)
                curr_array[i,j] = 0
            end
            if (curr_array[i,j] == 0) && (neigh[i,j] == 3)
                curr_array[i,j] = 1
            end
        end
        #display(curr_array)
        #println("\n Neighbors")
        #display(neigh)
    end
    display(curr_array)
    end
    end #end of scope problem