library(ExpImage)

#######################################################
#Abrir imagem das folhas
im=read_image(example_image(3))
plot(im)
#Abrir paleta de cores do fundo
fundo=read_image(example_image(4))
plot(fundo)
#Abrir paleta de cores das folhas
folhas=read_image(example_image(5))
plot(folhas)
#Abrir paleta de cores referencia
ref=read_image(example_image(6))
#Ver a imagem
plot(ref)

#################################################################
#Segmentacao para separar as folhas do restante
folhas.seg=segmentation_logit(im,foreground=folhas,
                              background=list(fundo,ref),sample=2000,fillHull=TRUE,plot=TRUE)

#Extrair da imagem o foreground
extract_pixels(im,target = folhas.seg,valueTarget = 1,plot = T,valueSelect = c(0,0,0))

#Ver informações de cada objeto segmentado.
measure_image(folhas.seg)

#Indicar a pasta onde as imagens serão salvas
setwd("C:/Users/AlcineiAzevedo/Desktop/Lixeira/ImagensSeparadas")

#Dividir as imagens em subimagens
split_image(im = im,Seg =folhas.seg,noise = 1000,
            colorBack  = c(0,1,1),saveImage = TRUE,CutImage = FALSE)




