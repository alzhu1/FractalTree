private double fractionLength = .75; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(1000,1000);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(500,1000,500,850);   
	drawBranches(500,850,150,3*Math.PI/2);  //will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here  
	double angle1 = angle - branchAngle;
	double angle2 = angle + branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1)+x);
	int endY1 = (int)(branchLength*Math.sin(angle1)+y);	
	int endX2 = (int)(branchLength*Math.cos(angle2)+x);
	int endY2 = (int)(branchLength*Math.sin(angle2)+y);
	branchLength*=fractionLength;
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
public void keyPressed()
{
	if(key=='w')
	{
		if(fractionLength<.75)
		{
			fractionLength+=.05;
		}
		redraw();
	}
	if(key=='s')
	{
		fractionLength-=.05;
		redraw();
	}
	if(key=='a')
	{
		branchAngle-=.05;
		redraw();
	}
	if(key=='d')
	{
		branchAngle+=.05;
		redraw();
	}
}