# reference_abstract_download

## Usage
Rscript ref_abstract_download.R "key words" ref_output.xls 

## Preparation<br>
install.packages("RISmed") <br>
install.packages("tidyverse")<br>
install.packages("tidypmc")<br>
install.packages("europepmc")

## Output
```
Pathogen        PMID    title   authorString    journalTitle    pubYear Abstract        pubType Country doi     journalVolume   issue      pageInfo
Acanthamoeba castellanii        32454872        Biochemistry, Safety, Pharmacological Activities, and Clinical Applications of Turmeric: A Mechanistic Review.     Ahmad RS, Hussain MB, Sultan MT, Arshad MS, Waheed M, Shariati MA, Plygun S, Hashempur MH.      Evid Based Complement Alternat Med 2020            review-article; review; journal article United States   10.1155/2020/7656919    2020               7656919
```
