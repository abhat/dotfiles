;;; go-code.el --- Autocompletion with company-mode for go

;; This file is to enable gocode with company go in emacs

;;; Code:

;;(require 'go-autocomplete)
(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
