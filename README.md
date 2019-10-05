## Reticulated Shiny app demo

### The problem: will not use Python 3 when deployed to shinyapps.io

shinyapps.io full deploy log:

```
2019-10-05T20:57:21.995343+00:00 shinyapps[1290210]: Server version: 1.7.8-7
2019-10-05T20:57:21.995346+00:00 shinyapps[1290210]: LANG: en_US.UTF-8
2019-10-05T20:57:21.995383+00:00 shinyapps[1290210]: R version: 3.6.1
2019-10-05T20:57:21.995385+00:00 shinyapps[1290210]: shiny version: 1.3.2
2019-10-05T20:57:21.995386+00:00 shinyapps[1290210]: rmarkdown version: (none)
2019-10-05T20:57:21.995386+00:00 shinyapps[1290210]: httpuv version: 1.5.2
2019-10-05T20:57:21.995387+00:00 shinyapps[1290210]: knitr version: (none)
2019-10-05T20:57:21.995389+00:00 shinyapps[1290210]: jsonlite version: 1.6
2019-10-05T20:57:21.995397+00:00 shinyapps[1290210]: RJSONIO version: (none)
2019-10-05T20:57:21.995399+00:00 shinyapps[1290210]: htmltools version: 0.3.6
2019-10-05T20:57:21.996022+00:00 shinyapps[1290210]: Using pandoc at /opt/connect/ext/pandoc2
2019-10-05T20:57:22.137771+00:00 shinyapps[1290210]: Using jsonlite for JSON processing
2019-10-05T20:57:22.142776+00:00 shinyapps[1290210]: 
2019-10-05T20:57:22.165117+00:00 shinyapps[1290210]: 
2019-10-05T20:57:22.142779+00:00 shinyapps[1290210]: Starting R with process ID: '26'
2019-10-05T20:57:22.165119+00:00 shinyapps[1290210]: Listening on http://127.0.0.1:39786
2019-10-05T20:57:28.306956+00:00 shinyapps[1290210]: Attaching package: ‘DT’
2019-10-05T20:57:28.306958+00:00 shinyapps[1290210]: 
2019-10-05T20:57:28.308008+00:00 shinyapps[1290210]: The following objects are masked from ‘package:shiny’:
2019-10-05T20:57:28.308010+00:00 shinyapps[1290210]: 
2019-10-05T20:57:28.308011+00:00 shinyapps[1290210]:     dataTableOutput, renderDataTable
2019-10-05T20:57:28.308012+00:00 shinyapps[1290210]: 
2019-10-05T20:57:28.306952+00:00 shinyapps[1290210]: 
2019-10-05T20:57:30.824673+00:00 shinyapps[1290210]: Creating virtual environment 'python35_env' ...
2019-10-05T20:57:30.824676+00:00 shinyapps[1290210]: Using python: /usr/bin/python3
2019-10-05T20:57:31.020403+00:00 shinyapps[1290210]: New python executable in /home/shiny/.virtualenvs/python35_env/bin/python2
2019-10-05T20:57:31.020406+00:00 shinyapps[1290210]: Also creating executable in /home/shiny/.virtualenvs/python35_env/bin/python
2019-10-05T20:57:34.616124+00:00 shinyapps[1290210]: Installing setuptools, pkg_resources, pip, wheel...done.
2019-10-05T20:57:34.622843+00:00 shinyapps[1290210]: Running virtualenv with interpreter /usr/bin/python2
2019-10-05T20:57:35.129937+00:00 shinyapps[1290210]: DEPRECATION: Python 2.7 will reach the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 won't be maintained after that date. A future version of pip will drop support for Python 2.7. More details about Python 2 support in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support
2019-10-05T20:57:35.225192+00:00 shinyapps[1290210]: Collecting pip
2019-10-05T20:57:35.612439+00:00 shinyapps[1290210]:   Using cached https://files.pythonhosted.org/packages/30/db/9e38760b32e3e7f40cce46dd5fb107b8c73840df38f0046d8e6514e675a1/pip-19.2.3-py2.py3-none-any.whl
2019-10-05T20:57:35.700688+00:00 shinyapps[1290210]: Collecting wheel
2019-10-05T20:57:35.742008+00:00 shinyapps[1290210]:   Using cached https://files.pythonhosted.org/packages/00/83/b4a77d044e78ad1a45610eb88f745be2fd2c6d658f9798a15e384b7d57c9/wheel-0.33.6-py2.py3-none-any.whl
2019-10-05T20:57:35.752594+00:00 shinyapps[1290210]: Collecting setuptools
2019-10-05T20:57:36.149081+00:00 shinyapps[1290210]:   Using cached https://files.pythonhosted.org/packages/b2/86/095d2f7829badc207c893dd4ac767e871f6cd547145df797ea26baea4e2e/setuptools-41.2.0-py2.py3-none-any.whl
2019-10-05T20:57:36.193966+00:00 shinyapps[1290210]: Installing collected packages: pip, wheel, setuptools
2019-10-05T20:57:37.300944+00:00 shinyapps[1290210]: Successfully installed pip-19.2.3 setuptools-41.2.0 wheel-0.33.6
2019-10-05T20:57:37.550359+00:00 shinyapps[1290210]: Using virtual environment 'python35_env' ...
2019-10-05T20:57:38.619872+00:00 shinyapps[1290210]: DEPRECATION: Python 2.7 will reach the end of its life on January 1st, 2020. Please upgrade your Python as Python 2.7 won't be maintained after that date. A future version of pip will drop support for Python 2.7. More details about Python 2 support in pip, can be found at https://pip.pypa.io/en/latest/development/release-process/#python-2-support
2019-10-05T20:57:38.707819+00:00 shinyapps[1290210]: Collecting numpy
2019-10-05T20:57:39.098079+00:00 shinyapps[1290210]:   Downloading https://files.pythonhosted.org/packages/d7/b1/3367ea1f372957f97a6752ec725b87886e12af1415216feec9067e31df70/numpy-1.16.5-cp27-cp27mu-manylinux1_x86_64.whl (17.0MB)
2019-10-05T20:57:41.153161+00:00 shinyapps[1290210]: Installing collected packages: numpy
2019-10-05T20:57:42.455775+00:00 shinyapps[1290210]: Successfully installed numpy-1.16.5
```