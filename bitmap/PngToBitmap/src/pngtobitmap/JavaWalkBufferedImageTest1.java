package pngtobitmap;

import java.awt.Component;
import java.awt.image.BufferedImage;
import java.io.IOException;
import javax.imageio.ImageIO;

public class JavaWalkBufferedImageTest1 extends Component {

    static int contCol = 0;
    static int pixels = 0;
    static int contPos = 0;

    public static void main(String[] args) {

        JavaWalkBufferedImageTest1 javaWalkBufferedImageTest1 = new JavaWalkBufferedImageTest1();

    }

    public void printPixelRGB(int pixel) {
        pixels++;
        int red = (pixel >> 16) & 0xff;
        int green = (pixel >> 8) & 0xff;
        int blue = (pixel) & 0xff;

        String hexRed = Integer.toHexString(red);
        String hexGreen = Integer.toHexString(green);
        String hexBlue = Integer.toHexString(blue);

        if (contCol == 0) {
            System.out.print("\t\t\t");
            System.out.print("DC.L ");
        }
        
        System.out.print("$00");
        System.out.print(hexBlue.contentEquals("0") ? "00" : hexBlue);
        System.out.print(hexGreen.contentEquals("0") ? "00" : hexGreen);
        if (contCol == 5) {
             if(hexRed.length()<2){
                System.out.print(hexRed.contentEquals("0") ? "00" : "0" + hexRed);
            }else{
                System.out.print(hexRed.contentEquals("0") ? "00" : hexRed);
            }
            contCol = 0;
            System.out.print("\n");
        } else {
            if(hexRed.length()<2){
                System.out.print(hexRed.contentEquals("0") ? "00," : "0" + hexRed + ",");
            }else{
                System.out.print(hexRed.contentEquals("0") ? "00," : hexRed + ",");
            }
            contCol++;
            
        }
        

    }

    private void marchThroughImage(BufferedImage image) {
        int w = image.getWidth();
        int h = image.getHeight();
        System.out.println("width, height: " + w + ", " + h);

        for (int i = 0; i < h; i++) {
            //System.out.print("\t\t\t");
            //System.out.print("DC.B ");
            for (int j = 0; j < w; j++) {
                //System.out.println("x,y: " + j + ", " + i);
                if (j < 44) {
                    //System.out.print(j + ", ");	// print X
                } else {
                    //System.out.print(j);	// print X
                }

                //System.out.print(i + ", ");	// print Y
                int pixel = image.getRGB(j, i);
                //printPixelRGB(pixel);
                //System.out.println("");
            }
            //System.out.print("\n");
        }
    }

    public JavaWalkBufferedImageTest1() {
        try {
            System.out.println(this.getClass().getResource(""));
            // get the BufferedImage, using the ImageIO class
            BufferedImage image
                    = ImageIO.read(this.getClass().getResource("diamond.png"));
            marchThroughImage(image);
            System.out.print(pixels);
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
    }

}
