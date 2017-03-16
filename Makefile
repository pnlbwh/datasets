.PHONY: conda virtualenv nix

virtualenv: _virtualenv
nix: _pip_packages.nix
conda:
	conda env -f requirement.txt -n datasets
	@echo "Now run 'source activate datasets"

_virtualenv: requirements.txt
	virtualenv $@; $@/bin/pip install -r $<
	@echo "Now run 'source $@/bin/activate'"

_pip_packages.nix: requirements.txt
	if [ ! -d "_pip2nix" ]; then \
		git clone https://github.com/acowley/pip2nix _pip2nix; \
  fi
	cd _pip2nix; nix-shell --run 'pip2nix ../requirements.txt -o ../_pip_packages.nix'
	@echo "Now run 'nix-shell'"
