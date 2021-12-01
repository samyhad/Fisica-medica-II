function exerc1() 
  #DESCRIPTION: Escreva uma função que seja capaz de reconstruir os dados do espaço-k para o espaço da imagem
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/15
  #IN: rawdata.mat
  #OUT: imagem resultante da transformada de fourier
  
  dados = load("rawdata.mat");                                       #carregando o arquivo que contém nossas fatias e amarzenando no espaço k
  cell = struct2cell(dados);                                         #célula que armazena o espaço k
  rawdata = zeros(128,128,27);                                       #matriz vazia que irá armazenar o espaço k
  
  for(fatia=1:1:27)                                                  # loop para selecionar cada uma das fatias
    for(linha=1:1:128)                                               # loop para preencher as linhas de cell
      for(coluna = 1:1:128)                                          # loop para preencher as colunas de cell
           rawdata(linha, coluna, fatia) = cell{1,1}(linha, coluna, fatia); #preenchendo a matriz com os valores do espaço k
      endfor;
    endfor;
  endfor;
  
  #processando a imagem relativa as fatias 6, 10, 14, 18 e 22
  slices = [6, 10, 14, 18, 22];
  i = 1;                                                             #Definindo variável contadora
  figure(1, 'position',[100 0 600 600]);                             #A função figure é usada para abrir a janelas gráfica
  hold on;
  for slice = slices  
    ax(i) = subplot (3,2,i);                                        #plotando a i-ézima imagem
    imagesc(abs(fft2(rawdata(:, :, slice), 128, 128)));             #criando a imagem que vamos apresentar
    subplot_title = strcat("[slice", {' '}, num2str(slice), "]");   #variável que armazena o título
    title(subplot_title, "fontsize", 10);                           #Printando o título dessa imagem
    colormap(gray);                                                 #Permite que a imagem fique na escala de cinza
    daspect ([1 1]);                                                #permitindo que a imagem permaneça com a proporção original
    i++;                                                            #adicionando +1 no contador que estamos usando para plotar todos os gráficos em uma figura só
    
  endfor;
  hold off;
  
endfunction
  
  