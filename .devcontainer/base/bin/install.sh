#!/usr/bin/env /bin/bash

    # For debugging...
    # set -ax

    # ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
    # → Be safe: use deterministic paths ← 
    # ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
    PATH=/bin:$PATH

    # devcontainer.json invokes this, so cwd is set there
    bin=$PWD
    main=$bin/..
    app=$main/app
    skel=$main/skel
    nodenpm=$main/node-18.16.tgz

    [[ $1 ]] && sc=$1 || sc=". ~/.env"
    [[ $2 ]] && fn=$2 || fn=$HOME/.bashrc

    # Copy dotfiles to home directory
    cd $skel
    for f in .*; do [[ -f $f && $f != .bashrc ]] && cp $f $HOME; done

    # Source .env from inside of .bashrc
    #   grep return values...
    #     pattern found: $? = 0 => do nothing
    #     not found: $? = 1 => pattern not found, append to file
    #     no file: $? = 2 => no file, copy from skel
    [[ ! -f $fn ]] && cp $skel/.bashrc $fn \
    || [[ $(grep "${sc}" ${fn} > /dev/null 2>&1; echo $?) == 1 ]] \
    && echo "${sc}" >> ${fn}

    # Fix broken ps1 in .bashrc
    cd $main
    [[ -f $bin/fmod.sh && -f $app/ps1.sh ]] && $bin/fmod.sh $app/ps1.sh ${fn}
    

#    cd /usr
#    sudo tar zxvf $nodenpm;
    # Add and update pkgs
    # note: worlds should be unique per dev container type base vs enhanced etc...
    # todo:  add graceful fail
#    [[ -r $app/world ]] && \
#        sudo apk add --update --no-cache $(< $app/world) \
#        && sudo apk update \
#        && sudo apk upgrade \
#    ;
