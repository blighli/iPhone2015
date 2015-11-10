#Makefile
#make -f Makefile hello : -f指定执行的脚本文件名
#make -f Makefile : 默认执行脚本中第一个目标。

cal : main.m LYCalCommand.m NSString+fk.m
	@clang -fno-objc-arc -framework foundation main.m LYCalCommand.m NSString+fk.m -o cal
	@echo usage: ./cal [-m month] [year]

#快捷执行指令
run :
	./cal
	
clean :
	rm cal