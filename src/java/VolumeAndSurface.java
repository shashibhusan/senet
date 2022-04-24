/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Raghavendra
 */
public class VolumeAndSurface {

    public static void main(String args[])
    {
        float volume_of_cylinder=0;
        float surface_area_of_cylinder=0;
        float radius=9;
        float height=15;

        surface_area_of_cylinder=(2*((float)22/7)*radius*radius)+(2*((float)22/7)*radius*height);

        System.out.println("Total surface area of cylinder : "+surface_area_of_cylinder);

        volume_of_cylinder=(((float)22/7)*radius*radius*height);

        System.out.println("Total Volume of cylinder : "+volume_of_cylinder);
    }

}
