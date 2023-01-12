# Coc Config

Run :CocConfig and enter the following.
From [Jussi Kuokkanen's blog](https://jkuokkanen109157944.wordpress.com/2020/11/10/creating-a-haskell-development-environment-with-lsp-on-nixos/)

```
{                               
 "languageserver":{                                             
   "haskell": {
     "command": "haskell-language-server-wrapper",
     "args": ["--lsp"],
     "filetypes": ["haskell", "lhaskell"]
   }
 }
}
```
