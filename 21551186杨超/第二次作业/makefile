Mycal:main.m
#宏定义的使用，更加形象，简化记忆
#使用方法：$(文件名)
	#OBJECT=Mycal
	#Files=-framework foundation main.m
	clang -fno-objc-arc -framework foundation main.m  -o Mycal
	#clang -fno-objc-arc $(Fiels)  -o $(OBJECT)
run:
	./Mycal
clean:
	rm Mycal
tar:
	tar -zcvf  Mycal.tar.gz Mycal
