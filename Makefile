NUMBERS = 1 2 3 4 5 6 7 8 9
run:
	$(foreach var,$(NUMBERS), echo "\nTESTING A$(var)-1"; python sudoku.py Sudoku-boards-Master-unsolved.txt out.txt A$(var)-1;)
clean:
	rm -f *~
	rm -f *.pyc
	rm -f out.txt
	rm -f profile.txt
	rm -f times.txt
profile:
	pprofile sudoku.py Sudoku-boards-Master-unsolved.txt out.txt A8-1 > profile.txt
	cat profile.txt
times:
	make run | egrep "TESTING|Second|Back" | awk 'NR>1 || /^\/dev/'| tee times.txt
