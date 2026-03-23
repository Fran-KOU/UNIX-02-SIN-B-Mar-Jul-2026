uname -a
# Resultado: Linux codespaces-bc78ce 6.8.0-1044-azure #50~22.04.1-Ubuntu SMP Wed Dec  3 15:13:22 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

which gpg
# Resultado: /usr/bin/gpg

gpg --version
# Resultado: gpg (GnuPG) 2.4.4
#libgcrypt 1.10.3
#Copyright (C) 2024 g10 Code GmbH
#License GNU GPL-3.0-or-later <https://gnu.org/licenses/gpl.html>
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#Home: /home/codespace/.gnupg
#Supported algorithms:
#Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA
#Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH,
#        CAMELLIA128, CAMELLIA192, CAMELLIA256
#Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
#Compression: Uncompressed, ZIP, ZLIB, BZIP2

gpg --fullgenerate-key
# gpg: invalid option "--fullgenerate-key"

gpg --list
# gpg: option "--list" is ambiguous

# Exporto mi llave publica
gpg --armor --export panchode05@gmail.com > mi_llave_publica.asc
cat mi_llave_publica.asc

gpg --list-secret-keys --keyid-format=long

gpg --armor --export-secret-keys 