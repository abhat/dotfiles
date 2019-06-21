
;;; ~/.emacs

(require 'cl)
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://stable.melpa.org/packages/")))
  (add-to-list 'package-archives (cons "stable-melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))


(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c s 1") 'helm-git-grep-at-point)
(global-set-key (kbd "C-c s 2") 'helm-occur)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(package-initialize) ;; You might already have this line
(elpy-enable)
;; I keep everything under ~/emacs
(defvar emacs-root (cond ((eq system-type 'cygwin) "/home/anbhat/")
			 ((eq system-type 'gnu/linux) "/home/anbhat/")
			 ((eq system-type 'linux) "/home/anbhat/")
			 ((eq system-type 'darwin) "/Users/anbhat/")
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
  (add-path "emacs/site-list/yaml-mode")        ;; http://github.com/yoshiki/yaml-mode
  (add-path ".emacs.d/site-list/elpa/")
  )


(setenv "GOPATH" (concat emacs-root "gocode"))
;this is needed for godef to work
(setenv "GO111MODULE" "off")

(add-to-list 'load-path (concat (getenv "GOPATH")
                                "/src/github.com/dougm/goflymake"))
(add-to-list 'load-path (concat (getenv "GOPATH")
                                "/src/github.com/nsf/gocode/emacs-company"))

       
(require 'helm-config)
(helm-mode 1)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$"
			  ""
			  (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; The remainder of my config is in libraries
(load-library "efuncs")				;; custom functions
(load-library "ekeys")				;; key bindings
(load-library "cc-config")			;; C/C++ mode config
(load-library "dired-config")			;; dired-mode config
(load-library "erl-config")			;; Erlang mode config
(load-library "git-config")			;; Git mode config
;;(load-library "irc-config")			;; IRC client config
(load-library "misc-config")			;; miscellaneous one-off config settings
;;(load-library "p4-config")			;; Perforce config
(load-library "ruby-config")			;; Ruby mode config
(load-library "scons-config")			;; scons-related config
(load-library "screen-config")			;; window config
(load-library "shell-config")			;; shell config
(load-library "skeleton-config")		;; skeleton config
(load-library "xml-config")			;; XML mode config
(load-library "xcscope")			;; cscope config
(load-library "yaml-config")                    ;; YAML config
(load-library "go-config")                      ;; Go config
(server-start)					;; start the emacs server running

;;; end ~/.emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-command "grep -nH -i -r ")
 '(package-selected-packages
   (quote
    (exec-path-from-shell go-autocomplete magit helm-git-grep helm-company helm-go-package company-go elpy company-irony-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
