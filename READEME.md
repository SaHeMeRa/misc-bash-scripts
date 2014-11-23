Scripts:

  DisableAnaconda.sh
    After installing python anaconda (at least from the bash
    install script I was given), a line is added to the .bashrc
    that defaults python to use Anaconda rather then simply python.

    This script locates those lines in the bashrc, cuts those lines
    from the .bashrc and stores them in a temporary location.

    The script then renames itself EnableAnaconda.sh to place the
    anaconda exports back into the .bashrc

    CAUTION: I am not all the good with bash as of yet,
    before running the script BACK UP your .bashrc file.
