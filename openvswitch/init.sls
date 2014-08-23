#!jinja|yaml

{% from "openvswitch/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('openvswitch:lookup')) %}

{% if datamap.repo.manage|default(False) %}
  {% if salt['grains.get']('os_family') == 'Debian' %}
openvswitch_repo:
  pkgrepo:
    - managed
    - name: deb {{ datamap.repo.url }} {{ datamap.repo.dist }} {{ datamap.repo.comps }}
    - file: /etc/apt/sources.list.d/openvswitch.list
    {% if 'keyurl' in datamap.repo %}
    - key_url: {{ datamap.repo.keyurl }}
    {% endif %}
  {% endif %}
{% endif %}

remove_bridgeutils:
  pkg:
    - removed
    - name: {{ datamap.bridgeutils.pkg }}

unload_bridge_kmod:
  kmod:
    - absent
    - name: bridge

openvswitch:
  pkg:
    - installed
    - pkgs: {{ datamap.pkgs }}
