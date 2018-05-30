import greenfoot.*; 
import java.util.List;

public class Robot extends Actor
{
    public Rocket laqueen;
    public double posx,posy,veloc=3;
    public double Aimx,Aimy; 
    private boolean DEAD=false;
    private int jeda=0;
    public void addedToWorld(World Laucher)
    {
        List<Rocket> rockets=getWorld().getObjects (Rocket.class);
        if(rockets!=null && rockets.size()>0)
        {
            laqueen=rockets.get(0);
        }
        
        GreenfootImage image=new GreenfootImage(getImage());
        image.scale((int)(0.5*image.getWidth()), (int)(0.5*image.getHeight()));
        setImage(image);
        Aimx=posx=getX();
        Aimy=posy=getY();
    }
    
    public void move ()
    {
        double rx=Aimx-posx;
        double ry=Aimy-posy;
        double r=Math.sqrt(rx*rx+ry*ry);
          
        if(r>20)
        {
       double angle=Math.atan2(ry,rx)*180/Math.PI;
        int direction=Main.getDirection(getRotation(), (int)angle);
        
        int bts=3;
        if(Math.abs(direction)>bts) {
            direction=(direction<0)?-bts:bts;
        }
        direction+=getRotation();
       
        posx+=veloc*Math.cos(1.0*direction*Math.PI/180);
        posy+=veloc*Math.sin(1.0*direction*Math.PI/180);
        
        setLocation((int)posx,(int)posy);
        setRotation(direction);
    }
    
 }
 
 public void Hancur()
    {
        DEAD=true;
        for(int i=0; i<10;i++){
           Pecahan peachan=new Pecahan();
           getWorld().addObject(peachan,getX()-50+Greenfoot.getRandomNumber(100),getY()-50+Greenfoot.getRandomNumber(100));
           GreenfootImage img=new GreenfootImage(20,20);
           img.drawImage(getImage(),-Greenfoot.getRandomNumber(getImage().getWidth()),-Greenfoot.getRandomNumber(getImage().getHeight()));
           peachan.setImage(img);
    }
    }
    
    public void checkRocket()
    {
       Actor rocket=getOneIntersectingObject(Rocket.class);
       if(rocket!=null){
           ((Rocket)rocket).Hancur();
           Hancur();
        }
    }

  public void act()
    {
       if(DEAD)getWorld().removeObject(this);
       else{
       if(laqueen!=null && !laqueen.DEAD){
           Aimx=laqueen.getX();
           Aimy=laqueen.getY();
   }else{
   //size of robots
       if (jeda==0) {
        Aimx=Greenfoot.getRandomNumber(getWorld().getWidth());
        Aimy=Greenfoot.getRandomNumber(getWorld().getHeight());
        jeda=100;
    }
}
   move();
   checkRocket();
   if(jeda>0)jeda--;
}
}
}
