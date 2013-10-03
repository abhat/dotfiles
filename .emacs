;;; ~/.emacs

(require 'cl)

;; I keep everything under ~/emacs
(defvar emacs-root (cond ((eq system-type 'cygwin) "/home/abhat/")
			 ((eq system-type 'gnu/linux) "/home/abhat/")
			 ((eq system-type 'linux) "/home/abhat/")
			 ((eq system-type 'darwin) "/Users/abhat/")
			 (t "c:/home/abhat/"))
  "My home directory -- the root of my personal emacs load-path")

;; Add all the elisp directories under ~/emacs to my load path
(labels ((add-path (p) (add-to-list 'load-path (concat emacs-root p))))
  (add-path "emacs/lisp")            		;; all my personal elisp code
  (add-path "emacs/site-lisp")			;; elisp stuff from the net
  (add-path "emacs/site-lisp/color-theme")	;; http://www.emacswiki.org/cgi-bin/wiki?ColorTheme
  (add-path "emacs/site-lisp/erlang")		;; file:/usr/lib64/erlang/lib/tools-2.5.2/emacs
  (add-path "emacs/site-lisp/git-emacs")	;; git://github.com/tsgates/git-emacs.git
  (add-path "emacs/site-lisp/nxml-mode")	;; http://www.thaiopensource.com/nxml-mode
  (add-path "emacs/site-lisp/ruby-mode")	;; http://svn.ruby-lang.org/repos/ruby/trunk/misc/ruby-mode
  (add-path "emacs/site-lisp/speedbar")		;; http://cedet.sourceforge.net/speedbar.shtml
  )

;; The remainder of my config is in libraries
(load-library "efuncs")				;; custom functions
(load-library "ekeys")				;; key bindings
(load-library "cc-config")			;; C/C++ mode config
(load-library "dired-config")			;; dired-mode config
(load-library "erl-config")			;; Erlang mode config
(load-library "git-config")			;; Git mode config
;;(load-library "irc-config")			;; IRC client config
(load-library "misc-config")			;; miscellaneous one-off config settings
(load-library "p4-config")			;; Perforce config
(load-library "ruby-config")			;; Ruby mode config
(load-library "scons-config")			;; scons-related config
(load-library "screen-config")			;; window config
(load-library "shell-config")			;; shell config
(load-library "skeleton-config")		;; skeleton config
(load-library "xml-config")			;; XML mode config
(load-library "xcscope")			;;cscope config

(server-start)					;; start the emacs server running

;;; end ~/.emacs
