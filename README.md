# Install and Setup

    git clone https://github.com/pnlbwh/datasets

If necessary, you can use `make` to install the required python packages (`plumbum` and `pyaml`)

    make virtualenv # or
    make conda

# Run

Now you can sync a sample of some dataset:

    ./sync int  # downloads data for default INTRuST subject id
    ./sync u01 1001anon 1002anon  # downloads data for 2 subjects in u01 project
