;;; ~/emacs/lisp/scons-config.el

(add-to-list 'auto-mode-alist '("\\SConstruct'" . python-mode))
(add-to-list 'auto-mode-alist '("\\SConscript'" . python-mode))

;;;(setq compile-command "kwshell -pd ~/klockwork_projects/.kwlp scons -j32 -ku target=")
(setq compile-command "scons -j32 -ku target=")
;;; end ~/emacs/lisp/scons-config.el
