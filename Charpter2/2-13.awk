# !/usr/bin/awk -f

BEGIN	{
	printf("#include \"apue.h\"\n")
	printf("#include <errno.h>\n")
	printf("#include <limits.h>\n")
	printf("\n")
	printf("static void pr_sysconf(char *,int);\n")
	printf("static void pr_pathconf(char *,char *, int);\n")
	printf("\n")
	printf("int main(int argc, char *argv[])\n")
	printf("{\n")
	printf("\tif (argc!=2)\n")
	printf("\t\terr_quit(\"usage: a.out <dirname>\");\n\n")
	FS="\t+"
	while (getline < "sysconf.sym" > 0){
		printf("#ifdef %s \n",$1)
		printf("\tprintf(\"%s defined to be %%ld \\n\",(long)%s+0);\n",$1,$1)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n\");\n",$1)
		printf("#endif\n")
		printf("#ifdef %s\n",$2)
		printf("\tpr_sysconf(\"%s =\",%s);\n",$1,$2)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n\");\n",$2)
		printf("#endif\n")
	}
	close("sysconf.sym")
	while(getline<"pathconf.sym"> 0){
		printf("#ifdef %s\n",$1)
		printf("\tprintf(\"%s defined to be %%ld\\n\",(long)%s+0);\n",$1,$2)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n\");\n",$1)
		printf("#endif\n")
		printf("#ifdef %s\n",$2)
		printf("\tpr_pathconf(\"%s=\",argv[1],%s);\n",$1,$2)
		printf("#else\n")
		printf("\tprintf(\"no symbol for %s\\n\");\n",$2)
		printf("#endif\n")
	}
	close("pathconf.sym")
	exit
}
END{
	printf("\texit(0);\n")
	printf("}\n\n")
	printf("static void\n")
	printf("pr_sysconf(char *mesg,int name)\n")
	printf("{\n")
	printf("\tlong val;\n\n")
	printf("\tfputs(mesg,stdout);\n")
	printf("\terrno = 0;\n")
	printf("\tif( (val = sysconf(name))<0){\n")
	printf("\t\tif (errno != 0) {\n")
	printf("\t\t\tif(errno == EINVAL)\n")
	printf("\t\t\t\tfputs(\"(not supported)\\n\",stdout);\n")
	printf("\t\t\telse\n")
	printf("\t\t\t\terr_sys(\"sysconf error\");\n")
	printf("\t\t}\n")
	printf("\t} else {\n")
	printf("\t\tprintf(\"%%ld\\n\",val);\n")
	printf("\t}\n")
	printf("}\n\n")
	printf("static void\n")
	printf("pr_pathconf(char *mesg,char *path,int name)\n")
	printf("{\n")
	printf("\tlong val;\n")
	printf("\n")
	printf("\tfputs(mesg,stdout);\n")
	printf("\terrno = 0;\n")
	printf("\tif ((val = pathconf(path,name))<0){\n")
	printf("\t\tif(errno != 0){\n")
	printf("\t\t\tif(errno == EINVAL)\n")
	printf("\t\t\t\tfputs(\"(not supported)\\n\",stdout);\n")
	printf("\t\t\telse\n")
	printf("\t\t\t\terr_sys(\"pathconf error,path = %%s\",path);\n")
	printf("\t\t}else{\n")
	printf("\t\t\tfputs(\"(no limit)\\n\",stdout);\n")
	printf("\t\t}\n")
	printf("\t}else{\n")
	printf("\t}\n")
	printf("}\n")
}














