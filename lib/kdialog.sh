#!/bin/bash
# Copyright © 2013 Martin Ueding <dev@martin-ueding.de>
# Licensed under The GNU Public License Version 2 (or later)

if which qdbus-qt4 &> /dev/null
then
    qdbus=qdbus-qt4
else
    qdbus=qdbus
fi

kdialog-init() {
    if ! [[ "$kdialog" == "true" ]]
    then
        return
    fi

    # Abort, it kdialog is not installed.
    if ! type kdialog &> /dev/null
    then
        echo $"WARNING: No kdialog found"
        kdialog=false
        return
    fi

    # Abort, it qdbus is not installed.
    if ! type "$qdbus" &> /dev/null
    then
        echo $"WARNING: No $qdbus found"
        kdialog=false
        return
    fi

    # Abort, it qdbus does not work.
    if ! "$qdbus" &> /dev/null
    then
        echo $"WARNING: $qdbus does not work."
        kdialog=false
        return
    fi


    kdialog_handle="$(kdialog --title "$1" --progressbar "Start" "$2")"
    kdialog_number=0
}

kdialog-update() {
    if ! [[ "$kdialog" == "true" ]]
    then
        return
    fi

    $qdbus $kdialog_handle setLabelText "$1" > /dev/null
    $qdbus $kdialog_handle Set "" value "$kdialog_number" > /dev/null
    : $(( kdialog_number++ ))
}

kdialog-exit() {
    if ! [[ "$kdialog" == "true" ]]
    then
        return
    fi

    $qdbus $kdialog_handle close > /dev/null
}
