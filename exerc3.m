function exerc3() 
  #DESCRIPTION:  Faça a reconstrução destes dados, plotando o espaço-k com o spike e sua respectiva imagem reconstruída
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/30
  #IN: spike.mat
  #OUT: Imagem reconstruida
  
  pkg load image
  
  dados = load("spike.mat"); #carregando o arquivo que contém nossas fatias e amarzenando no espaço k
  cell = struct2cell(dados); #célula que armazena o espaço k
  spike = zeros(128,128); #matriz vazia que irá armazenar o espaço k
  
  for(linha=1:1:128) # loop para preencher as linhas de cell
    for(coluna = 1:1:128) # loop para preencher as colunas de cell
         spike(linha, coluna) = cell{1,1}(linha, coluna); #preenchendo a matriz com os valores do espaço k
    endfor;
  endfor;

  #processando a imagem relativa a fatia 13
  
  colormap (gray); #colocando a imagem em escala cinza
  
  subplot(2,2,1); #plotando a 1º imagem
    imagesc(abs(spike(:, :))); #Imagem que veio do espaço-k sub-amostrado 
    title ("Imagem do espaço-k", "fontsize", 10); #Título dessa imagem
    daspect ([1 1]); #permitindo que a imagem permaneça com a proporção original
    #A próxima seção plota um quadrado que demarca a região que possui o spike
    hold on;
    plot([40 60],[40 40], 'r', "linewidth", 2);
    plot([40 60],[60 60], 'r', "linewidth", 2);
    plot([40 40],[40 60], 'r', "linewidth", 2);
    plot([60 60],[40 60], 'r', "linewidth", 2);
  
  subplot(2,2,2); #plotando a 2º imagem
    imagesc(abs(fft2(spike(:, :), 128, 128))); #Imagem que veio do espaço-k sub-amostrado a cada 4 linhas
    title ("Imagem que veio do espaço-k", "fontsize", 10); #Título dessa imagem
    daspect ([1 1]); #permitindo que a imagem permaneça com a proporção original
  
  spike(2, 3)
  
  # "CONSERTANDO" A IMAGEM
  # Ao olharmos o primeiro plot percebemos que o spike está no "2° quadrante" do espaço k, 
  # mais especificamente entre x = 40 e x = 60 e y = 40 e x = 60
  # para amenizar tal spike podemos substituir os valores que estão nessa região do espaço k
  # pela média dessa região, para isso podemos fazer o seguinte ...
  pixels = 20*20; #decobrir quantos pixels tem nessa região
  for(linha=40:1:60) # fazer um loop para percorrer as linhas dessa região
    for(coluna = 40:1:60) # fazer um loop para percorrer as colunas
         soma_zona_spike =+ spike(linha, coluna); #somando todos os valores encontrados nessa região
    endfor;
  endfor;
  media = soma_zona_spike/pixels; #calculando a média da região
  sem_spike = spike; #criando uma cópia do nosso espaço k
  for(linha=40:1:60) # percorrendo as linhas dessa região
    for(coluna = 40:1:60) #percorrer as colunas dessa região
         sem_spike(linha, coluna) = media; #substituir os valores pela média da região
    endfor;
  endfor;
  
  subplot(2,2,3); #plotando a 3º imagem 
    imagesc(abs(sem_spike(:, :))); #Imagem do espaço-k reconstruido
    title ("Espaço-k reconstruido - substituição manual", "fontsize", 10); #Título dessa imagem
    daspect ([1 1]); #permite que a imagem permaneça com a proporção original
    #A próxima seção plota um quadrado que demarca a região que possui o spike
    hold on;
    plot([40 60],[40 40], 'r', "linewidth", 2);
    plot([40 60],[60 60], 'r', "linewidth", 2);
    plot([40 40],[40 60], 'r', "linewidth", 2);
    plot([60 60],[40 60], 'r', "linewidth", 2);
    
    
  subplot(2,2,4); #plotando a 4º imagem
    imagesc(abs(fft2(sem_spike(:, :), 128, 128))); #Imagem que veio do espaço-k reconstruido
    title ("Imagem que veio do espaço-k reconstruido", "fontsize", 10); #Título dessa imagem
    daspect([1 1]); #permite que a imagem permaneça com a proporção original
    
  
endfunction;