#!/usr/bin/env python
import sys
from plumbum import cli, local, SshMachine, FG, ProcessExecutionError
from plumbum.cmd import ssh, rsync
import yaml

class App(cli.Application):
    def main(self, *caseids):
        pathsyml = local.path('paths.yml')
        if not pathsyml.exists():
            print("Missing paths.yml")
            sys.exit(1)
        with open(pathsyml, 'r') as f:
            yml = yaml.load(f)
        for key, path in yml.items():
            if key == 'caseid':
                continue
            print path
            if caseids:
                for caseid in caseids:
                    print path.replace(yml['caseid'], caseid)

if __name__ == '__main__':
    App.run()
