include:
  - pkgs.system.gcc
  - pkgs.python.pip

pyyaml:
  pip.installed:
    - name: PyYAML
    {%- if salt['config.get']('virtualenv_name', None)  %}
    - bin_env: /srv/virtualenvs/{{ salt['config.get']('virtualenv_name') }}
    {%- endif %}
    - index_url: https://pypi-jenkins.saltstack.com/jenkins/develop
    - extra_index_url: https://pypi.python.org/simple
    - require:
      - pip: pip
      - pkg: gcc