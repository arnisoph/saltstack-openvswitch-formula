{% from "openvswitch/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('openvswitch:lookup')) %}

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

