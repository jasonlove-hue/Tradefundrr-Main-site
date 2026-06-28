from PIL import Image
import colorsys
import os

def rgb_to_hsv(r, g, b):
    return colorsys.rgb_to_hsv(r/255.0, g/255.0, b/255.0)

def hsv_to_rgb(h, s, v):
    r, g, b = colorsys.hsv_to_rgb(h, s, v)
    return int(r*255), int(g*255), int(b*255)

def recolor_image(input_path, output_path, target_hue):
    img = Image.open(input_path).convert('RGBA')
    pixels = img.load()
    
    for y in range(img.height):
        for x in range(img.width):
            r, g, b, a = pixels[x, y]
            
            if a == 0:  # Skip transparent pixels
                continue
            
            h, s, v = rgb_to_hsv(r, g, b)
            
            # Shift hue to target, keep saturation and value
            new_r, new_g, new_b = hsv_to_rgb(target_hue, s, v)
            pixels[x, y] = (new_r, new_g, new_b, a)
    
    img.save(output_path, 'WEBP', quality=90)
    print(f"✓ Recolored: {output_path}")

# Recolor crypto full-size (purple)
recolor_image(
    'assets/images/market-crypto.webp',
    'assets/images/market-crypto.webp',
    0.75  # Purple hue
)

# Recolor crypto thumbnail (purple)
recolor_image(
    'assets/images/market-crypto-thumb.webp',
    'assets/images/market-crypto-thumb.webp',
    0.75  # Purple hue
)

# Recolor futures full-size (blue)
recolor_image(
    'assets/images/market-futures.webp',
    'assets/images/market-futures.webp',
    0.6   # Blue hue
)

# Recolor futures thumbnail (blue)
recolor_image(
    'assets/images/market-futures-thumb.webp',
    'assets/images/market-futures-thumb.webp',
    0.6   # Blue hue
)

print("\n✓ Recoloring complete!")