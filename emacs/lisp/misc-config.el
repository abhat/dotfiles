;;; ~/emacs/lisp/misc-config.el

;; Re-enable various useful commands that are disabled by default
(put 'narrow-to-region 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Make text-mode the default major mode
(setq default-major-mode 'text-mode)

;; I want to be able to see the mark region and type over the selection
(transient-mark-mode t)
(delete-selection-mode t)

;; Show matching parens
(show-paren-mode t)

;; Set up ibuffer
(autoload 'ibuffer "ibuffer" "List buffers." t)


(setq ibuffer-formats '((mark modified read-only " " (name 40 40) " " (size 6 -1 :right) " " (mode 16 16 :center) " " (process 8 -1) " " filename)
			(mark " " (name 16 -1) " " filename))
      ibuffer-saved-filter-groups '(("default"
				     ("c" (mode . c-mode))
				     ("c++" (mode . c++-mode))
				     ("go" (mode . go-mode))
				     ("python" (mode . python-mode))
				     ("haskell" (mode . haskell-mode))
				     ("emacs" (or (name . "^\\*scratch\\*$") (name . "^\\*Messages\\*$"))))
				     ("dired" (mode . dired-mode)))
      ibuffer-elide-long-columns t
      ibuffer-eliding-string "&")

(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-switch-to-saved-filter-groups "default")))

;; Set up iswitchb
(iswitchb-mode 1)
(setq iswitchb-default-method 'maybe-frame)

;; Set up tramp
(setq tramp-default-method "ssh")

;; Set up pastie
(autoload 'pastie-region "pastie" "Post the current region as a new paste at pastie.org. Copies the URL into the kill ring." t)

;; Other miscellaneous stuff
(setq inhibit-splash-screen t
      ring-bell-function 'ignore
      line-number-mode t
      column-number-mode t
      scroll-preserve-screen-position t
      scroll-step 1
      make-backup-files nil
      next-line-add-newlines nil
      find-file-use-truenames nil
      find-file-compare-truenames t
      minibuffer-confirm-incomplete t
      win32-alt-is-meta nil)

;;to copy and paste into the system clipboard using emacs key bindings

(setq x-select-enable-clipboard t)

(defadvice kill-new (before kill-new-push-xselection-on-kill-ring activate)
  "Before putting new kill onto the kill-ring, add the clipboard/external selection to the kill ring"
  (let ((have-paste (and interprogram-paste-function
                         (funcall interprogram-paste-function))))
    (when have-paste (push have-paste kill-ring))))

;;enable desktop-save

(desktop-save-mode 1)

;; I want my grep command to be recursive and case in-sensitive.
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(grep-command "grep -nH -i -r "))

;;; end ~/emacs/lisp/misc-config.el
