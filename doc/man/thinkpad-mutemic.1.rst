..  Copyright © 2013-2014 Martin Ueding <dev@martin-ueding.de>
    Licensed under The GNU Public License Version 2 (or later)

################
thinkpad-mutemic
################

.. only:: html

    toggle the microphone mute status

    :Author: Martin Ueding <dev@martin-ueding.de>
    :Manual section: 1

Synopsis
========

::

    thinkpad-mutemic

Description
===========

This script will be called when you press the microphone mute button. It will
mute the microphone and toggle the LED. It currently uses the power button LED
for status in order to avoid a kernel module patch. [mutemic]_

.. [mutemic] http://askubuntu.com/a/137278/12824
