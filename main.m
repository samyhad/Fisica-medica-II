function main() 
  #DESCRIPTION: fft2 example
  #AUTHOR: Samira Haddad
  #DATE: 2020/11/22
  #IN: void
  #OUT: void
  
  dados = load(“rawdata.mat”) #carregando o arquivo que contém nossas fatias
  rawdata = zeros(128:128:27)
  
  for(i=1:1:27) # loop para selecionar cada uma das fatias
    for(l=1:1:128) # loop para preencher as linhas da matriz
      for(c = 1:1:128) # loop para preencher as colunas da matriz
           
        
      endfor;
    endfor;
  endfor;
  
  #processado a imagem # 13
  #figure;imagesc(abs(rawdata(:, :, 13)));colormap gray; axis image;colorbar; caxis([0 3e4])
  
endfunction
  
  