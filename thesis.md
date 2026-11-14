# Steganography and Cryptographic Messaging

*Architecture, Security Fundamentals, Implementation Plan, and Threat Model*  
Design thesis and implementation blueprint | 25 October 2026

> **Document status:** Consolidated design thesis and implementation blueprint. This document corrects earlier exploratory code and is not a security audit or a claim that a complete application has already been implemented.

## Abstract

This document consolidates the design developed for a Python web application that encrypts a text message and embeds the resulting ciphertext in an image. It separates cryptographic key derivation, authenticated encryption, steganographic embedding, web application responsibilities, transport security, and operational concerns. It also corrects several unsafe or technically inaccurate ideas that appeared in earlier exploratory examples.

The central recommendation is to use Argon2id for password-based key derivation, XChaCha20-Poly1305 for authenticated encryption, a carefully specified image embedding/extraction method, and HTTPS for browser-to-server communication. Cryptography and steganography serve different purposes: encryption protects the message's contents, while steganography attempts to conceal the presence of a message. Neither should be mistaken for a substitute for the other.

## 1. Purpose and Scope

The proposed application accepts a carrier image, a password, and text to protect. It derives a key from the password and a random salt, encrypts the message, embeds the resulting binary payload in an image, and returns the modified image. A recipient can upload the resulting image, supply the password, extract the payload, and decrypt the message.

The intended system is a learning-oriented prototype that can be developed into a carefully reviewed application. The examples and architecture in this document are not a cryptographic certification. Before protecting high-value information, the implementation should be reviewed, tested, and threat-modelled by qualified security practitioners.

## 2. Fundamental Concepts

2.1 Encryption. Encryption transforms readable plaintext into ciphertext using a key. Correctly implemented authenticated encryption also detects unauthorized modification of the encrypted payload.

2.2 Steganography. Steganography embeds data in a carrier, such as an image, with the goal of making the existence of the data less apparent. It does not inherently encrypt or authenticate the hidden data.

2.3 Key derivation. A key derivation function (KDF) transforms input material, such as a password, into a cryptographic key of a specified length. Passwords usually have much less entropy than randomly generated keys, so password-based derivation should be deliberately expensive.

2.4 Salt. A salt is a non-secret, usually random value supplied to a password-based KDF. It prevents identical passwords from automatically producing identical derived keys when different salts are used, and makes precomputed password attacks less reusable. The salt must be stored with the encrypted payload; it is not itself a password or secret key.

2.5 Nonce. A nonce is a value used by an encryption algorithm for an individual encryption operation. XChaCha20-Poly1305 uses a 24-byte nonce. Generate a fresh nonce for every encryption operation and never reuse a nonce with the same key.

2.6 Authentication tag. XChaCha20-Poly1305 appends an authentication tag to the ciphertext. Decryption must verify this tag before accepting the plaintext. If verification fails, the application must return a generic failure and must not release unauthenticated plaintext.

## 3. Recommended Cryptographic Design

3.1 Password-based key derivation. Prefer Argon2id, a password-hashing/key-derivation construction designed to make large-scale password guessing expensive. Choose memory, time, and parallelism parameters through benchmarking on the target environment. The parameters should be recorded in the payload format or its metadata so that the recipient can derive the same key later. Do not silently choose very weak parameters just to make the application feel fast.

3.2 Salt generation. Generate a fresh random salt for each independently encrypted payload, for example with Python's secrets.token_bytes(16). Store the salt alongside the ciphertext. A 16-byte salt is a reasonable conventional starting point, subject to the selected library and protocol requirements.

3.3 Authenticated encryption. Use a vetted implementation of XChaCha20-Poly1305. Do not manually combine a stream cipher and a separate authenticator, and do not use ad hoc padding. XChaCha20-Poly1305 is an AEAD construction and accepts arbitrary-length plaintext.

3.4 Nonce generation. Generate a fresh 24-byte nonce for each encryption operation. The nonce is not a secret and must be available to the recipient. Do not reuse it with the same key.

3.5 Payload format. Use a versioned, unambiguous binary format. A practical conceptual layout is: magic identifier, format version, KDF identifier and parameters, salt length and salt, nonce, ciphertext including authentication tag, and any required length fields. The precise encoding must be specified and tested; do not rely on informal string concatenation or guesswork during extraction.

3.6 Key separation. Keep the password-derived key inside the cryptographic layer. If a future design derives multiple keys from one shared secret, use a standard KDF such as HKDF with explicit context labels to separate purposes. Avoid reusing one key for unrelated cryptographic functions.

## 4. Argon2 and Salt: Correct Mental Model

The password and salt are inputs to Argon2id. Argon2id produces a derived key, typically 32 bytes for a 256-bit symmetric key. XChaCha20-Poly1305 then uses that key and a fresh nonce to encrypt the message.

Conceptually: password + random salt + KDF parameters → Argon2id → key; key + nonce + plaintext → XChaCha20-Poly1305 → ciphertext and authentication tag.

The salt does not need to be hidden in the image, and hiding it provides no meaningful cryptographic secrecy. Keeping it in the encrypted payload's public metadata is simpler and more robust. A fixed demonstration salt such as the text 'salty' should not be used as a production default.

A salt is not the same as a pepper. A pepper is a separate secret value kept outside the stored password-derived record. A pepper introduces key-management and recovery requirements and is not needed for the basic message-encryption design described here.

## 5. Why XChaCha20-Poly1305 Instead of Hand-Built Encryption

XChaCha20-Poly1305 provides confidentiality and integrity in one established construction. The extended nonce makes random nonce generation practical for applications encrypting many messages under a key, although nonce reuse must still be avoided.

Use a maintained library that exposes XChaCha20-Poly1305 directly. Do not assume that every version of the Python cryptography package provides this exact algorithm. Confirm the API and version of the chosen dependency; PyNaCl/libsodium is a common option for XChaCha20-Poly1305 in Python.

Earlier exploratory snippets attempted to construct XChaCha20-Poly1305 using low-level Cipher, algorithms, and modes APIs, and in some cases paired XChaCha20 with Poly1305 as if they were interchangeable generic modes. Those examples are not valid production implementations. Use the high-level AEAD API provided by a vetted library.

## 6. Software Architecture and Separation of Responsibilities

The application should separate the cryptographic workflow from image processing and web request handling. This improves testability, makes security boundaries visible, and reduces the chance that a change to one component silently breaks another.

Recommended conceptual modules:

- Argon2KeyDerivation: accepts a password, salt, and approved Argon2id parameters; derives a key. It does not manipulate images or handle HTTP requests.
- XChaEncryption: wraps a vetted XChaCha20-Poly1305 implementation; encrypts and decrypts byte strings and handles nonce and authentication-tag semantics according to the chosen library API.
- SecureCommunicator: orchestrates key derivation and authenticated encryption. It creates or consumes the payload metadata and exposes simple encrypt/decrypt methods. It should not implement steganography.
- DCTSteganography or another embedding module: accepts image bytes or a decoded image and a binary payload; embeds or extracts the payload. It should not derive keys or decrypt messages.
- Flask application layer: validates uploads and form fields, invokes the service classes, returns a generated image or a decryption result, and maps errors to safe responses.
The class names are design labels, not a claim that the earlier example implementations were complete or correct. Interfaces should be settled before files are implemented so that byte formats, method arguments, and return values remain consistent.

## 7. Suggested Project Structure

stego_app/

```text
app.py
```

```text
requirements.txt
```

```text
README.md
```

```text
modules/
```

```text
__init__.py
```

```text
encryption/
```

```text
__init__.py
```

```text
argon2_kdf.py
```

```text
xchacha.py
```

```text
secure_communicator.py
```

```text
steganography/
```

```text
__init__.py
```

```text
dct.py
```

```text
payload_format.py
```

```text
services/
```

```text
__init__.py
```

```text
image_loader.py
```

```text
validation.py
```

```text
templates/
```

```text
index.html
```

```text
result.html
```

```text
static/
```

```text
css/
```

```text
styles.css
```

```text
tests/
```

```text
test_encryption.py
```

```text
test_payload_format.py
```

```text
test_steganography.py
```

```text
test_routes.py
```

The application should preferably accept image uploads rather than arbitrary remote image URLs. If URL fetching is required, it must be designed to prevent server-side request forgery (SSRF), restrict schemes and destinations, limit redirects and response sizes, and enforce timeouts.

## 8. End-to-End Encryption Workflow

Encryption workflow:

1. Validate the request and enforce message and image size limits.

2. Read and decode the carrier image using a safe image-processing library.

3. Generate a fresh random salt and derive a key using Argon2id and the stored KDF parameters.

4. Generate a fresh 24-byte XChaCha20-Poly1305 nonce.

5. Serialize the plaintext as bytes using a specified encoding, normally UTF-8.

6. Encrypt with the vetted AEAD implementation. The encrypted payload must include enough metadata for the recipient to derive the key and identify the nonce.

7. Embed the complete payload in the image using the selected steganographic method. Check capacity before modifying the image.

8. Save the output in a format that preserves the embedding. For a simple spatial-domain scheme, lossless PNG is generally safer than JPEG recompression.

9. Return the generated image as a download and avoid logging passwords, plaintext, keys, or sensitive ciphertext metadata unnecessarily.

## 9. End-to-End Decryption Workflow

1. Accept the stego image as an upload and validate its file type, dimensions, and size.

2. Extract the payload using the matching steganography algorithm and its framing rules.

3. Parse the versioned payload with strict length and parameter checks. Reject malformed or implausibly expensive KDF parameters before performing resource-intensive work.

4. Read the salt, nonce, and ciphertext from the payload.

5. Ask the user for the password and derive the key using the same KDF parameters.

6. Run authenticated decryption. If the password is wrong or the payload was modified, authentication should fail.

7. Return plaintext only after successful authentication. Do not reveal whether a failure was caused by a wrong password, a modified image, or malformed ciphertext unless the application has a compelling reason to distinguish those cases.

## 10. Steganography: LSB and DCT

10.1 LSB substitution. Least-significant-bit methods alter low-order pixel bits to encode data. They are straightforward to understand and implement, but naive implementations are easy to detect statistically and can be destroyed by resizing, filtering, colour conversion, or lossy compression.

10.2 DCT-based embedding. The Discrete Cosine Transform represents image data in terms of frequency coefficients. Carefully designed schemes can embed data in selected coefficients, often in block-based transforms. However, simply applying a DCT to an entire multi-channel image and replacing the parity of every coefficient is not a correct robust DCT steganography scheme.

10.3 Important correction to the earlier code. The previous sample used cv2.dct on a three-dimensional image array, treated arbitrary coefficient integer parity as a bit channel, repeated the secret text cyclically, and did not encode a length or authenticated framing. OpenCV's DCT API and its input dimensionality requirements also make that exact approach unsuitable as written. The decode example did not reliably reverse the encoding. Do not use those snippets as a working implementation.

10.4 Practical recommendation. Start with a documented, tested lossless PNG embedding scheme with explicit payload length, capacity checks, and an end marker or length prefix. Once the end-to-end encrypted payload format works, evaluate a well-studied transform-domain method if resilience against ordinary image transformations is a requirement. DCT is not automatically more secure or more robust simply because it sounds mathematically impressive.

10.5 Capacity. Payload capacity depends on image dimensions, channels, embedding rate, framing overhead, and the method used. Capacity must be computed before embedding. If the encrypted payload does not fit, reject the operation rather than truncating data or repeating bits.

## 11. Flask Web Application and User Interface

The browser interface can provide an encryption form with an image upload, password, and message, and a decryption form with an image upload and password. A salt field is not necessary in the normal user experience when the server generates a random salt and stores it in the payload.

The encryption endpoint should return a downloadable generated image, not simply report that the operation succeeded. The decryption endpoint should return plaintext only after successful authenticated decryption. Use separate routes or a clearly structured service layer, and avoid storing temporary uploads indefinitely.

Validate every input server-side. HTML form validation improves usability but is not a security boundary. Set request-size limits, image pixel limits, processing timeouts, and clear error handling. Use secure temporary-file handling and clean up temporary artifacts.

For deployment, run Flask behind a production WSGI server and a properly configured reverse proxy or hosting platform. Do not deploy Flask's development server or debug mode to the public internet.

## 12. Browser-to-Server Transport Security

Use HTTPS with modern TLS for all browser-to-server traffic. TLS provides encryption in transit, integrity protection, and server authentication when certificate validation is performed correctly. HTTPS is the baseline; a custom JavaScript encryption layer is not a substitute for it.

PyCryptodome is a Python library and does not run directly in an ordinary browser page. Browser-side cryptography can use the Web Crypto API, but client-side encryption adds key-management, compatibility, and implementation complexity. If the browser encrypts with a public key, the server must have a corresponding private key, and the public key must be authenticated so an attacker cannot substitute their own.

Client-side encryption may be valuable if the goal is to prevent the application server from seeing plaintext. That is a distinct threat model from merely protecting data in transit. It requires a carefully designed protocol, authenticated key distribution, and attention to JavaScript delivery: a compromised server could serve malicious code that captures secrets before encryption.

For the first version, use HTTPS and keep cryptographic processing in a clearly defined backend service. If a zero-knowledge or server-blind design becomes a requirement, treat it as a separate architectural milestone.

## 13. Diffie-Hellman and Elliptic-Curve Diffie-Hellman

Diffie-Hellman (DH) and Elliptic-Curve Diffie-Hellman (ECDH) allow two parties to derive a shared secret over a network without transmitting the shared secret itself. ECDH uses elliptic-curve operations and can provide strong security with comparatively compact public keys.

Key exchange is not automatically authentication. An unauthenticated DH/ECDH exchange is vulnerable to a man-in-the-middle attack: an attacker can establish separate shared secrets with both parties. Real protocols authenticate the exchange, often using certificates, signatures, or a pre-established trust relationship.

For a browser-to-server application, TLS already performs authenticated key agreement and derives traffic keys. A separate key-exchange server is not normally needed just to protect web traffic. If the system later needs end-to-end encrypted communication between users, use an established protocol or vetted library rather than inventing a bespoke exchange protocol.

Argon2 and ECDH solve different problems. Argon2 derives a key from a password. ECDH establishes shared secret material between parties with key pairs. They are not interchangeable, and combining them should only be done through a specified, reviewed protocol.

## 14. Image-Derived Credentials and Hidden Factors

The project explored making access depend on a separate image, perhaps by hashing the image and using the result as additional secret material. This can create a possession factor, but only if the image data is stable, securely controlled, and not easily replaceable or copied by an attacker.

Hashing an image and calling the result a salt does not make the image a secret. If the image is public, its hash is public too. If the image is modified or recompressed, its hash may change completely, causing permanent lockout unless recovery is provided.

If image possession is a genuine requirement, treat the image as a key file or credential input rather than as a salt. Define how the exact bytes are obtained, how backups and recovery work, how users replace the credential, and how compromise is handled. Consider a dedicated random key file or hardware-backed credential instead of relying on an image's pixels.

A hidden text fragment inside an image may be used as an additional factor in an experimental design, but it should not be treated as a substitute for cryptographic key management. If it is meant to be secret, it needs adequate entropy, protected storage, and a secure recovery strategy.

## 15. Threat Model and Security Boundaries

Assets to protect include plaintext messages, passwords, derived keys, encryption metadata, and any sensitive relationship between the carrier image and the hidden payload.

Potential adversaries include network eavesdroppers, users who obtain a stego image but not the password, attackers who modify the image or ciphertext, malicious uploaders, and attackers attempting to exhaust server resources.

Security goals include confidentiality of message contents, detection of tampering, bounded resource use, and reasonable concealment of the payload's existence. These goals are different. AEAD can detect ciphertext modification, but it does not prevent detection of steganography. Steganography can conceal a payload's existence, but it does not stop decryption if the password is compromised.

Out of scope for a simple prototype are guarantees against a compromised endpoint, malicious browser extensions, a compromised server, a malicious operating system, or advanced steganalysis under an unspecified adversary model. These risks should be documented rather than hidden behind claims of being 'unbreakable'.

## 16. Common Failure Modes and Corrections

- Incorrect primitive composition: do not construct XChaCha20-Poly1305 from incompatible low-level cipher and mode classes. Use a vetted high-level AEAD implementation.
- Reusing a salt: generate a fresh random salt for each independent password-derived payload and store it with the payload.
- Reusing a nonce: generate a fresh nonce for every encryption operation under a given key.
- Missing payload framing: include a version and explicit lengths so extraction knows exactly how many bytes to read.
- No capacity check: verify that the full serialized encrypted payload fits before embedding.
- Treating a URL as a local file path: safely fetch and validate a remote image if URL input is supported; do not pass a URL directly to an image library expecting a filesystem path.
- JPEG output after fragile embedding: use a format and embedding method that preserve the embedded data. JPEG recompression can destroy spatial-domain payload bits.
- Incorrect DCT implementation: the earlier whole-image DCT parity example is illustrative only and should not be used. Implement and test a specified method.
- Missing nonce and salt during decryption: package them with the ciphertext; do not rely on variables left over from an earlier request.
- Reusing a KDF object: many KDF implementations permit derive() only once per instance. Create a new KDF object for each derivation, or use the chosen library's documented interface.
- Revealing plaintext before tag verification: return plaintext only if AEAD authentication succeeds.
- Debug deployment: never expose Flask debug mode to untrusted networks.
- Overclaiming security: using several algorithms does not automatically create a stronger system. Correct composition, key management, and tested implementations matter more than algorithm count.
## 17. Testing and Verification Plan

Unit tests should verify that encryption followed by decryption returns the original byte sequence; a wrong password fails; a modified ciphertext fails authentication; random salts and nonces are generated as expected; and malformed payloads are rejected safely.

Steganography tests should cover empty payloads, payloads at maximum capacity, oversized payloads, binary data containing zero bytes, Unicode messages, corrupted images, unsupported image formats, and extraction from saved output files. Test the actual save/reopen path rather than only in-memory arrays.

Integration tests should exercise the Flask upload and download routes, confirm that temporary files are cleaned up, and check that errors do not leak passwords, keys, plaintext, stack traces, or server filesystem paths.

Security testing should include dependency review, file upload fuzzing, resource-exhaustion checks, SSRF checks if URL fetching exists, HTTPS configuration review, and a threat-model review before public deployment.

## 18. Implementation Roadmap

Phase 1: Establish the environment and dependencies. Pin supported package versions and document the supported Python version.

Phase 2: Implement and test Argon2id derivation and XChaCha20-Poly1305 encryption/decryption independently. Use the library's high-level APIs.

Phase 3: Define and test a versioned binary payload format containing KDF parameters, salt, nonce, and ciphertext.

Phase 4: Implement a simple lossless-image embedding method with payload framing and capacity checks. Verify byte-for-byte recovery after saving and reopening the image.

Phase 5: Add the SecureCommunicator orchestration class and test the complete cryptographic workflow.

Phase 6: Integrate the services into Flask with upload validation, safe responses, size limits, temporary-file cleanup, and HTTPS deployment guidance.

Phase 7: Evaluate the threat model and decide whether a more robust transform-domain steganography method, client-side encryption, or a user-to-user authenticated key exchange is actually required.

Phase 8: Conduct security review and publish clear limitations and recovery procedures.

## 19. Glossary

AEAD: Authenticated Encryption with Associated Data. A construction that provides confidentiality and integrity/authenticity for encrypted data.

Argon2id: A password hashing and key derivation variant designed to make password guessing expensive, using both memory and computation.

Ciphertext: The encrypted representation of plaintext.

DCT: Discrete Cosine Transform, a transform used in image and signal processing.

ECDH: Elliptic-Curve Diffie-Hellman, a key-agreement method.

KDF: Key Derivation Function, a function that derives cryptographic key material from input material.

LSB: Least Significant Bit, often used in simple image data embedding.

Nonce: A value used once per encryption operation under the relevant key, according to the algorithm's requirements.

Plaintext: The original readable message before encryption.

Salt: A non-secret random input to password-based key derivation.

Steganalysis: Techniques used to detect or analyse hidden data.

Steganography: Concealing the existence of a message within a carrier.

TLS: Transport Layer Security, the protocol used by HTTPS to protect network traffic.

## 20. Final Recommendations

Use Argon2id with a fresh random salt, XChaCha20-Poly1305 through a vetted high-level library, and a fresh 24-byte nonce for each encryption operation. Store the salt, nonce, KDF parameters, version, and ciphertext in a defined payload format.

Keep the key derivation, authenticated encryption, steganography, and web routes in separate modules. Let a small orchestration class connect the cryptographic components; do not bury cryptography inside the image-processing code.

Use HTTPS for all browser/server communication. Prefer image uploads over arbitrary remote URLs unless safe URL fetching is a real requirement. Begin with a tested lossless image embedding approach and do not rely on the earlier DCT parity snippets.

Do not claim that a hidden image or multiple layers of algorithms make the system invulnerable. The strongest practical design is one whose cryptographic primitives are standard, whose interfaces are precisely specified, whose failure cases are tested, and whose limits are honestly documented.

## Appendix A: Conceptual Data Flow

**ENCRYPTION**

User message → UTF-8 bytes → Argon2id(password, random salt) → key → XChaCha20-Poly1305(key, fresh nonce, plaintext) → versioned payload → steganographic embedding → lossless output image.

**DECRYPTION**

Input image → extract payload → validate version and lengths → read salt, nonce, and ciphertext → Argon2id(password, salt, parameters) → key → authenticated decryption → plaintext only after tag verification.

**TRANSPORT**

Browser ⇄ HTTPS/TLS ⇄ Flask application. TLS protects traffic in transit; payload encryption protects message contents beyond the transport connection, subject to password and endpoint security.

## Appendix B: Deployment Checklist

- [ ] Supported Python and dependency versions documented and pinned.
- [ ] Argon2id parameters benchmarked and validated.
- [ ] Random salt and nonce generated using a cryptographically secure random source.
- [ ] AEAD high-level API used correctly; no custom cipher composition.
- [ ] Payload format versioned, length-delimited, and tested.
- [ ] Image capacity checked before embedding.
- [ ] Output format preserves the embedding.
- [ ] Upload size, image dimensions, and processing time bounded.
- [ ] URL fetching, if present, protected against SSRF.
- [ ] HTTPS enabled and certificates validated.
- [ ] Flask debug mode disabled in production.
- [ ] Passwords, keys, and plaintext excluded from logs.
- [ ] Temporary files securely managed and cleaned up.
- [ ] Wrong-password, tampering, malformed-input, and capacity tests pass.
- [ ] Recovery and limitations documented.
- [ ] Security review completed before use with high-value data.


## Styled diagrams

The companion diagram assets in `../diagrams/` provide a styled visual treatment of the proposed architecture and design decisions:

1. ![Proposed trust boundaries](../diagrams/01-trust-boundaries.png)
2. ![Message and carrier flow](../diagrams/02-message-carrier-flow.png)
3. ![Design decision register](../diagrams/03-design-decisions.png)

These figures illustrate a proposed design only. They are not evidence of an implemented or audited protocol.
