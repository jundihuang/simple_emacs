(setq auto-mode-alist
      (append '(("\\.rb\\'" . ruby-mode)
                ("\\.erb\\'" . html-erb-mode))
              auto-mode-alist))

      (provide 'init-ruby)
      
