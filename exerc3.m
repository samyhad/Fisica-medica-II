function exerc3() 
  #DESCRIPTION:  Fa�a a reconstru��o destes dados, plotando o espa�o-k com o spike e sua respectiva imagem reconstru�da
  #AUTHOR: Samira Haddad
  #DATE: 2021/11/30
  #IN: spike.mat
  #OUT: Imagem reconstruida
  
  pkg load image
  
  dados = load("spike.mat"); #carregando o arquivo que cont�m nossas fatias e amarzenando no espa�o k
  cell = struct2cell(dados); #c�lula que armazena o espa�o k
  spike = zeros(128,128); #matriz vazia que ir� armazenar o espa�o k
  
  for(linha=1:1:128) # loop para preencher as linhas de cell
    for(coluna = 1:1:128) # loop para preencher as colunas de cell
         spike(linha, coluna) = cell{1,1}(linha, coluna); #preenchendo a matriz com os valores do espa�o k
    endfor;
  endfor;

  #processando a imagem relativa a fatia 13
  
  colormap (gray); #colocando a imagem em escala cinza
  
  subplot(2,2,1); #plotando a 1� imagem
    imagesc(abs(spike(:, :))); #Imagem que veio do espa�o-k sub-amostrado 
    title ("Imagem do espa�o-k", "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
    #A pr�xima se��o plota um quadrado que demarca a regi�o que possui o spike
    hold on;
    plot([40 60],[40 40], 'r', "linewidth", 2);
    plot([40 60],[60 60], 'r', "linewidth", 2);
    plot([40 40],[40 60], 'r', "linewidth", 2);
    plot([60 60],[40 60], 'r', "linewidth", 2);
  
  subplot(2,2,2); #plotando a 2� imagem
    imagesc(abs(fft2(spike(:, :), 128, 128))); #Imagem que veio do espa�o-k sub-amostrado a cada 4 linhas
    title ("Imagem que veio do espa�o-k", "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permitindo que a imagem permane�a com a propor��o original
  
  spike(2, 3)
  
  # "CONSERTANDO" A IMAGEM
  # Ao olharmos o primeiro plot percebemos que o spike est� no "2� quadrante" do espa�o k, 
  # mais especificamente entre x = 40 e x = 60 e y = 40 e x = 60
  # para amenizar tal spike podemos substituir os valores que est�o nessa regi�o do espa�o k
  # pela m�dia dessa regi�o, para isso podemos fazer o seguinte ...
  pixels = 20*20; #decobrir quantos pixels tem nessa regi�o
  for(linha=40:1:60) # fazer um loop para percorrer as linhas dessa regi�o
    for(coluna = 40:1:60) # fazer um loop para percorrer as colunas
         soma_zona_spike =+ spike(linha, coluna); #somando todos os valores encontrados nessa regi�o
    endfor;
  endfor;
  media = soma_zona_spike/pixels; #calculando a m�dia da regi�o
  sem_spike = spike; #criando uma c�pia do nosso espa�o k
  for(linha=40:1:60) # percorrendo as linhas dessa regi�o
    for(coluna = 40:1:60) #percorrer as colunas dessa regi�o
         sem_spike(linha, coluna) = media; #substituir os valores pela m�dia da regi�o
    endfor;
  endfor;
  
  subplot(2,2,3); #plotando a 3� imagem 
    imagesc(abs(sem_spike(:, :))); #Imagem do espa�o-k reconstruido
    title ("Espa�o-k reconstruido - substitui��o manual", "fontsize", 10); #T�tulo dessa imagem
    daspect ([1 1]); #permite que a imagem permane�a com a propor��o original
    #A pr�xima se��o plota um quadrado que demarca a regi�o que possui o spike
    hold on;
    plot([40 60],[40 40], 'r', "linewidth", 2);
    plot([40 60],[60 60], 'r', "linewidth", 2);
    plot([40 40],[40 60], 'r', "linewidth", 2);
    plot([60 60],[40 60], 'r', "linewidth", 2);
    
    
  subplot(2,2,4); #plotando a 4� imagem
    imagesc(abs(fft2(sem_spike(:, :), 128, 128))); #Imagem que veio do espa�o-k reconstruido
    title ("Imagem que veio do espa�o-k reconstruido", "fontsize", 10); #T�tulo dessa imagem
    daspect([1 1]); #permite que a imagem permane�a com a propor��o original
    
  
endfunction;