# COMPONENTS

|FOLDER        |NORMATIVE                    |TECHNOLOGY     |
|-------------:|:----------------------------|:--------------|
|requirements  | OMG-2.5.1.                  | UML           |
|certification | RTCA DO-254                 |               |
|              | IEEE 1735-2014              |               |
|quality       | ISO 9001-2015               |               |
|doc           | IEEE 1685-2014              | IP-XACT       |
|software      | RTCA DO-178C                |               |
|src           | RTCA DO-178C                |               |
|bench         | IEEE 1076-2019              | VHDL          |
|              | IEEE 1800-2017              | SystemVerilog |
|model         | IEEE 1076-2019              | VHDL          |
|              | IEEE 1800-2017              | SystemVerilog |
|              | IEEE 1850-2010              | PSL           |
|osvvm/uvm     | IEEE 1800.2-2020            | UVM           |
|rtl           | IEEE 1076-2019              | VHDL          |
|              | IEEE 1800-2017              | SystemVerilog |
|              | IEEE 1850-2010              | PSL           |

# DevOps

| CONTROL       | DEVELOP   | OPERATION             |
|:--------------|:----------|:----------------------|
| certification | bench     | sim                   |
| doc           | model     | compilation/synthesis |
| quality       | osvvm/uvm |                       |
| requirements  | rtl       |                       |
|               | software  |                       |
|               | src       |                       |


# LIST OF ADVANCED ACTIONS IN GIT

* Save credentials
```
git config --global credential.helper cache
git pull
```

* Recursively clone repository "REPOSITORY" of user "USER"
```
git clone --recursive https://github.com/USER/REPOSITORY.git
```

* Remove submodule "repository"
```
git rm -rf repository
```

* Add submodule "repository" with the content of the repository "REPOSITORY" of the user "USER"
```
git submodule add --force https://github.com/USER/REPOSITORY.git repository
```

* Save work "WORK"
```
git add *
git commit -m "WORK"
git push origin master
```

* Remove last commit
```
git reset --hard HEAD^
git push origin -f
```

* Update repository "FORKED-REPOSITORY" of the user "USER"
```
git remote add upstream https://github.com/USER/FORKED-REPOSITORY.git
git fetch upstream
git checkout master
git rebase upstream/master
git push -f origin master
```


# LIST OF ADVANCED ACTIONS IN SVN

* Save credentials
```
svn checkout --username USER --password PASSWORD https://github.com/USER/REPOSITORY
```

* Remove submodule "repository"
```
svn delete repository
```

* Save work "WORK"
```
git add *
svn commit -m "WORK"
```
