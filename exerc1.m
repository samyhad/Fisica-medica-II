function exerc1() 
  #DESCRIPTION: Escreva uma fun��o que seja capaz de reconstruir os dados do espa�o-k para o espa�o da imagem
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/15
  #IN: rawdata.mat
  #OUT: imagem resultante da transformada de fourier
  
  dados = load("rawdata.mat");                                       #carregando o arquivo que cont�m nossas fatias e amarzenando no espa�o k
  cell = struct2cell(dados);                                         #c�lula que armazena o espa�o k
  rawdata = zeros(128,128,27);                                       #matriz vazia que ir� armazenar o espa�o k
  
  for(fatia=1:1:27)                                                  # loop para selecionar cada uma das fatias
    for(linha=1:1:128)                                               # loop para preencher as linhas de cell
      for(coluna = 1:1:128)                                          # loop para preencher as colunas de cell
           rawdata(linha, coluna, fatia) = cell{1,1}(linha, coluna, fatia); #preenchendo a matriz com os valores do espa�o k
      endfor;
    endfor;
  endfor;
  
  #processando a imagem relativa as fatias 6, 10, 14, 18 e 22
  slices = [6, 10, 14, 18, 22];
  i = 1;                                                             #Definindo vari�vel contadora
  figure(1, 'position',[100 0 600 600]);                             #A fun��o figure � usada para abrir a janelas gr�fica
  hold on;
  for slice = slices  
    ax(i) = subplot (3,2,i);                                        #plotando a i-�zima imagem
    imagesc(abs(fft2(rawdata(:, :, slice), 128, 128)));             #criando a imagem que vamos apresentar
    subplot_title = strcat("[slice", {' '}, num2str(slice), "]");   #vari�vel que armazena o t�tulo
    title(subplot_title, "fontsize", 10);                           #Printando o t�tulo dessa imagem
    colormap(gray);                                                 #Permite que a imagem fique na escala de cinza
    daspect ([1 1]);                                                #permitindo que a imagem permane�a com a propor��o original
    i++;                                                            #adicionando +1 no contador que estamos usando para plotar todos os gr�ficos em uma figura s�
    
  endfor;
  hold off;
  
endfunction
  
  