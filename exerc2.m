function exerc2() 
  #DESCRIPTION: Considerando o slice # 13, fa�a uma sub-amostragem do espa�o-k - Quest�o 2.i e 2.ii
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/29
  #IN: rawdata.mat
  #OUT: Imagens subamostradas a cada 2|4 linhas e suas respectivas reconstru��es
  
  dados = load("rawdata.mat"); #carregando o arquivo que cont�m nossas fatias e amarzenando no espa�o k
  cell = struct2cell(dados); #c�lula que armazena o espa�o k
  rawdata = zeros(128,128); #matriz vazia que ir� armazenar o espa�o k
  
  fatia = 13; #fatia que queremos selecionar
  for(linha=1:1:128) # loop para preencher as linhas de cell
    for(coluna = 1:1:128) # loop para preencher as colunas de cell
         rawdata(linha, coluna) = cell{1,1}(linha, coluna, fatia); #preenchendo a matriz com os valores do espa�o k
    endfor;
  endfor;

  #processando a imagem relativa a fatia 13
  
  colormap (gray); #colocando a imagem em escala cinza
  
  gap2 = rawdata(1:2:128, :); #Matriz com um espa�o-k sub-amostrado a cada 2 linhas
  gap4 = rawdata(1:4:128, :); #Matriz com um espa�o-k sub-amostrado a cada 4 linhas
  
  subplot (2,2,1); #plotando a 1� imagem
    imagesc(abs(fft2(gap2(:, :), 128, 128))); #Imagem que veio do espa�o-k sub-amostrado a cada 2 linhas
    title ({"Imagem que veio do espa�o-k";"sub-amostrado a cada 2 linhas"}, "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
  
  subplot (2,2,2); #plotando a 2� imagem
    imagesc(abs(fft2(gap4(:, :), 128, 128))); #Imagem que veio do espa�o-k sub-amostrado a cada 4 linhas
    title ({"Imagem que veio do espa�o-k";"sub-amostrado a cada 4 linhas"}, "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
  
  subplot (2,2,3); #plotando a 3� imagem
    imagesc(abs(fftshift(fft2(gap4(:, :), 128, 128), 1))); #Imagem reconstruida que veio do espa�o-k sub-amostrado a cada 2 linhas
    title ({"Imagem reconstruida que veio do espa�o-k";"sub-amostrado a cada 2 linhas"}, "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
    
  subplot (2,2,4); #plotando a 4� imagem
    imagesc(abs(fftshift(fft2(gap4(:, :), 128, 128), 1))); #Imagem reconstruida que veio do espa�o-k sub-amostrado a cada 4 linhas
    title ({"Imagem reconstruida que veio do espa�o-k";"sub-amostrado a cada 4 linhas"}, "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
  
  
  
  
endfunction
  
  