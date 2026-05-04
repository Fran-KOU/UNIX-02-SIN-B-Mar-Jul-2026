import crypt
password = 'micontraseña123'
salt1 = crypt.mksalt(crypt.METHOD_SHA512)
salt2 = crypt.mksalt(crypt.METHOD_SHA512)
has1 = crypt.crypt(password, salt1)
has2 = crypt.crypt(password, salt2)
print('Salt 1:', salt1)
print('Hash 1:', hash1[:50])
print()
print('Salt 2:', salt2)
print('Hash 2:', hash2[:50])
print()
print('¿Son iguales?', hash1 == hash2)