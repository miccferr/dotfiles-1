#/bin/bash

cd "$(dirname "$BASH_SOURCE")" \
    && source '../../utils.sh' \
    && source 'utils.sh'

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Tools for compiling/building software from source
    install_package 'Build Essential' 'build-essential'

    # GnuPG archive keys of the Debian archive
    install_package 'GnuPG archive keys' 'debian-archive-keyring'

    # Software which is not included by default
    # in Ubuntu due to legal or copyright reasons
    #install_package 'Ubuntu Restricted Extras' 'ubuntu-restricted-extras'

    # Canonical Partners
    sudo dpkg --add-architecture i386

    # add_to_source_list 'http://archive.canonical.com/ubuntu '$(lsb_release -sc)' partner' 'sources.list'
    # print_result $? "Canonical Partners (add to repository to resource list)"
    update

    printf '\n'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'atom'; then

        add_ppa 'webupd8team/atom'
        print_result $? "Atom (add PPA)"

        update

        install_package 'Atom' 'atom'

        printf '\n'

    else
        print_success 'Atom'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'yarn'; then

        add_key 'https://dl.yarnpkg.com/debian/pubkey.gpg'
        print_result $? "Yarn (add key)"

        add_to_source_list '[arch=amd64] https://dl.yarnpkg.com/debian/ stable main' 'yarn.list'
        print_result $? "Yarn (add to package resource list)"

        update

        install_package 'Yarn' 'yarn'

        printf '\n'

    else
        print_success 'Yarn'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'google-chrome-unstable'; then

        add_key 'https://dl-ssl.google.com/linux/linux_signing_key.pub'
        print_result $? "Chrome Canary (add key)"

        add_to_source_list '[arch=amd64] http://dl.google.com/linux/deb/ stable main' 'google-chrome.list'
        print_result $? "Chrome Canary (add to package resource list)"

        update

        install_package 'Chrome Canary' 'google-chrome-unstable'

        printf '\n'

    else
        print_success 'Chrome Canary'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Chromium' 'chromium-browser'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'cURL' 'curl'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'UnZip' 'unzip'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Dropbox' 'nautilus-dropbox'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'firefox-trunk'; then

        printf '\n'

        add_ppa 'ubuntu-mozilla-daily/ppa'
        print_result $? "Firefox Nightly (add PPA)"

        update

        install_package 'Firefox Nightly' 'firefox-trunk'

        printf '\n'

    else
        print_success 'Firefox Nightly'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GIMP' 'gimp'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Git' 'git'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'GNOME Vim' 'vim-gnome'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'ImageMagick' 'imagemagick'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'tmux' 'tmux'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Transmission' 'transmission'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VirtualBox' 'virtualbox'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'VLC' 'vlc'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'xclip' 'xclip'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Zopfli' 'zopfli'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Skype' 'skype'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'Flash Player' 'adobe-flashplugin'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_deb_package 'Slack' 'slack' 'https://downloads.slack-edge.com/linux_releases/slack-desktop-2.6.0-amd64.deb'

    install_deb_package 'Hyper Term' 'hyper' 'https://hyper-updates.now.sh/download/linux_deb'

    # install_deb_package 'Brave Browser' 'brave' 'https://laptop-updates.brave.com/latest/debian64'

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'pip'; then

        printf '\n'

        {
          sudo wget -q https://bootstrap.pypa.io/get-pip.py -P /tmp && \
          python /tmp/get-pip.py --user && \
          sudo rm -f /tmp/get-pip.py && \
          echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc && \
          source  ~/.bashrc && \
          print_success 'pip'
        } || {
          print_error "pip"
        }

        printf '\n'

    else
        print_success 'pip'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! package_is_installed 'aws'; then

        printf '\n'

        {
          pip install awscli --upgrade --user && \
          print_success 'aws'
        } || {
          print_error "aws"
        }

        printf '\n'

    else
        print_success 'aws'
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    install_package 'jq' 'jq'
    
    install_package 'zsh' 'zsh'

}

main
