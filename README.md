fusion-os
=========

Welcome to the github repo for the Zysys Fusion OS.

The Zysys Fusion OS has a few goals:

1) Make a Linux-based desktop that is SUPERIOR in every way to a Windows or Mac Desktop
2) Make a Linux-based desktop approachable to: Windows Users, Mac Users, Linux Users, New Users, Power Users, Non-Users (like children and musicians), and Aliens.
3) Make a GPL'd OS that is future proof...technologically and visually
4) Make an OS that will change the way other OSes operate.


The Workflow
============

We have not yet decided whether we are going to go Linux from Scratch or build this off another distro and heavily change it.  Either way, we are using a whole bunch of scripts (perl and bash) to build this system dynamically once enough is installed.

The "scripts" directory will hold all of the perl and bash scripts used to generate all the modifications that need to done or spawn the daemons that need to be spawned.

As we progress, we will gradually update this README file to reflect those changes.

End Result
==========

Here are some of the features we plan on providing:
1) Vector graphics to circumvent new and better resolutions on monitors
2) Extremely fast boot time
3) During install time, a hardware daemon that checks for drivers and automatically istalls all Free Software and asks you if you want to install Non-Free Software.
4) This OS will ship BY DEFAULT, ONLY FREE SOFTWARE, but will allow the user the option to install Non-Free Software if (s)he so wishes.
5) It will make use of The Zedram Language (when it is complete) as a data representation vehicle, perl6 (and perl5 because perl6 probably won't be released until 2017...or later...or before...no one knows), cross-platform binary compatability (using wine), and the ability to autodetect when a user downloads a tar.gz and checks it for source code.

Another goal we have is to be able to include sources to all the main Linux Distros' repos and using a fake "apt-get" or "pacman" or "yum," downloading the source and making the source from scratch...if it doesn't have all three tools functional.  It will definately be able to automate the installation from source and autocheck user downloads (so an end-user not using Ubuntu or a Red-hat based system can download the tar.gz for the source files and say something like: 

Hey!  It looks like you downloaded some source files.  Would you like to install this program?  Here are some details about the application (just so you are aware):
1. Source Name
2. Program Name
3. License
4. md5sum check against any md5 sum provided (it will even ask, Do you have a checksum?  I can verify it for you).



So that's it.  We are SUPER pumped about desigining this system because we feel like a desktop/workstation/supercomputer/microcomputer operating system should be fantastic, innovative, and future proof, but it seems like not everyone feels that way.

Put up or shut up, right?  Let's put up something great!

--
Zach Bornheimer
President and CEO of Zysys
