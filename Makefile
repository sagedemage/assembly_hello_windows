kernel32_path = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x86\kernel32.Lib"

asm:
	nasm -fwin32 main.asm

bin:
	link /subsystem:console /nodefaultlib /entry:main main.obj $(kernel32_path)

run:
	./main.exe
