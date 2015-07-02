;;; package --- Summary
;;; Commentary:
;;; pseudo hook to get flycheck mode invoked


;;; Code:
;;; hook for global-flycheck-mode

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'flycheck-global)
;;; flycheck-global.el ends here

