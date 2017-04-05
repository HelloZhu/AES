[![github](https://github.com/dd2333/DDPhotoAlbum/blob/master/dd2333.png "dd2333")](http://www.dd2333.com)

AES
===================================
  AES 128 ECB PKCS7Padding.<br />

Requirements
-----------------------------------
* ARC<br />

Usage
-----------------------------------

### Cocoapods import:
* Pop is available on CocoaPods. Just add the following to your project Podfile:<br />

  ```pod 'AES', '~> 1.0.0'```

* Use by including the following import:<br />
```#import <AESCrypt.h>```

### Manual import：
* Drag All files in the AESCrypt folder to project<br />
* Use by including the following import:<br />
```#import "AESCrypt.h"```

### Open the Album
    NSString *str = @"hello world";
    NSString *passwd = @"1234567890abcdef";
    
    NSString *ciphertext = [AESCrypt encrypt:str password:passwd];
    NSString *plaintext = [AESCrypt decrypt:ciphertext password:passwd];
    

Java source code
-----------------------------------
    import javax.crypto.Cipher;
    import javax.crypto.spec.SecretKeySpec;

    import org.apache.commons.codec.binary.Base64;

    public class AES {

        // 加密
        public static String Encrypt(String sSrc, String sKey) throws Exception {
            if (sKey == null) {
                System.out.print("Key为空null");
                return null;
            }
            // 判断Key是否为16位
            if (sKey.length() != 16) {
                System.out.print("Key长度不是16位");
                return null;
            }
            byte[] raw = sKey.getBytes("utf-8");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");//"算法/模式/补码方式"
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
            byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));

            return new Base64().encodeToString(encrypted);
        }

        // 解密
        public static String Decrypt(String sSrc, String sKey) throws Exception {
            try {
                // 判断Key是否正确
                if (sKey == null) {
                    System.out.print("Key为空null");
                    return null;
                }
                // 判断Key是否为16位
                if (sKey.length() != 16) {
                    System.out.print("Key长度不是16位");
                    return null;
                }
                byte[] raw = sKey.getBytes("utf-8");
                SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                cipher.init(Cipher.DECRYPT_MODE, skeySpec);
                byte[] encrypted1 = new Base64().decode(sSrc);
                try {
                    byte[] original = cipher.doFinal(encrypted1);
                    String originalString = new String(original,"utf-8");
                    return originalString;
                } catch (Exception e) {
                    System.out.println(e.toString());
                    return null;
                }
            } catch (Exception ex) {
                System.out.println(ex.toString());
                return null;
            }
        }
    }

License
-----------------------------------
  AES is released under the MIT license.<br />
