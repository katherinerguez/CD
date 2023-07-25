#!/bin/bash


run() 
{
    cd ..
    code Proyecto.ipynb
}


report()
{
    cd ..
    cd Informe
    pdflatex informe.tex
    code informe.pdf
}


show_report()
{
    cd ..
    cd Informe
    if [ ! -f informe.pdf ]
    then
    pdflatex informe.tex
    fi

    echo "Quieres por defecto (y-> yes , n -> no)"
    read comando
    if [ $comando = "y" ]
    then
    code informe.pdf
    else
    echo "Escriba uno nuevo"
    read funcion
    $funcion informe.pdf
    fi
}


show_slides()
{
    cd ..
    cd Presentacion
    if [ ! -f presentacion.pdf ]
    then
    pdflatex presentacion.tex
    fi

    echo "quieres por defecto (y-> yes , n -> no)"
    read comando
    if [ $comando = "y" ]
    then
    code presentacion.pdf
    else
    echo "Escriba una nueva"
    read funcion
    $funcion presentacion.pdf
    fi
}


slides()
{
    cd ..
    cd Presentacion
    pdflatex presentacion.tex
    code presentacion.pdf
}



clean()
{
    cd ..
    cd Informe
    rm -f *.aux *.lot *.lof *.log *.toc *.dvi *.ps *.bbl *.out *.synctex.gz *.fls *.fdb_latexmk
    rm -f *.nav *.snm *.vrb *.bib
    cd ..
    cd Presentacion
    rm -f *.aux *.lot *.lof *.log *.toc *.dvi *.ps *.bbl *.out *.synctex.gz *.fls *.fdb_latexmk 
    rm -f *.nav *.snm *.vrb
}


echo -e "Que deseas hacer \nrun \nreport \nslides \nshow_report \nshow_slides \nclean \n"
read comando

if [ $comando = "clean" ]
then
clean
elif [ $comando = "report" ]
then
report
elif [ $comando = "slides" ]
then
slides
elif [ $comando = "show_report" ]
then
show_report
elif [ $comando = "show_slides" ]
then
show_slides
elif [ $comando = "run" ]
then
run
fi
