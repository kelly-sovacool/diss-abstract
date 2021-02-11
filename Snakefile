
rule targets:
    input:
        "abstract.pdf"

rule compile:
    input:
        tex="{name}.tex",
        pre="preamble.tex"
    output:
        pdf="{name}.pdf",
        log=temp("{name}.log"),
        aux=temp("{name}.aux"),
        out=temp("{name}.out")
    shell:
        """
        xelatex {input.tex}
        xelatex {input.tex}
        """

rule texclean:
    shell:
        "rm -f *.out *.log *.aux *.bbl *.blg *.synctex.gz *.fls *.flx *.fdb_latexmk"
