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
gpg --armor --export panchode05@gmail.com > mi_llave_publica.asc # exportar la llave en formato humanamente legible
cat mi_llave_publica.asc

gpg --list-secret-keys --keyid-format=long

gpg --armor --export-secret-keys # 48E9515BBA7B9AE8 
# Siendo lo ultimo el hash

# -----BEGIN PGP PRIVATE KEY BLOCK-----

# lQdGBGnBMW8BEADGzQPguD7FYB2wmxf/fip+S/wNsWPL4zIxwRfwKUdrOWdeCQWe
# KDPunwwFljpe1RW+F8mUVww379vQLazGuxQ2iNl+X1QhEB7iOJwQFurkuSn5DtaP
# dhK58yFhiq/RSVAlWshoIyQEctWpOFhH9CiJ5EjYTrpJEw3FyXErYpYwIyzVT3D5
# EqFHmmrn8FSfqwnn0TeN+zFP0T3owYNTFyucPKzAm5RLNGrHpc2kXM13PQQ0wloi
# SuhZ3mdMDeUpWEn1OLDEyLFf6zFGPXMvGBJQE7giwyC0aKGd5VoFCIMfvKIEvBEB
# R8Ir/9zJfU1IO4AQ1kQCCxdjCH3ezNmdrRQCuNE7yHP0K600hk1+WoHxhxz2xeap
# ZosB78vEOMqF39Dy9pbEZqFukH2+qqBvWUudKv7QSc3pFqSk2Cy5hZDRhxmLVC3r
# XjpaYp9MJSEJIMNULGPRVNwc6B88Z0z5oqh04h46txkoRC7MOrP2MlFDptJJN/ow
# F6Gk3zX733kEnoH2JL5IwQIl+3k60/fwVrTUJbGe96LE2BIzUP65rUohMGnCXw1h
# B2QmyVQQJVM43KroLrZMKVbdlKrMe45o4tdVKbNDIr1TGpqT2M8D4cDoVi7IeBn9
# M3tN0As2XJIu46Lh6ey3M2UHDyI64ibtvbLSChKCYkhZFyVPb+jjRKVY0QARAQAB
# /gcDAuzW8B48Q5sR/yy5fbooNo/NDUq1rCgRy5Dt4aonuUGnqhrjcgD4OuP8I61z
# Q3GjkCwvUGhBu7VqYnm4v5dkMv4Je0OXB30SotuRRwbexSkYUPYOeT+qseHROTCp
# 6m7c/CoezKW9MiNzIGVwQQpWzDGxysGR7fAUqypr6AWvoQ03Spg2AEfYrWpZ0b+z
# q7y1DwjpLdjJBA4bP9iKsbzt6eo1zzCZiGYGg1b4ozifu/d0J55JsD8oR0CrIZu2
# 77m8h1/WyieZI3eYRagnRHsVyTsr1ZnYhRA23+6r++W52fspqwj2+rp5Uq/qEMQ2
# hOrg5vx8oMf27mENDLXNKH6nEeKZ985WTNFHg3s7PoSf5ZDYaFXK1zzZNcflDBL1
# S1MKHp9yjD2O+G9PL9Zdtx4K5mZKjc4sqiQV1cOFWIUlN9qcGG7Xa031no9bbp3e
# U1vstnlXZquwQwxDExEPCT6DUdUJd33u9o7XaqgSo31KAjmPuV/oHfumwB4Atx+B
# c4vmQJTSDl72BywBjdiCStX+yywMMavsG+9o29S50BMpke7cGWZXmvq1z7DidM5O
# 6W0mQaDIFvZe9N3wSADSLIkUpwrPuUAEqZ8jA2P1unfAyM29Jo/afiJWaUXaOFpm
# HnqRLf/0Sfnb7F03qgjbL/5LxMhYIxkZA/qeb74hSIE0FYgLL1KLzLSknKTukzGO
# jGPuZzsc1vkay6mf0fNvLow/X6wZtvAmLPV3C9CT4M0TOiL33TVWlX5mqGPHguzy
# dGtKrNghubjUxBpLonMgZ33etpwB45JHHd/mYXXsh1iGO8Iza4nu9AtiS2p0ngnN
# zmkVBap8CsVd+0SUyQx4rdthlkbk4xIOya8/KQR01spMoM9HYupByyWgmxpcseYJ
# oowLquFAkXcBFwEstEDPamAzqQysor+25b00iKmZXdI0qf45r9CaEjm50SPbto5P
# 8voRdyRnprSfjZQ7dT7HRUs4dJjtogX6rjFi11kxovWiWechY/4SJeoj0IrlpHa4
# ADpuYx99NdKUaOe2bykX7n9TrxPLDBoKXWVdptJEdKwcuC6xYhPH5bRopg/R3HC8
# opLOohMMEen2BpySw606GLZ6f8rhUmdg/B4MgYoV1B/5dVtqukwZe+MLokbGFHrd
# 5MBAfNTPiEnefnVI9c8M9E9JnxKHSQBJUPPQSzQX8dVjoFOvqlnMHdqeQlNfMJSA
# nSnSFx29iWyKfPp5VCXqOGrL6rqDiZfxLAA/bhC0e42bSLiSg9nbUUOkvMYd1EHZ
# x2zS/cseR5SG8n6tSPodb5IjUKEeahoOKddFH01xu64WSn5CDSVNM2kMYvY7bkuT
# 3jDQ8Tb7ZnYJEA2j6XyRcTcxb0cA4cf8oTPRonUsPkfy9J3hXJ4T5IWOpCAM3AmF
# UwkH9LOEhqslna09MD3a6UMnvrGwGs4kIGHRLIjxOh32AniKMXsMq4B01peya5w8
# s4ZO9hcd5l2tMcDp6gYWIyKjQILu4Y0ZeG13O3SD6A16KxbP/0Onm+d90WknCqLB
# O/fjNSrfl/YZIAD7/yfBw85DCX87hjakekhOm1+6oeJSNlA23OGLNLPc8lmol4Dl
# K2WGZjLpbGYTjlnTwkHt5vsi1uFxt/cRDuDm/l8gJa/yH8W+BOK+U2ksfLCWGSX0
# r/CeqeUY00JNmEWEPkGj4zzunQsqou9GcOKn6UhIVF09iIowkvmVrVzYo2x7PORK
# 9AsJTh++WPN9e56+gGKcb5H9p+MoaFGZniCSnXfmjk4Hv5We8RxKAO20LEZyYW5j
# aXMgQWN1w7FhIChIb2xhKSA8cGFuY2hvZGUwNUBnbWFpbC5jb20+iQJXBBMBCgBB
# FiEEhnzg7/xtT9KpJTI4SOlRW7p7mugFAmnBMW8CGwMFCQHhM4AFCwkIBwICIgIG
# FQoJCAsCBBYCAwECHgcCF4AACgkQSOlRW7p7mugbLQ//d+A+VVjzFpmPdQmKQ7dB
# rEqaC+Ph2CoEk9yQJVl3J+xjkxavuHjrEOqqDs9e+61YhqQT7jGyySe7EkjqMLFh
# 0xZ19dWXJKNl4TfjSjwQer4nDR1lhw3vrXLtJciVmLs8p4Ne6iLVhOm59L1DZU5q
# TSfRxJdJtxLBBRqCjf9fTy5U1+gShJs782NYxfaYBkXlqW+uG0msNVhcYs8N9rQ8
# rVJmHMj3BS40tGCOSr2dZJB4XRVjtwDqSIha6WPygYrXdY9rZQzOcMK/sRS/T0yQ
# 2Mu7vpNGh3f/6FvmtM2PyYWwiCBS+lQ/0qJYrGF2CkSpzaMHtQdFbBmymzkndkjt
# fKPoGJ1M7k1OSKILXcPrwwTIqkNrPBw5YuWrZyR7au8dNrW0YDsqu6gtD/f/SVRb
# jwJfMb5cqFhbmmR9QZmIP6LnXt2Wc+UJB3ZlrAc13YrkKQTceD+9621zXDDGpHY7
# 2/UlsFgJk1p1wSP8Cx/kShSjOH3u+z+TUv82cj2lMa4N8hAUZAWxCIDJ6QaBxjYR
# ZDzHq1P0oixcdaZQsw6Q01cxsq75fFQuaNg+ESMedFAqXz/OckC99ja+2+RBRX+8
# xjuXZ7rgkZQKXNwQ38fHm5jA9POYpSewAiv+tKPG6GtSGm7/TwIVSU9lew93Fnz2
# oRTMw6tUeOzyNzpEGvqBVxCdB0YEacExbwEQAMupRV7FQy2nZxAmhpF6+0N2LXQw
# 0Mnw8Q9cLpzrWjYdnfKEKsUm81/aBgRNnyPlGWx87VETw2RLMyI9Ianw9zoPd9Ft
# KkYkL86J2O8LaQTKVQsjUxYFr/0ddxjhBE0lOl/nXgYnrxplyKCPEPxSLv9MuK0+
# OxpsRIXFrNh3HHzbfmGsBnEqtOw8GKtRJEep6yS07bVCL9+jsj68nyZgPzVK6XS1
# bBAJByVwAnRpqQKjlViOXlKvr+L92ivdWt+RymsK7Dlzwxna/E5qhhdF0aAA62zU
# BdxIuG+RUiMhgKpWy/LBr6XpzuqOj5T/prrNadU3OqGxW5fxe4oxfvGQRCmk6Hcq
# BDmKn7hIMPM6Qzan1jQJHJKuACjI0nZWmiuR+XhabJSNwkhCDYNI8rwJ9NeQ43dy
# gcmyiyzuE6x+e1c6PXjRTUZxND1vEGJ7/zyzhGbQhzPEX8YiQ0mH7NsbTF/GGU2N
# KvnCiuqjnzCvUg5kDGpKjQ3lkpiM6dpZYHRq3RiuoWOiywrdizIrImYaZUkVts4W
# b4CiTEnmLN7nR9yVskIeUJ3qPU2GGG51VfPsSe4DZMM53YvMvIkVyzDXf8zin7Gm
# shziBMLC578KfDqvNtC+/qRDG9QalMvuuRQ8DM58a5+BEfSyrDyWs4Sq0CGTKkNF
# 5Jz7DLcrHJRYs94NABEBAAH+BwMCiuWUfDJIwsD/ktQxAIKORT3kJ7DYyNaJX9Qh
# A6ByML4UD/LnH/EjRz+NoQL0P2kvoniyWQurTlZPnCy05ip6Pbu3XoLHnj1we2/U
# q8RrWypw1TWNtIn2E/Xc/alA8zJIeBxSTC/y2xjBL7axFGbv8fG3YB32XAffoMY2
# XkDPXd0JbOL1m1S2RmOBPn5Zshk1lRIG2L+8tgzHB+z7WZKCnWdsEypx8RuY3DH3
# MsNFH0nF5xE2ooHIjs7ywt86g7g69Kz5oJ9G4GTTxrvAxCFsz8diB5Uu9a8Zn+Rm
# vuAjtpm5uPtvgJOgM8/cLAESqXl896kGNRsl9fH3WgR226At1PyuCanzx+GncQRp
# 93p+gHNDdzXmT8knBD82X7UDd4S0oeOLz4yR5P/Rnml4Ohe3P2xRXOw+UEGwtins
# 8DbU0Y6Q8pVRY5wapbi8AT9QTJmptGVyc4x9O3l4MGwhyk9/noNB9phl9ys/YjIB
# 0l4YiQNJBcRhnoNk4QET50/jNbP/PAJSzCFhkTBaToyUHpMRD8W2+joCcp9msh4L
# qY6kDQC4AhTjU6p79lbwp358cZZrD9AoW2APUAo6ASRvnvKbU1Fl4W7/9YfGAm7j
# dpx9fTof76x2hyigzg30GowD1gQIifwon/bGmcJX+aiH6IW1L1BqUkcaufFkW1HI
# c/XLMteifwHHKcPZ4Xpdt6tGXms72HuBpuhzZXFUrdS+XKcmiUMRPu++7Sj6yoY9
# 99BYmlo0RjMXGbpx0YhSaWocfctbnXzVrN86OOcvZldP7SNNzLPnuCTalLTMwNR3
# maXyw2Ofktvmm+xBT9ejb5CyvvV3LeAdjJv/ebKQ4HSPXxAXK1H2pQZwzCoIBB4K
# GcV9qkPrJmDVLgD1CW/Po+cgozzeBaWDzHqGaPOPcedxKtOEfxtbz3CxmDcJ+K6u
# /VEj/gLEUrBdGUhifSWDmNTI4/tkLAlIOJI8krXHh1V15cS2A9UHsqG7KUXZrY1L
# 3zlEs2BYC6BeiIDY4APlskZmQzw8naYsTJnd41VuoRJumLcVvkT3hqHeDWmBUCwK
# wKW+2iIlYwg5ytfj13udIWTZ+IrViX08l9Af3wbwbpSgVy4c4SIpjCfEnDfgNBOp
# BlmDQ0AQbdE0MEmbhsXUF4+yUJvsDRtJ9ohje3eHar3syWXbUOjfRTToB+3NQnyt
# wIOM7UJ1tCk32exEKxN/rdFDWh+Jt/RNBrVx34NHNeDOr/uTgHutkf65et5X8tRD
# o4vqPOu3UDuKmuZgiVS0jMhveQJHKZkURsTJtrMa2zIEPegLo1l9ZkYGD9ATd6mS
# pgrI8KRMYUnqI+NoPwudb2cCL3/KUum7AuKMU+aWOphrgWjNkplPDszV1xXt/Wd0
# teDE497/xAHciZyu3XhgkIHHTkyzsXBM53/avQb6PENqFqqmtpyTEyw2zvtamqMu
# UOcpwG0RZXNXWUfNiCw3gbQHxaCvX8mw+EZyLagKWNmvQTHeyQeQa7gQ6Vz9SPe7
# 8zWW71xLynWVa/qDI7O/nI2RPYCRn7p/8wRZZKuosWUkz+5lcBPuiUb2b+eLC6Nx
# GtRp3vFLmmyVHb7n+LEa5TsCqWA8k98D823yEBLPtiH8myLAYG7CM++Pb6gr2UR/
# vXMkZXQOs8P5sfhy93v2IAzIe2aDGAIQJKiDIAzEGZPxtB0bdD29iVPajubfbESp
# Zrn4sPQ2sgxGr26nsHOav4zoiFAblt7ZOqXNtR94c3mzFChjYYr+EU7P8r53aeK1
# Hx5Ie0ZX6ZzYR4kCPAQYAQoAJhYhBIZ84O/8bU/SqSUyOEjpUVu6e5roBQJpwTFv
# AhsMBQkB4TOAAAoJEEjpUVu6e5robfsP/2JY4H264o2HQGa0GAmDsRI4H4avyK1M
# LJlt9j8s4US3WNHGs2bXUzcRwPueHk1V55S6K+85QaldRT+ae8O63/wLe/32K63j
# HOe18bXD0yMCAOHAywoyE8k1PV2HTKb+AiOsqnDRK305bgDusSOIOj/4T9Ney5ds
# tuZUtoOFftxVBhlff6ntsgCbrQaFmUG3syNVz2tkowl+EUy01oNusKBK7S7VyHaa
# toRejSR14QvVcfuGHZrgwVPGl4CDzouR2Igbn5SIhYP9/e0ftd4ukG6XNIN47T01
# ZG12tQKPHyNDg6/fBh60bNKhtTEogjvsy2BoYXgXwzeX6J1AtFCUc/ViEv0IbMdn
# U+i/lnlsbfj51O+y/qgSzNFvrvWJAiiTKCdA+wWrupmyxyP2nNzOeYBh57ev/7JQ
# z5nzkoOIEn+uji98zrptx4EZkNFkAcvDh37ER37PGRWp/caPwJdj93L8lppKPdre
# Kxveu4JTnyTJiRTJlty2tDXlrsX3HTOi8JzqdUDQhNx6/WW4HjPQX4nNlpAYFIsH
# htvLJdLsjwcpKLrL/mEVi4J4jK9T9zhIC5VmColRVLEPton9G90xlRIaTaGS1dtD
# akw1rGyJx/DDuj5JaVe+SiehdOP78r9Rrz8j/aSwmu/icQkUU3gOed6P6j19s2Iv
# 0gvSD7Y0E7zv
# =ETVs
# -----END PGP PRIVATE KEY BLOCK-----

gpg --import llave_de_MIPANA.asc # Importo la llave de mi compañero
# gpg: key 35513F1E4D3380C9: public key "Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>" imported
# gpg: Total number processed: 1
# gpg:               imported: 1

gpg --list-keys

# pub   rsa4096 2026-03-23 [SC] [expires: 2027-03-23]
#      867CE0EFFC6D4FD2A925323848E9515BBA7B9AE8
# uid           [ultimate] Francis Acuña (Hola) <panchode05@gmail.com>
# sub   rsa4096 2026-03-23 [E] [expires: 2027-03-23]

# pub   rsa4096 2026-03-18 [SC] [expires: 2027-03-18]
#      9A8C1BA9AADE1E5F261A6B8A35513F1E4D3380C9
# uid           [ unknown] Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>
# sub   rsa4096 2026-03-18 [E] [expires: 2027-03-18]

echo "¿Un billar?" > doc_no_cifrado.txt

gpg --output doc_cifrado.txt --encrypt --recipient 9A8C1BA9AADE1E5F261A6B8A35513F1E4D3380C9 doc_no_cifrado.txt

# gpg: 1A4B43578FF5785F: There is no assurance this key belongs to the named user

# sub  rsa4096/1A4B43578FF5785F 2026-03-18 Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>
# Primary key fingerprint: 9A8C 1BA9 AADE 1E5F 261A  6B8A 3551 3F1E 4D33 80C9
#      Subkey fingerprint: AFD8 EBCC AC63 3B99 E077  8486 1A4B 4357 8FF5 785F

# It is NOT certain that the key belongs to the person named
# in the user ID.  If you *really* know what you are doing,
# you may answer the next question with yes.

# Use this key anyway? (y/N) y

gpg --decrypt mensaje_cifrado.txt

# gpg: encrypted with rsa4096 key, ID 545A4A9128BC82C3, created 2026-03-23
#      "Francis Acuña (Hola) <panchode05@gmail.com>"
# Hola Francisco David

gpg --clearsign mensaje_cifrado.txt

gpg --sign mensaje_cifrado.txt.asc

gpg --detach-sign mensaje_cifrado.txt.asc.gpg

gpg --verify Ivan.txt.asc

# Signature made Wed Mar 25 16:13:47 2026 UTC
#                using RSA key 9A8C1BA9AADE1E5F261A6B8A35513F1E4D3380C9
# Good signature from "Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>" [unknown]
# WARNING: This key is not certified with a trusted signature!
#          There is no indication that the signature belongs to the owner.
# Primary key fingerprint: 9A8C 1BA9 AADE 1E5F 261A  6B8A 3551 3F1E 4D33 80C9

gpg --edit-key 9A8C1BA9AADE1E5F261A6B8A35513F1E4D3380C9

#gpg (GnuPG) 2.4.4; Copyright (C) 2024 g10 Code GmbH
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.


#pub  rsa4096/35513F1E4D3380C9
#     created: 2026-03-18  expires: 2027-03-18  usage: SC  
#     trust: unknown       validity: unknown
#sub  rsa4096/1A4B43578FF5785F
#     created: 2026-03-18  expires: 2027-03-18  usage: E   
#[ unknown] (1). Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>

#gpg> trust
#pub  rsa4096/35513F1E4D3380C9
#     created: 2026-03-18  expires: 2027-03-18  usage: SC  
#     trust: unknown       validity: unknown
#sub  rsa4096/1A4B43578FF5785F
#     created: 2026-03-18  expires: 2027-03-18  usage: E   
#[ unknown] (1). Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>

#Please decide how far you trust this user to correctly verify other users' keys
#(by looking at passports, checking fingerprints from different sources, etc.)

#  1 = I don't know or won't say
#  2 = I do NOT trust
#  3 = I trust marginally
#  4 = I trust fully
#  5 = I trust ultimately
#  m = back to the main menu

#Your decision? 4

#pub  rsa4096/35513F1E4D3380C9
#     created: 2026-03-18  expires: 2027-03-18  usage: SC  
#     trust: full          validity: unknown
#sub  rsa4096/1A4B43578FF5785F
#     created: 2026-03-18  expires: 2027-03-18  usage: E   
#[ unknown] (1). Ivan Fernando Gualotuña Bolagay (12345678) <ivanfernando10q@gmail.com>
#Please note that the shown key validity is not necessarily correct
#unless you restart the program.

