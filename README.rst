===================
openvswitch-formula
===================

Salt Stack Formula to set up and configure Open vSwitch, a multilayer virtual switch

NOTICE BEFORE YOU USE
=====================

* This formula aims to follow the conventions and recommendations described at http://docs.saltstack.com/topics/conventions/formulas.html

TODO
====

* make this formula work with OpenNebula (contributions for OpenStack support are welcome)

Instructions
============

1. Add this repository as a `GitFS <http://docs.saltstack.com/topics/tutorials/gitfs.html>`_ backend in your Salt master config.

2. Configure your Pillar top file (``/srv/pillar/top.sls``), see pillar.example

3. Include this Formula within another Formula or simply define your needed states within the Salt top file (``/srv/salt/top.sls``).

Available states
================

.. contents::
    :local:

``openvswitch``
---------------

Basic setup of Open vSwitch

Additional resources
====================

You might want to do basic network interface setup with `network-formula <https://github.com/bechtoldt/network-formula>`_.

Formula Dependencies
====================

None

Contributions
=============

Contributions are always welcome. All development guidelines you have to know are

* write clean code (proper YAML+Jinja syntax, no trailing whitespaces, no empty lines with whitespaces, LF only)
* set sane default settings
* test your code
* update README.rst doc

Salt Compatibility
==================

Tested with:

* 2014.1.0

OS Compatibility
================

Tested with:

* GNU/ Linux Debian Wheezy 7.5
