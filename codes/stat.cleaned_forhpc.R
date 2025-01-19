library(jsonlite)

js <- fromJSON('file')

out <- data.frame(ID = NA, duplication = NA, before_total_reads = NA,
                  before_total_bases = NA, before_Q20_bases = NA, before_Q30_bases = NA,
                  before_GC_content = NA,
                  after_total_reads = NA,
                  after_total_bases = NA, after_Q20_bases = NA, after_Q30_bases = NA,
                  after_GC_content = NA)

for (i in 1:nrow(input) ) {
  js <- fromJSON(input[i,2])
  
  out[i,2] <- js$duplication$rate
  out[i,3] <- js$summary$before_filtering$total_reads
  out[i,4] <- js$summary$before_filtering$total_bases
  out[i,5] <- js$summary$before_filtering$q20_bases
  out[i,6] <- js$summary$before_filtering$q30_bases
  out[i,7] <- js$summary$before_filtering$gc_content
  
  out[i,8] <- js$summary$after_filtering$total_reads
  out[i,9] <- js$summary$after_filtering$total_bases
  out[i,10] <- js$summary$after_filtering$q20_bases
  out[i,11] <- js$summary$after_filtering$q30_bases
  out[i,12] <- js$summary$after_filtering$gc_content
}

write.table(out, file = as.character(args[2]), quote = F, row.names = F, sep = '\t')
