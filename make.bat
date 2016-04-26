set mythesis=sample
call xelatex %mythesis%
call bibtex  %mythesis%
call xelatex %mythesis%
call xelatex %mythesis%