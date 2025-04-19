#!/bin/bash

cat ~/clinvar_20250415.vcf | \
	awk -F'\t' '
BEGIN {
    max_del = 0
        max_ins = 0
	    line_del = ""
	        line_ins = ""
	}
	/SVTYPE=DEL/ || /SVTYPE=INS/ {
	    type = ""
	        len = 0

		     # Определяем тип вариации
		         if ($0 ~ /CLNVC=Deletion/) type = "DEL"
		             else if ($0 ~ /CLNVC=Insertion/) type = "INS"
		    
		                 # Извлекаем SVLEN или вычисляем длину через EN
				 if (type=="DEL") {
					 len = length($4) - length($5)
		                                     len = (len < 0) ? -len : len
		                                         }
						 else if (type == "INS" ) {
		                                                     
							 len = length($5) - length($4)
		                                                                 }
		    
		                                                                     # Обновляем максимумы
		                                                                         if (type == "DEL" && len > max_del) {
		                                                                                 max_del = len
		                                                                                         line_del = $0
		                                                                                             }
		                                                                                                 else if (type == "INS" && len > max_ins) {
		                                                                                                         max_ins = len
		                                                                                                                 line_ins = $0
		                                                                                                                     }
		                                                                                                                     }
		                                                                                                                     END {
		                                                                                                                         print "Самая длинная делеция (" max_del " bp):"
		                                                                                                                             print line_del
		                                                                                                                                 print "\nСамая длинная инсерция (" max_ins " bp):"
		                                                                                                                                     print line_ins
		                                                                                                                                     }' | grep -v "^#"
