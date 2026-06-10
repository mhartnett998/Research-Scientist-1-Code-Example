## Doing required ACS/CPS data cleaning
library(tidyverse)

dat = read.csv('ACS DOWNLOAD.csv')

dat = dat %>% filter(FTOTINC != 9999999,
                     FTOTINC > 0) %>% 
  mutate(hhfam = paste(SERIAL, FAMUNIT, sep='')) %>% 
  within({first_pers = !duplicated(hhfam)}) %>% 
  filter(first_pers == "TRUE") 

write.csv(dat,'acsdata.csv', row.names = F)

dat = read.csv('CPS DATA.csv')

dat = dat %>% filter(AGE >=18)

write.csv(dat, 'cpsdata.csv', row.names = F)
