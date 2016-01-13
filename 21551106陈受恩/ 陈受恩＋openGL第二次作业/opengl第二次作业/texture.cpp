//
//  texture.cpp
//  opengl第二次作业
//
//  Created by 陈受恩 on 16/1/12.
//  Copyright © 2016年 chenshouen. All rights reserved.
//

#include <stdio.h>
#include <GLUT/GLUT.h>
#include <OpenGL/gl.h>
#include <OpenGL/glu.h>
#include <SDL2/SDL.h>
#include <cmath>
#include <string>

using namespace std;

static double year_of_sun = 0;
static double year_of_earth = 0, day_of_earth = 0;
static double month_of_moon = 0, day_of_moon = 0;


GLuint uSunTexture;
GLUquadricObj* qSunTexture;
SDL_Surface* pSunTexture = nullptr;

GLuint uEarthTexture;
GLUquadricObj* qEarthTexture;
SDL_Surface* pEarthTexture = nullptr;

GLuint uMoonTexture;
GLUquadricObj* qMoonTexture;
SDL_Surface* pMoonTexture = nullptr;

void myDisplay(){
    glClear(GL_COLOR_BUFFER_BIT);
    glClear(GL_DEPTH_BUFFER_BIT);
    {
        // paint sun
        glPushMatrix();//当前状态压栈
        glEnable(GL_TEXTURE_2D);//启用纹理映射
        // set the light
        GLfloat light_position[] = { 0.0f, 0.0f, 0.0f, 1.0f };
        GLfloat light_ambient[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        GLfloat light_diffuse[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        GLfloat light_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        glLightfv(GL_LIGHT1, GL_POSITION, light_position);
        glLightfv(GL_LIGHT1, GL_AMBIENT, light_ambient);
        glLightfv(GL_LIGHT1, GL_DIFFUSE, light_diffuse);
        glLightfv(GL_LIGHT1, GL_SPECULAR, light_specular);
        // set the texture
        GLfloat sun_ambient[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        GLfloat sun_diffuse[] = { 0.0f, 0.0f, 0.0f, 1.0f };
        GLfloat sun_specular[] = { 0.0f, 0.0f, 0.0f, 1.0f };
        GLfloat sun_emission[] = { 0.5f, 0.5f, 0.5f, 1.0f };
        GLfloat sun_shininess = 30.0f;
        glMaterialfv(GL_FRONT, GL_AMBIENT, sun_ambient);
        glMaterialfv(GL_FRONT, GL_DIFFUSE, sun_diffuse);
        glMaterialfv(GL_FRONT, GL_SPECULAR, sun_specular);
        glMaterialfv(GL_FRONT, GL_EMISSION, sun_emission);
        glMaterialf(GL_FRONT, GL_SHININESS, sun_shininess);
        // bind the texture
        glBindTexture(GL_TEXTURE_2D, uSunTexture);
        glRotatef(-year_of_sun, 0, 0, 1);//旋转角度，所绕的轴
        gluSphere(qSunTexture, 1, 20, 20);//设置球体半径和分割
        
        glDisable(GL_TEXTURE_2D);//关闭纹理映射（避免干扰）
        glPopMatrix();//读取状态栈
    }
    {
        //paint the track of Earth
        glPushMatrix();
        glColor3f(1, 1, 1);
        glRotatef(90, 0, 0, 1);
        glutSolidTorus(0.03, 10, 120, 160);
        glPopMatrix();
        
        //paint the Earth
        glPushMatrix();
        glEnable(GL_TEXTURE_2D);
        
        GLfloat earth_ambient[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        GLfloat earth_diffuse[] = { 0.0f, 0.0f, 0.5f, 1.0f };
        GLfloat earth_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
        GLfloat earth_emission[] = { 0.5f, 0.5f, 0.5f, 1.0f };
        GLfloat earth_shininess = 30.0f;
        glMaterialfv(GL_FRONT, GL_AMBIENT, earth_ambient);
        glMaterialfv(GL_FRONT, GL_DIFFUSE, earth_diffuse);
        glMaterialfv(GL_FRONT, GL_SPECULAR, earth_specular);
        glMaterialfv(GL_FRONT, GL_EMISSION, earth_emission);
        glMaterialf(GL_FRONT, GL_SHININESS, earth_shininess);
        
        glBindTexture(GL_TEXTURE_2D, uEarthTexture);
        
        glColor3f(0, 0.2, 0.6);
        glRotatef(year_of_earth, 0, 0, 1);
        glTranslatef(10, 0, 0);
        glRotatef(day_of_earth, 0, 0, 1);
        gluSphere(qSunTexture,0.6, 14, 10);
        {
            //paint the track of moon
            glPushMatrix();
            glColor3f(1, 1, 1);
            glRotatef(90, 0, 0, 1);
            glutSolidTorus(0.03, 2, 20, 60);
            glPopMatrix();
            
            //paint the moon
            glPushMatrix();
            
            GLfloat moon_ambient[] = { 1.0f, 1.0f, 1.0f, 1.0f };
            GLfloat moon_diffuse[] = { 0.1f, 0.1f, 0.1f, 1.0f };
            GLfloat moon_specular[] = { 1.0f, 1.0f, 1.0f, 1.0f };
            GLfloat moon_emission[] = { 0.5f, 0.5f, 0.5f, 1.0f };
            GLfloat moon_shininess = 30.0f;
            glMaterialfv(GL_FRONT, GL_AMBIENT, moon_ambient);
            glMaterialfv(GL_FRONT, GL_DIFFUSE, moon_diffuse);
            glMaterialfv(GL_FRONT, GL_SPECULAR, moon_specular);
            glMaterialfv(GL_FRONT, GL_EMISSION, moon_emission);
            glMaterialf(GL_FRONT, GL_SHININESS, moon_shininess);
            
            glBindTexture(GL_TEXTURE_2D, uMoonTexture);
            
            glRotatef(month_of_moon, 0, 0, 1);
            glTranslatef(2, 0, 0);
            glRotatef(-day_of_moon, 0, 0, 1);
            gluSphere(qMoonTexture,0.4, 10, 6);
            glPopMatrix();
        }
        glDisable(GL_TEXTURE_2D);
        glPopMatrix();
    }
    {
        glPopMatrix();
    }
    glutSwapBuffers();
    glFlush();
    
}

void MyReshaped(int w,int h){
    glViewport(0, 0, (GLsizei)w, (GLsizei)h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(60, (GLfloat)w / (GLfloat)h, 1, 50);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    gluLookAt(0, 0, 35, 0, 0, 0, 0, 1, 0);//设置摄像机的位置，世界坐标系的原点，摄像机顶部的方向
}

void MyIdle(){
    year_of_sun += 0.9;
    if (year_of_sun >=360) {
        year_of_sun = 0;
    }
    
    month_of_moon += 1;
    if (month_of_moon >= 360) {
        month_of_moon =0;
    }
//    
    year_of_earth += 0.4;
    if (year_of_earth >= 360) {
        year_of_earth = 0;
    }
    
    day_of_earth += 0.4;
    if (day_of_earth >= 360) {
        day_of_earth = 0;
    }
    
    day_of_moon += 3.8;
    if (day_of_moon >= 360) {
        day_of_moon = 0;
    }
    
    glutPostRedisplay();//重绘
    
}
void init()
{
    
    qSunTexture = gluNewQuadric();
    gluQuadricNormals(qSunTexture, GL_SMOOTH);
    gluQuadricTexture(qSunTexture, GL_TRUE);
    
    qEarthTexture = gluNewQuadric();
    gluQuadricNormals(qEarthTexture, GL_SMOOTH);
    gluQuadricTexture(qEarthTexture, GL_TRUE);
    
    qMoonTexture = gluNewQuadric();
    gluQuadricNormals(qMoonTexture, GL_SMOOTH);
    gluQuadricTexture(qMoonTexture, GL_TRUE);
    
    
    glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
    glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
    
    pSunTexture = SDL_LoadBMP("Sun.bmp");
    glGenTextures(1, &uSunTexture);
    glBindTexture(GL_TEXTURE_2D, uSunTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, 3, pSunTexture->w, pSunTexture->h, 0, GL_BGR, GL_UNSIGNED_BYTE, pSunTexture->pixels);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    pEarthTexture = SDL_LoadBMP("Earth.bmp");
    glGenTextures(1, &uEarthTexture);
    glBindTexture(GL_TEXTURE_2D, uEarthTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, 3, pEarthTexture->w, pEarthTexture->h, 0, GL_BGR, GL_UNSIGNED_BYTE, pEarthTexture->pixels);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    pMoonTexture = SDL_LoadBMP("Moon.bmp");
    glGenTextures(1, &uMoonTexture);
    glBindTexture(GL_TEXTURE_2D, uMoonTexture);
    glTexImage2D(GL_TEXTURE_2D, 0, 3, pMoonTexture->w, pMoonTexture->h, 0, GL_BGR, GL_UNSIGNED_BYTE, pMoonTexture->pixels);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    
    glEnable(GL_TEXTURE_2D);
    glEnable(GL_LIGHTING);
    glEnable(GL_LIGHT0);
    glEnable(GL_DEPTH_TEST);
}


int main(int argc, char** argv){
    
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB| GLUT_DEPTH);
    glutInitWindowSize(1000, 800);
    glutInitWindowPosition(50, 50);
    glutCreateWindow("第二次作业－纹理绘球");
    glClearColor(0, 0, 0, 0.8);
    glShadeModel(GL_SMOOTH);
    init();
    glutDisplayFunc(myDisplay);
    glutReshapeFunc(MyReshaped);
    glutIdleFunc(MyIdle);
    
    glutMainLoop();
    
    return 0;
}
