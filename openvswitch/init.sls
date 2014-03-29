{% from "openvswitch/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('openvswitch:lookup')) %}

{% if datamap.repo.manage|default(False) == True %}
  {% if salt['grains.get']('os_family') == 'Debian' %}
openvswitch_repo:
  pkgrepo:
    - managed
    - name: deb {{ datamap.repo.url }} {{ datamap.repo.dist }} {{ datamap.repo.comps }}
    - file: /etc/apt/sources.list.d/openvswitch.list
    - key_url: {{ datamap.repo.keyurl }}
  {% endif %}
{% endif %}

remove-bridgeutils:
  pkg:
    - removed
    - name: {{ datamap.bridgeutils.pkg }}

openvswitch:
  pkg:
    - installed
    - pkgs:
{% for p in datamap.pkgs %}
      - {{ p }}
{% endfor %}

