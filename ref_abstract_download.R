args <- commandArgs(TRUE);
search_topic=args[1]
output=args[2]

# install.packages("RISmed")
library(RISmed)
library(tidyverse)
library(tidypmc)
library(europepmc) 

data          <- epmc_search(query=search_topic, limit=100, sort='date') %>% filter(!is.na(pmid))

#search_query <- EUtilsSummary(search_topic, retmax=100, mindate=2012,maxdate=2021)
records       <- EUtilsGet(data$pmid)
pubmed_data   <- tibble('Pathogen'   =   search_topic, 
                        'PMID'       =   PMID(records), 
                        'Title'      =   ArticleTitle(records), 
                        'Journal'    =   ISOAbbreviation(records), 
                        'Year'       =   YearPubmed(records), 
                        'Abstract'   =   AbstractText(records), 
                        'Country'    =   Country(records), 
                        'DOI'        =   ELocationID(records)   
                        )

merge_dat <- pubmed_data %>% left_join(data, c("PMID"="pmid")) %>% select(Pathogen, PMID, title, authorString, journalTitle, pubYear, Abstract, pubType,  Country, doi, journalVolume, issue, pageInfo)
merge_dat[is.na(merge_dat)] <- ''
write_tsv(merge_dat, output)
