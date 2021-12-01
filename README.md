# Fisica-medica-II
Trabalho da disciplina de Física médica II, ministrada no 3° quadrimestre de 2021 pelo professor Daniel Papoti.

# Instruções
Para as questões a seguir, utilize o conjunto de dados de MRI no espaço-k disponibilizados no site do Tidia (“rawdata.m" & “spikes.m“). Os dados nesta matriz estão organizados da seguinte forma: Nleitura x Nfase x Nfatias. Note que para os dados “spikes“, existe somente 1 fatia disponível.
1) Escreva uma função em Matlab que seja capaz de reconstruir os dados do espaço-k para o espaço da imagem. Documente cada linha 
da sua função, explicando cada passo. Plote, usando a função “imagesc“ em escala de cinzas (“colormap gray“), espaço-k (magnitude) original e suas respectivas imagens reconstruídas (magnitude), para os slices no 6, 10, 14, 18 e 22. Dica: Para plotar as 
imagens em magnitude, use o comando “abs“. 
2) Considerando o slice # 13, faça uma sub-amostragem do espaço-k  original da seguinte forma: 
i) Um novo espaço-k sub-amostrado a cada 2 linhas dos espaço-k original; Plote este novo espaço-k e sua respectiva imagem reconstruída.
ii) Um novo espaço-k sub-amostrado a cada 4 linhas do espaço-k original. Novamente, plote este novo espaço-k e sua respectiva imagem reconstruída.
iii) As imagens resultantes sofreram algum artefato? Pesquise na literatura específica (Keywords: Parallel MRI, SENSE) qual o nome deste artefato quando se tem o espaço-k sub-amostrado?
3) Abra o arquivo “spike.m" disponível no Tidia. Faça a reconstrução destes dados, plotando o espaço-k com o spike e sua respectiva imagem reconstruída. Qual tipo de artefato resultante na imagem? Sugira uma forma de remover este artefato da imagem
