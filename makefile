CC = g++ -g -Wall



# files = $(shell ls -al)


INC = ./Inc
RUSTDIR = ./rust_add
DLLTARGETDIR = ./lib
DLLSOURCEDIR = $(RUSTDIR)/target/release
LIBS = -L$(DLLTARGETDIR)/ -lrust_add

generated=c_rust_call.exe c_rust_call.o $(DLLTARGETDIR)/rust_add.dll


all: clean buildrust copydll c_rust_call.exe 

c_rust_call.exe: c_rust_call.o c_rust_call.cpp $(DLLTARGETDIR)/rust_add.dll
	@echo "linking...."
	$(CC) -o c_rust_call.exe c_rust_call.o $(LIBS)
	@echo "linking finished"

c_rust_call.o: c_rust_call.cpp
	@echo "compiling...."
	$(CC) -c c_rust_call.cpp 
	@echo "compiling finished"

clean:
	@echo "cleaning...."
	rm -f $(generated)
	@echo "finished cleaning"

buildrust:
	cargo clean --manifest-path $(RUSTDIR)/Cargo.toml
	cargo build --release --manifest-path $(RUSTDIR)/Cargo.toml

copydll:
	cp $(DLLSOURCEDIR)/rust_add.dll $(DLLTARGETDIR)
