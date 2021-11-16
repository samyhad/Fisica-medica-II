function main() 
  #DESCRIPTION: fft2 example
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/15
  #IN: rawdata.m
  #OUT: imagem resultante da transformada de fourier
  
  dados = load("rawdata.mat"); #carregando o arquivo que contém nossas fatias
  cell = struct2cell(dados);
  rawdata = zeros(128,128,27);
  
  for(fatia=1:1:27) # loop para selecionar cada uma das fatias
    for(linha=1:1:128) # loop para preencher as linhas de cell
      for(coluna = 1:1:128) # loop para preencher as colunas de cell
           rawdata(linha, coluna, fatia) = cell{1,1}(linha, coluna, fatia);
      endfor;
    endfor;
  endfor;
  
  #processando a imagem relativa a fatia # 13
  figure;imagesc(abs(fft2(rawdata(:, :, 12))));
  
  
  
endfunction
  
  