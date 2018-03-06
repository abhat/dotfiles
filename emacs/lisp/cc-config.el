;;; ~/emacs/lisp/cc-config.el

(setq auto-mode-alist (cons '("\\.c$" . c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tcc$" . c++-mode) auto-mode-alist))

(c-add-style "my-cc-style" 
	     '("bsd"
	       (tab-width . 8)
	       (indent-tabs-mode . nil)
	       (c-basic-offset . 4)
	       (c-tab-always-indent . nil)
	       (c-hanging-braces-alist . ((brace-list-open)
					  (brace-list-close)
					  (brace-entry-open)
					  (brace-entry-close)
					  (statement-cont)
					  (block-close . c-snug-do-while)
					  (extern-lang-open after)
					  (namespace-open after)))
	       (c-hanging-colons-alist . ((member-init-intro before)
					  (inher-intro)
					  (case-label after)
					  (label after)
					  (access-label after)))
	       (c-cleanup-list . (scope-operator
				  defun-close-semi))))

(add-hook 'c-mode-common-hook (lambda () (progn
					   (c-set-style "my-cc-style")
					   (define-key c-mode-base-map "\C-m" 'c-context-line-break)
					   (c-toggle-auto-hungry-state t))))

(require 'company)
(add-hook 'global-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-irony-c-headers)
;;;(add-hook 'c++-mode-hook 'irony-mode)
;;;(add-hook 'c-mode-hook 'irony-mode)
;;;(add-hook 'objc-mode-hook 'irony-mode)

;;;(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;; end ~/emacs/lisp/cc-config.el
