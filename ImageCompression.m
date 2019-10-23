function ImageCompression(index, k)
    path_image_in = strcat('./images.in/image', strcat(int2str(index), '.gif'));
    
    A_k = compression1(path_image_in, k);
    plot_compression1(path_image_in);
    
    % A_k = compression2(path_image_in, k);
    % plot_compression2(path_image_in);
    
    % A_k = compression3(path_image_in, k);
    % plot_compression3(path_image_in);
    
    if ~exist('./images.out', 'dir')
       mkdir('./images.out');
    end
    
    path_image_out = strcat('./images.out/image', strcat(int2str(index), '.gif'));
    imwrite(uint8(A_k), path_image_out);
end
