#! /bin/bash
converte_imagens(){
    export PATH=/usr/bin/convert:$PATH

    cd ../imagens-livros

    #Verifica se a pasta para colocar as imagens convertidas existe, se não existir ela é criada
    if [ ! -d convertido ]
    then
        mkdir convertido
    fi

    #Pega todas as imagens com extensão jpg, depois remove a extensão e por último faz a conversão para png
    for imagem in *.jpg
    do
        imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
        convert $imagem_sem_extensao.jpg convertido/$imagem_sem_extensao.png
    done
}

converte_imagens 2>erros.txt

#Para saber se a conversão ocorreu com sucesso ou se houveram falhas
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo de conversão"
fi